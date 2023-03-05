#!/bin/bash

cd server-go

make setup

make up

echo "Starting server-go in local mode"
export APP_ENV=local
echo "APP_ENV: $APP_ENV"
make run