#!/usr/bin/env bash

SQL_DIR=.

CMD="/usr/bin/mysql -D bugtracker "

OPTS="-s"

PROJECT_ID=`$CMD $OPTS -e "SELECT id FROM mantis_project_table WHERE name = '$1'"`
	
$CMD $OPTS -e "UPDATE mantis_project_version_table SET obsolete = 1 WHERE project_id = $PROJECT_ID and version = '$2'"
