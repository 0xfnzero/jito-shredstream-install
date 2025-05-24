#!/bin/bash

set -e
export RUST_LOG=info

# 配置
PID_FILE="shredstream.pid"
LOG_FILE="shredstream.log"
rm -f "$LOG_FILE"

# 检查并停止旧进程
if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat "$PID_FILE")
    if ps -p "$OLD_PID" > /dev/null 2>&1; then
        echo "Found running process with PID $OLD_PID. Stopping..."
        kill "$OLD_PID"
        sleep 1
        if ps -p "$OLD_PID" > /dev/null 2>&1; then
            echo "Process $OLD_PID did not exit, force killing..."
            kill -9 "$OLD_PID"
        fi
        echo "Stopped previous process."
    else
        echo "Found stale PID file. Removing..."
    fi
    rm -f "$PID_FILE"
fi

# 启动新进程
echo "Starting new jito-shredstream-proxy..."

nohup /root/shredstream-proxy/jito-shredstream-proxy shredstream \
    --block-engine-url https://amsterdam.mainnet.block-engine.jito.wtf \
    --desired-regions amsterdam \
    --auth-keypair /root/shred_keypair.json \
    --dest-ip-ports 127.0.0.1:8001 \
    --grpc-service-port 10800 \
    > "$LOG_FILE" 2>&1 &

NEW_PID=$!
echo "$NEW_PID" > "$PID_FILE"
echo "Started with PID $NEW_PID. Logs at $(pwd)/$LOG_FILE"