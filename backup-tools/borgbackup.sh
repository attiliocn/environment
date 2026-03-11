#!/bin/bash

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")



# Define backup directory and borg repository paths
BORG_DIR=$1
TARGET_DIR=$2
BKP_MODE=$3

# If no mode is provided, default to "local"
if [ -z "$BKP_MODE" ]; then
    BKP_MODE="local"
fi

# Define logfile path
logfile=/tmp/borg-create_"$timestamp".log


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
target_dir=$(realpath "$TARGET_DIR")

# Set the BORG_DIR variable based on the backup mode
if [ "$BKP_MODE" == "local" ]; then
    # Check if BORG_DIR exist
    if [ ! -d "$BORG_DIR" ]; then
        echo "BORG dir does not exist"
        exit
    fi
    # Get realpath
    borg_dir=$(realpath "$BORG_DIR")
elif [ "$BKP_MODE" == "remote" ]; then
    borg_dir="$BORG_DIR"
fi

# Run borg create
cd "$target_dir"
echo "Starting BORG Backup"
echo "Borg Directory: "$borg_dir""
echo "Target Directory: "$target_dir""
echo "Logfile: "$logfile"" 
borg create --stats --progress "$borg_dir"::"$timestamp" *
cd "$HOME"