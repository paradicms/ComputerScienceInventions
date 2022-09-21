#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

export PYTHONPATH=$PWD/etl:$PWD/gui/loader
source $PWD/gui/loader/venv/bin/activate

OUTPUT_DATA=ComputerScienceInventions-gui
OUTPUT_FORMAT=bootstrap-collection

python3 gui-action/action.py --debug 1 --dev --configuration-file-path ComputerScienceInventions/configuration.json --id ComputerScienceInventions --input-data ComputerScienceInventions --input-format markdown --output-data $OUTPUT_DATA --output-format $OUTPUT_FORMAT
