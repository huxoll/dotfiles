#!/bin/bash

GDRIVE=~/GoogleDrive

rclone sync -v gdrive:Games/Huxoll\'s\ Vault $GDRIVE/Games/Huxoll\'s\ Vault
rclone sync -v gdrive:Projects/CodeVault/Code\ Vault $GDRIVE/CodeVault
rclone sync -v gdrive:010_Politics $GDRIVE/Politics
cd $GDRIVE/Games

# Export
cd $GDRIVE/Games
obsidian-export Huxoll\'s\ Vault Huxolls-Vault-Exported
cd $GDRIVE
obsidian-export CodeVault CodeVault-Exported
cd $GDRIVE
obsidian-export Politics/Politics Politics-Exported

