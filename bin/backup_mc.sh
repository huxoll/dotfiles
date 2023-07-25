#!/bin/bash

timestamp=$(date "+%Y%m%d_%H%M%S")

mv ~/Google\ Drive/050_Backups/saves/Huxollopia ~/.backups/Huxollopia.$timestamp || (echo "Removing old backup failed!" && exit 1)
cp -r ~/Library/Application\ Support/minecraft/saves/Huxollopia ~/Google\ Drive/050_Backups/saves
