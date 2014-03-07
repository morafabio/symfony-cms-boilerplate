#!/bin/sh

_command_exists () {
  type "$1" >/dev/null 2>&1 ;
}

_bower_check () {
    if ! _command_exists "bower"; then
        echo "Could not find bower, please install it (eg. sudo npm install -g bower)."
        echo "Build failed."
        exit 1
    fi
}

_composer_initialize () {
  if [ ! -f "composer.phar" ]; then
    echo "Could not find composer.phar, downloading it now..."
    _download "http://getcomposer.org/composer.phar"
  fi
  /usr/bin/env php composer.phar install
}

_bower_install_in () {
    CURRENT_DIR="${2:-$(pwd)}"
    echo "Running bower install in: $1"
    cd "$1"
    bower install
    cd "$CURRENT_DIR"
}

_download () {
  OUTPUT_DIR="${2:-$(pwd)}"

  if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir "$OUTPUT_DIR"
  fi

  if _command_exists "wget" ; then
    wget -q -P "$OUTPUT_DIR" "$1"
  elif _command_exists "curl" ; then
    ( cd "$OUTPUT_DIR" > /dev/null ; curl --silent -O "$1" ; )
  else
    echo "Cannot download $1 [missing wget or curl]"
    exit 1
  fi
}