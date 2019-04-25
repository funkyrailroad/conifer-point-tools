#! /bin/bash
# first argument has to be state name (i.e. complex, solvated, vacuum)


if [ $# -le 1 ]
    then
    echo "Provide state name and max lambda as argument"
    exit 1
fi

echo "Did you rerun append-lambda.sh?"

STATE=$1
MAX_LAMBDA=$2
cp ~/tools/mdp-templates/$STATE/* .
generate_mdp.sh $MAX_LAMBDA *template.mdp
