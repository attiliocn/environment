#!/bin/bash

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

SOURCE_DIR="$PWD"
TARGET_DIR="$1"

logfile=/tmp/rclone-sync_"$timestamp".log

source_dir=$(realpath "$SOURCE_DIR")
target_dir=$TARGET_DIR

rclone sync \
  $source_dir $target_dir \
  --verbose --progress \
  --checkers=8 --transfers=8 --max-backlog=500000 \
  --log-file "$logfile" \
  --checksum \

echo "Done"
