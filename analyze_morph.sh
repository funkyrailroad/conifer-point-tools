#! /bin/bash
set -e

TOOLS_PATH=/mnt/projects-neuse/jake/tools/
STATES=`\ls -d */  `

for STATE in $STATES
do
    cd $STATE
    # if xvg-files doesn't exist
    analyze_state.sh > /dev/null
    cd ..
    pwd
done

for STATE in $STATES
do
    cd $STATE/xvg-files
    printf "\n$STATE\b values\n"
    python $TOOLS_PATH/plot_gromacs_free_energy_diff.py
    cd ../..
done
