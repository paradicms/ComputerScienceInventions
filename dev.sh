#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

PROJECTS_DIR_PATH=$PWD/..
DATA_DIR_PATH=$PROJECTS_DIR_PATH/paradicms/data/ComputerScienceInventions

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/markdown-etl-action/action.py \
  --data-directory-path $DATA_DIR_PATH \
  --markdown-directory-path $PROJECTS_DIR_PATH/ComputerScienceInventions \
  --pipeline-id ComputerScienceInventions \
  "$@"

poetry run $PROJECTS_DIR_PATH/ssg-action/action.py \
  --data-directory-path $DATA_DIR_PATH \
  --dev \
  --pipeline-id ComputerScienceInventions
