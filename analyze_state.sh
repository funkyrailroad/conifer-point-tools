#! /bin/bash

GMX=~/build/gromacs/bin

# start in top level of state folder
mkdir xvg-files
cd xvg-files
for i in `find .. -name md*.xvg`
do
    ln -s $i .
done
gmx bar -f md*.xvg -o -oi
