#!/bin/bash

set -e

db_host="$1"
db_port="$2"
db_password="$3"
db_name="$4"
shift 4
cmd="$@"



python /app/wait-for-mysql.py -h $db_host -P $db_port -p $db_password -d $db_name
python3 manage.py makemigrations
python3 manage.py migrate
python3 manage.py createsuperuserwithpassword --username admin1 --password admin1 --email admin1@gmail.com


exec $cmd