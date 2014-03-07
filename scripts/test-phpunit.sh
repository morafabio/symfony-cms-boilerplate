#!/bin/sh

PARENT_DIR=$(dirname $(cd "$(dirname "$0")"; pwd))
cd "$PARENT_DIR"
source "$PARENT_DIR/scripts/shared.sh"

phpunit -c app/
