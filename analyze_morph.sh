#! /bin/bash

cd solvated
analyze_state.sh
cd ../complex
analyze_state.sh
cd xvg-files
echo
echo "Complex Values"
echo
python ~/tools/plot_gromacs_free_energy_diff.py
cd ../../solvated/xvg-files
echo
echo "Solvated Values"
echo
python ~/tools/plot_gromacs_free_energy_diff.py
