#!/bin/sh

TOKEN=$1
APP_ID=$2
VERSION_ID=$3
FORCE=$4
WORKING_DIR=$5

mapps init -t $TOKEN


if [ -z "$APP_ID" ]; then
  APP_ID_ARG=""
else
  APP_ID_ARG="-a $APP_ID"
fi

if [ -z "$VERSION_ID" ]; then
  VERSION_ID_ARG=""
else
  VERSION_ID_ARG="-v $VERSION_ID"
fi

if [ -z "$FORCE" ]; then
  FORCE_ARG=""
else
  FORCE_ARG="-f"
fi

if [ -n "$WORKING_DIR" ] && [ "$WORKING_DIR" != "." ]; then
  echo "Changing to working directory: $WORKING_DIR"
  cd "$WORKING_DIR" || { echo "Failed to change to directory $WORKING_DIR"; exit 1; }
fi

mapps app:deploy $APP_ID_ARG $VERSION_ID_ARG $FORCE_ARG


