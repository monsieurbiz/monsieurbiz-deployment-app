#!/bin/bash -l

set -o errexit -o nounset -o xtrace

function run_pre_build_hook() {
  if [ -z "${PAGAIO_CC_PRE_BUILD_HOOK:-}" ]; then
    return
  fi
  bash -l -c ${PAGAIO_CC_PRE_BUILD_HOOK}
}

function prepare_application() {
  wget -q -O application.tgz "${PAGAIO_ARTIFACT_URL}"
  tar xvzf application.tgz
  rm -f application.tgz
}

prepare_application
run_pre_build_hook
