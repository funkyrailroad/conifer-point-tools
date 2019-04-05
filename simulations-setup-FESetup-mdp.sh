#! /bin/bash

# This should be run right after FESetup and right before the main job.sh
# script
#set -e
#set -x

BASE_DIR=`pwd`
PERTURBATIONS=$BASE_DIR/_perturbations/gromacs/
MDP_TEMPLATES=~/tools/mdp-templates

mkdir Production
cd Production
mkdir `\ls ../_perturbations/gromacs/`

for MORPH_PATH in `\ls`
do
    cd ${MORPH_PATH}
    FESETUP_MORPH=$PERTURBATIONS/$MORPH_PATH

    # populate state folders with position and top files
    # structure of vacuum files and complex/solvated are different
    mkdir vacuum
    cd vacuum
    cp $FESETUP_MORPH/morph.{top,gro} .
    cp $FESETUP_MORPH/pert.{atp,itp} .
    mkdir MDP
    cd MDP
    cp $FESETUP_MORPH/_vac.mdp .
    cd ..
    cd ..


    # not every morph pair will have complex and solvated files, this finds
    # out which ones are present
    cd $FESETUP_MORPH
    STATES=`\ls -d */`
    cd -

    for STATE in $STATES
    do
        mkdir $STATE
        cd $STATE
        cp $FESETUP_MORPH/$STATE/morph.{top,gro} .
        cp $FESETUP_MORPH/$STATE/pert.{atp,itp} .
        mkdir MDP
        cd MDP
        cp $FESETUP_MORPH/$STATE/_sol.mdp .
        cd ..
        cd ..
    done

    cd ..
done
