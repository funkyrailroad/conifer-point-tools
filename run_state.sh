#!/bin/bash
set -e

if [ $# -le 1 ]
    then
    echo "Provide min and max lambda as arguments"
    exit 1
fi

TOOLS_HOME=`dirname $0`
source $TOOLS_HOME/run_staterc

MIN_LAMBDA=$1
MAX_LAMBDA=$2

for (( i = $MIN_LAMBDA; i <= $MAX_LAMBDA; i++ ))
do
    LAMBDA=$i

    # A new directory will be created for each value of lambda and
    # at each step in the workflow for maximum organization.

    mkdir Lambda_$LAMBDA
    cd Lambda_$LAMBDA

    ##############################
    # ENERGY MINIMIZATION STEEP  #
    ##############################
    echo "Starting minimization for lambda = $LAMBDA..." 

    mkdir EM
    cd EM

    # Iterative calls to grompp and mdrun to run the simulations

    $GMX/gmx grompp -f $MDP/em_steep_$LAMBDA.mdp -c $FREE_ENERGY/morph.gro \
        -p $FREE_ENERGY/morph.top -o min$LAMBDA.tpr \
        -maxwarn 1

    $GMX/gmx mdrun -deffnm min$LAMBDA

    sleep 10

    #####################
    # NVT EQUILIBRATION #
    #####################
    echo "Starting constant volume equilibration..."

    cd ../
    mkdir NVT
    cd NVT

    $GMX/gmx grompp -f $MDP/nvt_$LAMBDA.mdp -c ../EM/min$LAMBDA.gro \
        -p $FREE_ENERGY/morph.top -o nvt$LAMBDA.tpr \
        -maxwarn 2

    $GMX/gmx mdrun -deffnm nvt$LAMBDA

    echo "Constant volume equilibration complete."

    sleep 10

    #####################
    # NPT EQUILIBRATION #
    #####################
    echo "Starting constant pressure equilibration..."

    cd ../
    mkdir NPT
    cd NPT

    $GMX/gmx grompp -f $MDP/npt_$LAMBDA.mdp -c ../NVT/nvt$LAMBDA.gro \
        -p $FREE_ENERGY/morph.top -t ../NVT/nvt$LAMBDA.cpt -o npt$LAMBDA.tpr \
        -maxwarn 2

    $GMX/gmx mdrun -deffnm npt$LAMBDA

    echo "Constant pressure equilibration complete."

    sleep 10

    #################
    # PRODUCTION MD #
    #################
    echo "Starting production MD simulation..."

    cd ../
    mkdir Production_MD
    cd Production_MD

    $GMX/gmx grompp -f $MDP/md_$LAMBDA.mdp -c ../NPT/npt$LAMBDA.gro \
        -p $FREE_ENERGY/morph.top -t ../NPT/npt$LAMBDA.cpt -o md$LAMBDA.tpr \
        -maxwarn 2

    $GMX/gmx mdrun -deffnm md$LAMBDA

    echo "Production MD complete."

    # End
    echo "Ending. Job completed for lambda = $LAMBDA"

    cd $FREE_ENERGY
done

exit;
