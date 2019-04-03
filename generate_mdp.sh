#! /bin/bash

for ARG in "$@"
do
    BASE=${ARG%.*}
    MAX_LAMBDA=10

    for ((i=0; i <= $MAX_LAMBDA; i++))
    do
        sed "s/%L%/$i/g" $ARG > ${BASE/template/$i}.mdp
    done
done
