#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

PROJECTS_DIR_PATH=$PWD/..
DATA_DIR_PATH=$PROJECTS_DIR_PATH/paradicms/data/ComputerScienceInventions

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/directory-etl-action/action.py \
  --cache-directory-path $DATA_DIR_PATH/cached \
  --input-directory-path $PROJECTS_DIR_PATH/ComputerScienceInventions \
  --loaded-data-directory-path $DATA_DIR_PATH/loaded \
  --pipeline-id ComputerScienceInventions \
  "$@"

poetry run $PROJECTS_DIR_PATH/ssg-action/action.py \
  --cache-directory-path $DATA_DIR_PATH/cached \
  --data-path $DATA_DIR_PATH/loaded \
  --dev \
  --pipeline-id ComputerScienceInventions
