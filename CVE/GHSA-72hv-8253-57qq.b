#!/bin/bash

set -euo pipefail
. /.functions

ARTIFACT_IDS=(
	com.fasterxml.jackson.core:jackson-annotations@WEBAPP_LIB_DIR
)

set_or_default BASE_DIR "/app"
set_or_default HOME_DIR "${BASE_DIR}/solr"
set_or_default SERVER_DIR "${HOME_DIR}/server"
set_or_default WEBAPP_DIR "${SERVER_DIR}/solr-webapp/webapp"
set_or_default WEBAPP_LIB_DIR "${WEBAPP_DIR}/WEB-INF/lib"

export WEBAPP_LIB_DIR
export POST_CALL="fix-jar-sum"
exec fix-jars "GHSA-72hv-8253-57qq" "2.21" "${ARTIFACT_IDS[@]}"
