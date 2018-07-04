#!/bin/bash

do_flask_up_check() {
	max_checks=30
	checks=0
	reached_flask_app=0
	status_code=000

	while [ $reached_flask_app -eq 0 -a $checks -lt $max_checks ]; do
		next_status_code=$(curl -I --output /dev/null --silent --head --write-out "%{http_code}" http://localhost:3057 | head -n 1 | cut -d$' ' -f2)

		status_code=$next_status_code

		checks=$[$checks+1]
		if [ $status_code -eq 404 ]; then
			reached_flask_app=1
			break
		fi

	done

	if [ $reached_flask_app -eq 0 ]; then
        echo
		printf "Failed to see Flask app come up within %d seconds. Quitting..." $[$sleep_amount_seconds * $max_checks]
        echo
		exit 1
	fi
}

printf "Starting application..."
FLASK_APP=./src/app.py pyenv exec flask run --host=127.0.0.1 --port=3057 &>./output_during_acceptance.log &

printf "waiting for service to become accessible..."

do_flask_up_check

echo -e '\e[32mSTARTED.\e[0m'

app_pid=$!

trap "{ echo 'Killing flask app on port ${app_pid}'; kill ${app_pid} }" SIGINT SIGTERM

pyenv exec py.test -vvl --gherkin-terminal-reporter --feature ./features ./test/acceptance

printf "Killing application..."
kill ${app_pid}
echo -e "\e[32mDONE.\e[0m"
