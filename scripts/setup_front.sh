#!/bin/bash

cd front-user

yarn install

echo "Starting front-end in local mode"

export DOTENV_CONFIG_PATH=front-user/config/.env.local

yarn start