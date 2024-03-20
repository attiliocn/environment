#!/bin/bash

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

# Define backup directory and borg repository paths
BORG_DIR=$1
TARGET_DIR=$2

# Define logfile path
logfile=/tmp/borg-create_"$timestamp".log

# Check if BORG_DIR exist
if [ ! -d $BORG_DIR ]; then
  echo "BORG dir does not exist"
  exit
fi

# Check if TARGET_DIR exist and is not empty
if [ -d "$TARGET_DIR" ]; then
    if [ ! "$(ls -A $TARGET_DIR)" ]; then
        echo "Directory '$TARGET_DIR' exists but is empty."
        exit
    fi
else
    echo "Directory '$TARGET_DIR' does not exist."
    exit
fi

# Get realpaths for bkp dir and borg dir
borg_dir=$(realpath "$BORG_DIR")
target_dir=$(realpath "$TARGET_DIR")

# Run borg create
cd "$target_dir"
echo "Starting BORG Backup"
echo "Borg Directory: "$borg_dir""
echo "Target Directory: "$target_dir""
echo "Logfile: "$logfile"" 
borg create --stats --progress "$borg_dir"::"$timestamp" *
cd "$HOME"
