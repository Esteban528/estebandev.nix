#!/usr/bin/env bash
# bash /home/estebandev/Dev/bin/Calendar/todo.sh
# kill any running instances if they exist
eww kill

eww daemon

# start a bar for each monitor
# monitors=$(hyprctl monitors -j | jq '.[] | .id')
# monitors=$(hyprctl monitors -j | jq '.[] | .id' | wc -l)

eww open bar
/home/estebandev/Dev/bin/Calendar/todo.sh
# eww open bar0
# if [ $monitors -gt 1 ]; then
# 	for ((i = 1 ; i <= $monitors ; i++)); do
# 		eww open bar${i}
# 	done
# fi
