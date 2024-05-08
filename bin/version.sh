#!/usr/bin/env bash

SQL_DIR=.

JOB_NAME=version

CMD="/usr/bin/mysql -D bugtracker "

OPTS="-s"
COMMAND_1="$CMD $OPTS < $SQL_DIR/$JOB_NAME.sql"
	
eval "$COMMAND_1"
