#! /bin/bash
# run from a morph directory (same level as complex, solvated and vacuum
set -e

if [ $# -le 1 ]
    then
    echo "Provide min and max lambda as arguments"
    exit 1
fi

MIN_LAMBDA=$1
MAX_LAMBDA=$2

cd complex
echo "\nRunning complex\n\n"
run_state.sh $MIN_LAMBDA $MAX_LAMBDA

cd ../solvated
echo "\nRunning solvated\n\n"
run_state.sh $MIN_LAMBDA $MAX_LAMBDA
cd ..
