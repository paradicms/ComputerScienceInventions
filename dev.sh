#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

PROJECTS_DIR_PATH=$PWD/..
DATA_DIR_PATH=$PROJECTS_DIR_PATH/paradicms/data/ComputerScienceInventions

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/markdown-etl-action/action.py \
  --cache-directory-path $DATA_DIR_PATH/cached \
  --loaded-data-directory-path $DATA_DIR_PATH/loaded \
  --markdown-directory-path $PROJECTS_DIR_PATH/ComputerScienceInventions \
  --pipeline-id ComputerScienceInventions \
  "$@"

poetry run $PROJECTS_DIR_PATH/ssg-action/action.py \
  --cache-directory-path $DATA_DIR_PATH/cached \
  --data-path $DATA_DIR_PATH/loaded \
  --dev \
  --pipeline-id ComputerScienceInventions
