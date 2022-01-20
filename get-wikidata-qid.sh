#!/bin/bash

cd `dirname "$(readlink -f "$0")"`

QID=$1

export PYTHONPATH="$PYTHONPATH:$PWD/../paradicms/etl"

source ../paradicms/etl/venv/bin/activate
python3 -m paradicms_etl.pipelines.wikidata_qid_to_markdown_directory_pipeline \
  --data-dir-path .paradicms \
  --markdown-directory-path . \
  --pipeline-id ComputerScienceInventions \
  $QID

rm -fr license
rm -fr rights_statement
