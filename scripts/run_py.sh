#!/bin/bash

if [ $1 = dev ]; then
  echo "Starting server-go in development mode"
  cd server-py
  export APP_ENV=dev
  echo "APP_ENV: $APP_ENV"
  source venv/bin/activate
  python manage.py runserver 9090

elif [ $1 = prd ]; then
  echo "Starting server-go in production mode"
  cd server-py
  export APP_ENV=prd
  echo "APP_ENV: $APP_ENV"
  source venv/bin/activate
  python manage.py runserver 9090

else
  echo "Starting server-go in local mode"
  cd server-py
  export APP_ENV=local
  echo "APP_ENV: $APP_ENV"
  source venv/bin/activate
  python manage.py runserver 9090

fi