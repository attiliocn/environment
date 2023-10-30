# Define backup directory and borg repository paths

timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

BORG_DIR="/mnt/wsl/PHYSICALDRIVE3p1/borg/pictures"
TARGET_DIR="$HOME""/windata/pictures"

# Define logfile path
logfile="$HOME"/logs/"$timestamp"_borg_pictures.log

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
echo "Target Size: $(du -sh "$target_dir")"
echo "Logfile: "$logfile"" 
borg create --stats "$borg_dir"::"$timestamp" *
cd "$HOME"
