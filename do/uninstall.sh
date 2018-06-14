#!/bin/bash
set -e

if [ "$VIRTUAL_ENV" = "" ]; then
    echo "A virtual environment is not active.  Quitting."
    return 1
fi

pip freeze | xargs pip uninstall -y

echo
echo "Finished uninstalling."
echo
