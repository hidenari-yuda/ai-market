#!/bin/bash

if [ $1 = dev ]; then
  echo "Starting front-end in development mode"
  export DOTENV_CONFIG_PATH=front-user/config/.env.dev

elif [ $1 = prd ]; then
  echo "Starting front-end in production mode"
  export DOTENV_CONFIG_PATH=front-user/config/.env.prd

else
  echo "Starting front-end in local mode"
  export DOTENV_CONFIG_PATH=front-user/config/.env.local

fi

yarn start