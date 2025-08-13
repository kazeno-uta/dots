#!/bin/bash

# Get clean cursor X and Y (remove any whitespace or newline)
CUR_POS=$(hyprctl cursorpos)
CUR_X=$(echo "$CUR_POS" | cut -d',' -f1 | tr -d '[:space:]')
CUR_Y=$(echo "$CUR_POS" | cut -d',' -f2 | tr -d '[:space:]')

amount=$1

# Get monitor data from hyprctl
# Get monitor data from hyprctl
MONITOR_INFO=$(hyprctl monitors -j | jq -r --arg x "$CUR_X" --arg y "$CUR_Y" '
  .[] | select(
    (.x <= ($x | tonumber)) and 
    (.x + .width > ($x | tonumber)) and 
    (.y <= ($y | tonumber)) and 
    (.y + .height > ($y | tonumber))
  ) | "\(.name)"
')

# Parse name
read -r MON_NAME <<< "$MONITOR_INFO"

# change brightness of current screen
if [[ "$MON_NAME" == "DP-3" ]]; then
	bus=8

elif [[ "$MON_NAME" == "HDMI-A-1" ]]; then
	bus=5
fi

#get current value
output=$(ddcutil --bus 5 getvcp 10)

read -r _ _ _ _ _ _ _ _ current _ _ _ max <<< "$output"

current=`echo $current | sed 's/.\{1\}$//'`

if ([ $current -gt 0 ] && [ $1 = "-" ]) || ([ $current -lt 100 ]&&[ $1 = "+" ]); then
  ddcutil --bus $bus setvcp 10 $@
fi


