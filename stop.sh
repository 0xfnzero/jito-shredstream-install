#!/bin/bash

PID_FILE="shredstream.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    echo "Stopping process $PID..."
    kill "$PID"
    rm "$PID_FILE"
    echo "Stopped."
else
    echo "No PID file found."
fi