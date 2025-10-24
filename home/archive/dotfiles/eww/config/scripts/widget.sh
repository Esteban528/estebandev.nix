#!/usr/bin/env bash

FILE="$HOME/.cache/${KEY}.eww_launch.xyz"
STATUS_FILE="${FILE}.status"

if [ ! -f "$STATUS_FILE" ]; then
  eww open widget
  touch $STATUS_FILE
  eww update tasks="$(bash /home/estebandev/Dev/bin/Calendar/todo.sh)"
else
  rm "$STATUS_FILE"
  eww close widget
fi
