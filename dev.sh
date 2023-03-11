#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

PROJECTS_DIR_PATH=$PWD/..

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/markdown-ssg-action/action.py \
  --app work-search \
  --app-configuration $PROJECTS_DIR_PATH/ComputerScienceInventions/app-configuration.json \
  --dev \
  --markdown-directory-path $PROJECTS_DIR_PATH/ComputerScienceInventions \
  --pipeline-id ComputerScienceInventions

