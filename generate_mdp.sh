#! /bin/bash

MAX_LAMBDA=$1
for ARG in "${@:2}"
do
    BASE=${ARG%.*}
    echo $BASE

    for ((i=0; i <= $MAX_LAMBDA; i++))
    do
        sed "s/%L%/$i/g" $ARG > ${BASE/_template/}_$i.mdp
    done
done
