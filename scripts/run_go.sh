#!/bin/bash

if [ $1 = dev ]; then
  echo "Starting server-go in development mode"
  cd server-go
  export APP_ENV=dev
  echo "APP_ENV: $APP_ENV"
  make run

elif [ $1 = prd ]; then
  echo "Starting server-go in production mode"
  cd server-go
  export APP_ENV=prd
  echo "APP_ENV: $APP_ENV"
  make run

else
  echo "Starting server-go in local mode"
  cd server-go
  export APP_ENV=local
  echo "APP_ENV: $APP_ENV"
  make run

fi