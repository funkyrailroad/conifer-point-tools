#! /bin/bash

GMX=~/build/gromacs/bin


for i in `find . | grep gro$`
do
    $GMX/gmx editconf -f $i -o ${i/gro/pdb}
done
