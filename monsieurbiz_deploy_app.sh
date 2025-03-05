#!/bin/bash -l

set -o errexit -o nounset -o xtrace

function run_pre_build_hook() {
  if [ -z "${MONSIEURBIZ_CC_PRE_BUILD_HOOK:-}" ]; then
    return
  fi
  bash -l -c ${MONSIEURBIZ_CC_PRE_BUILD_HOOK}
}


function download_artifact() {
  if [ -f "${APP_HOME}/.s3cfg" ]; then
    s3cmd --config="${APP_HOME}/.s3cfg" get "${MONSIEURBIZ_ARTIFACT_URL}" application.tgz

    return
  fi

  wget -q -O application.tgz "${MONSIEURBIZ_ARTIFACT_URL}"
}

function prepare_application() {
  download_artifact
  tar xvzf application.tgz
  rm -f application.tgz
}

function prepare_s3cfg() {
  # Check if the source file exists and CELLAR_BACKUP_KEY_ID env var exists,and perform the substitution
  if [ -f "${APP_HOME}/s3cfg.dist" ] && [ -n "${CELLAR_BACKUP_KEY_ID:-}" ]; then
    envsubst < "${APP_HOME}/s3cfg.dist" > "${APP_HOME}/.s3cfg"
  fi
}

prepare_s3cfg
prepare_application
run_pre_build_hook
