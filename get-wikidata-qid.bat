@ECHO OFF

cd %~dp0
for %%I in (.) do set CurrDirName=%%~nxI

pushd ..\etl
CALL poetry run python -m paradicms_etl.pipelines.wikidata_qid_to_markdown_directory_pipeline --data-dir-path ..\%CurrDirName%\.paradicms --markdown-directory-path ..\%CurrDirName% --pipeline-id ComputerScienceInventions %1
popd

rm -fr license
rm -fr rights_statement
