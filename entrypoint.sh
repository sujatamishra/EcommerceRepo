#!/bin/sh

echo "Waiting for mysql..."

while ! nc -z db 3306; do
  sleep 0.1
done

echo "Mysql started"

python3 manage.py flush --no-input
python3 manage.py migrate
python3 manage.py collectstatic --no-input --clear


exec "$@"
