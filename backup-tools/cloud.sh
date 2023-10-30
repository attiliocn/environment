#!/bin/bash

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

BORG_DIR='/mnt/wsl/PHYSICALDRIVE3p1/borg/'

if [ ! -d $BORG_DIR ]; then
  echo "BORG dir does not exist"
  exit
fi

logfile="$HOME"/logs/"$timestamp"_borg_cloud.log

source_dir=$(realpath "$BORG_DIR")
target_dir="acn:/backups/borg"

rclone sync \
  $source_dir $target_dir\
  --verbose --progress \
  --checkers=8 --transfers=8 --max-backlog=500000 \
  --log-file "$logfile" \
  --checksum \

echo "Done"
