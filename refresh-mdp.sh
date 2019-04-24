#! /bin/bash
# first argument has to be state name (i.e. complex, solvated, vacuum)

if [ $# -eq 0 ]
    then
    echo "Provide state name as argument"
    exit 1
fi

STATE=$1
MAX_LAMBDA=$2
cp ~/tools/mdp-templates/$STATE/* .
generate_mdp.sh $MAX_LAMBDA *template.mdp
