#!/bin/bash

if [ $1 = dev ]; then
  echo "Starting front-end in development mode"
  export DOTENV_CONFIG_PATH=config/.env.dev

elif [ $1 = prd ]; then
  echo "Starting front-end in production mode"
  export DOTENV_CONFIG_PATH=config/.env.prd

else
  echo "Invalid argument"
  export DOTENV_CONFIG_PATH=config/.env.local

fi

go run ./server-go/main.go