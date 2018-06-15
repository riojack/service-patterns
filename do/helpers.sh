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
