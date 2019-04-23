#! /bin/bash
# run from a morph directory (same level as complex, solvated and vacuum
set -e

cd complex
echo "\nRunning complex\n\n"
run_state.sh

cd ../solvated
echo "\nRunning solvated\n\n"
run_state.sh
cd ..
