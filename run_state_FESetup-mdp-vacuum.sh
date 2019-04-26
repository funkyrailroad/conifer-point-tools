#!/bin/bash
set -e

TOOLS_HOME=`dirname $0`
source $TOOLS_HOME/run_staterc

for (( i = $MIN_LAMBDA; i <= $MAX_LAMBDA; i++ ))
do
    LAMBDA=$i

    # A new directory will be created for each value of lambda and
    # at each step in the workflow for maximum organization.

    mkdir Lambda_$LAMBDA
    cd Lambda_$LAMBDA

    #################
    # PRODUCTION MD #
    #################
    echo "Starting production MD simulation..."

    mkdir Production_MD
    cd Production_MD

    # Iterative calls to grompp and mdrun to run the simulations

    $GMX/gmx grompp -f $MDP/_vac_$LAMBDA.mdp -c $FREE_ENERGY/morph.gro -p $FREE_ENERGY/morph.top -o md$LAMBDA.tpr

    $GMX/gmx mdrun -deffnm md$LAMBDA

    sleep 10

    # End
    echo "Ending. Job completed for lambda = $LAMBDA"

    cd $FREE_ENERGY

done

exit;
