#!/usr/bin/env bash

echo "Entry.sh: START - updating settings from Env Args"
GF_PATHS_PROVISIONING=/var/smartem/provisioning

# Substitute settings from env
envsubst < /var/smartem/templates/datasources/influxdb.yml > ${GF_PATHS_PROVISIONING}/datasources/influxdb.yml

echo "Entry.sh: END - updating settings"

# runnit
/run.sh