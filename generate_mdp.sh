#! /bin/bash

BASE=${1%.*}
MAX_LAMBDA=0

for ((i=0; i <= $MAX_LAMBDA; i++))
do
    sed "s/%L%/$i/g" $1 > ${BASE}_$i.mdp
done
