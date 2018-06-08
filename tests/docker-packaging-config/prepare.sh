#!/bin/bash

set -e

npm install

cp -R $PROJECT_DIR/node_modules $PACKAGING_FILES/
