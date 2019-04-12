#!/usr/bin/env bash

YARN='yarn'

echo "checking for Yarn"

YARN_INSTALLED=$(npm list --depth 1 --parseable=true --global $YARN > /dev/null 2>&1)

if [ "$YARN_INSTALLED" == "" ]; then
    npm install -g yarn webpack webpack-cli webpack-dev-server @webpack-cli/init
fi