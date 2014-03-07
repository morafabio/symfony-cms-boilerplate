#!/bin/sh

PARENT_DIR=$(dirname $(cd "$(dirname "$0")"; pwd))
cd "$PARENT_DIR"
source "$PARENT_DIR/scripts/shared.sh"

# php app/console doctrine:database:create

php app/console doctrine:migrations:migrate --no-interaction
php app/console doctrine:fixtures:load -n
