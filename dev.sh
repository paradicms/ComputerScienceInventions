#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

PROJECTS_DIR_PATH=$PWD/..
PROJECT_DIR_PATH=$PROJECTS_DIR_PATH/ComputerScienceInventions
CACHE_DIR_PATH=$PROJECT_DIR_PATH/.paradicms/cache
LOADED_DATA_DIR_PATH=$PROJECT_DIR_PATH/.paradicms/data

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/directory-etl-action/action.py \
  --cache-directory-path $CACHE_DIR_PATH \
  --input-directory-path $PROJECT_DIR_PATH \
  --loaded-data-directory-path $LOADED_DATA_DIR_PATH \
  --pipeline-id ComputerScienceInventions \
  "$@"

poetry run $PROJECTS_DIR_PATH/ssg-action/action.py \
  --cache-directory-path $CACHE_DIR_PATH \
  --data-path $LOADED_DATA_DIR_PATH \
  --dev \
  --pipeline-id ComputerScienceInventions
