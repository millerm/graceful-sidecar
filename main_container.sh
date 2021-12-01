#!/bin/bash -e

MAIN_CONTAINER_CMD=$@
TMP_POD_DIR="/tmp/pod"
TERMINATED_FILE="/tmp/pod/main-terminated"

echo "Launching Main Container: $@"

$MAIN_CONTAINER_CMD

notify_temination() {
    [ ! -d $TMP_POD_DIR ] && mkdir -p $TMP_POD_DIR
    
    touch $TERMINATED_FILE
}

trap notify_temination EXIT

