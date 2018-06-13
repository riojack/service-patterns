#!/bin/bash

FLASK_APP=./src/app/app.py pyenv exec flask run --host=127.0.0.1 --port=3057 &>/dev/null &

app_pid=$!

trap "{ echo 'Killing flask app on port ${app_pid}'; kill ${app_pid} }" SIGINT SIGTERM

sleep 1

pyenv exec pytest ./src/test/integration

kill ${app_pid}


