#!/bin/bash
rclone mount \
    -v \
    --dir-cache-time 5m \
    --vfs-read-chunk-size 8M \
    --vfs-read-chunk-size 100M \
    --vfs-cache-mode writes \
    --vfs-cache-max-size 4G \
    --vfs-cache-max-age 6h \
    chembox:home "$HOME"/cloud/chembox
