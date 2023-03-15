#!/bin/bash

cd server-py

sudo pip install virtualenv

virtualenv -p python3 venv 

python3 -m venv venv

source venv/bin/activate

pip install -r requirements.txt

python manage.py migrate

echo "Starting server-py in local mode"
export APP_ENV=local
echo "APP_ENV: $APP_ENV"
python manage.py runserver 9090
