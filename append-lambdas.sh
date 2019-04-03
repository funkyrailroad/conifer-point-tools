#! /bin/bash


# for a given state, take from pre-lambdas and append lambda file to each and
# write to correct files
# ARGUMENTS
# have to provide the state (i.e. vacuum, solvated, complex)
# and name of lambda file (i.e. fep-lambda, original)
set -e

HOME=~/tools/mdp-templates
STATE=$1
LAMBDA_FILE=$2
LAMBDA_SEQUENCE=$HOME/lambda-sequences/$LAMBDA_FILE
PRE_LAMBDA_TEMPLATES=$HOME/pre-lambda-templates/$STATE
OUTPUT_DIR=$HOME/$STATE

cd $PRE_LAMBDA_TEMPLATES
for i in *.mdp
do
    cat $i $LAMBDA_SEQUENCE > $OUTPUT_DIR/$i
done
