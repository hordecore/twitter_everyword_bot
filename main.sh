#!/bin/bash

set -eu

MAINDIR=/opt/softdriven
DICT=$MAINDIR/nouns
LAST_LINE_FILE=$MAINDIR/last_line

create_new_list() {
	if [ ! -f $LAST_LINE_FILE ]; then
		cat $DICT
		return 0
	fi
	read line < $LAST_LINE_FILE
	grep -A 10000 -w "$line" $DICT | grep -vw "$line"
	
}

main_loop() {
	while read line; do	
		software_driven_tweet "Software driven $line"
		echo $(date) $line >> $MAINDIR/log
		echo $line > $LAST_LINE_FILE
		sleep $((30*60))
	done
}

main() {
	create_new_list | main_loop
}

main
