#!/bin/sh

PARENT_DIR=$(dirname $(cd "$(dirname "$0")"; pwd))
cd "$PARENT_DIR"
source "$PARENT_DIR/scripts/shared.sh"

_composer_initialize
_bower_check
_bower_install_in "$PARENT_DIR/src/FabioMora/Bundle/WebBundle/"

php app/console assets:install --symlink
