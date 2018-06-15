#!/bin/bash

printf "Starting application..."
FLASK_APP=./src/app/app.py pyenv exec flask run --host=127.0.0.1 --port=3057 &>./output_during_acceptance.log &
echo -e "\e[32mSTARTED.\e[0m"

app_pid=$!

trap "{ echo 'Killing flask app on port ${app_pid}'; kill ${app_pid} }" SIGINT SIGTERM

sleep 1

pyenv exec py.test -vvl --gherkin-terminal-reporter --feature src/features ./src/test/acceptance

printf "kill application..."
kill ${app_pid}
echo -e "\e[32mDONE.\e[0m"


