#!/bin/bash -e

SIDE_CAR_CMD=$@
TERMINATED_FILE="/tmp/pod/main-terminated"

launch_main_container() {
    echo "Launching Side Car Container: $@"
    $SIDE_CAR_CMD
}

watch_for_termination() {
    while true; do
        if [[ -f $TERMINATED_FILE ]]; then
            kill $SIDE_CAR_PID
        fi
        
        sleep 5
    done
}

cleanup() {
    wait $SIDE_CAR_PID &&
    if [[ -f $TERMINATED_FILE ]]; then
        exit 0
    fi
}

launch_main_container &
SIDE_CAR_PID=$! && watch_for_termination &
cleanup

