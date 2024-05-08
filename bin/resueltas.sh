#!/usr/bin/env bash

SQL_DIR=.

JOB_NAME=version

CMD="/usr/bin/mysql -D bugtracker "

OPTS=""
	
$CMD $OPTS -e "SELECT c.name as 'categoria', LPAD(b.id, 7, \"0\") as 'ID', b.version as 'viene de' ,b.summary as 'descripcion' FROM bugtracker.mantis_bug_table b inner join bugtracker.mantis_category_table c on b.category_id = c.id where b.fixed_in_version = '$1' and b.status = 80"
