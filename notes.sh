#!/bin/bash
if [ ! -f "notes.zip" ]; then
	sudo apt update
	sudo apt install unzip obsidian -y
	wget https://github.com/Crazyhead90/pythontools/raw/refs/heads/main/notes.zip
	unzip ./notes.zip
else
	echo "Notes already exist"
fi

obsidian
