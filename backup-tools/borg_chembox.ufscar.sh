#!/bin/bash

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

# Define backup directory and borg repository paths
BORG_DIR="$HOME"/cloud/chembox/borg/ufscar.chembox
TARGET_DIR="$HOME"/projects/ufscar

# Define logfile path
logfile=/tmp/borg-create_"$timestamp".log

# Check if both backup dir and borg dir exists
if [ ! -d $BORG_DIR ]; then
  echo "BORG dir does not exist"
  exit
elif [ ! -d $TARGET_DIR ]; then
  echo "TARGET dir does not exist"
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
