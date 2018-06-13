#!/bin/bash
set -e

if ! [ -x "$(command -v pyenv)" ]; then
    echo "Please install pyenv plus the pyenv-virtualenv wrapper in order to use this project."
    return 1
fi

if ! [[ $(pyenv virtualenvs) =~ "service-patterns" ]]; then
    pyenv install -s 2.7.14
    pyenv virtualenv 2.7.14 service-patterns
fi

if [ "$VIRTUAL_ENV" = "" ]; then
    echo "Virtual environment did not activate."
    return 1
fi

pyenv exec pip install -Ur requirements.txt

echo
echo -e "Virtual environment \e[32mACTIVATED.\e[0m"
echo -e "Pip dependencies \e[32mINSTALLED.\e[0m"
echo
