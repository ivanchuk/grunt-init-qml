#!/bin/bash

set -e

echo_msg() {
  local readonly msg=$1
  echo "~~~ build-and-run: $msg"
}

exit_error() {
  local readonly msg=$1
  echo_msg "Terminating with error(s): $msg"
  exit 1
}

[ $# -eq 1 ] || exit_error "usage: build-and-run.sh <proyect-name>"

name=$1

qmake
make

killall ${name} || true
./${name}
