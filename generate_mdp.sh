#! /bin/bash

MAX_LAMBDA=10

for ARG in "$@"
do
    BASE=${ARG%.*}
    echo $BASE

    for ((i=0; i <= $MAX_LAMBDA; i++))
    do
        sed "s/%L%/$i/g" $ARG > ${BASE/_template/}_$i.mdp
    done
done
