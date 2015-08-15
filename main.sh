#!/bin/bash

set -eux

create_new_list() {
	if [ -f /opt/softdriven/last_line ]; then
		read line < /opt/softdriven/last_line
		grep -A 10000 -w "$line" /opt/softdriven/nouns | grep -vw "$line"
		return 0
	fi
	cat /opt/softdriven/nouns
}

main_loop() {
	while read line; do	
		software_driven_tweet "Software driven $line"
		echo $(date) $line >> /opt/softdriven/log
		echo $line > /opt/softdriven/last_line
		sleep $((30*60))
	done
}

main() {
	create_new_list | main_loop
}

main
