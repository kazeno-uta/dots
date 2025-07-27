#!/bin/bash

# Get clean cursor X and Y (remove any whitespace or newline)
CUR_POS=$(hyprctl cursorpos)
CUR_X=$(echo "$CUR_POS" | cut -d',' -f1 | tr -d '[:space:]')
CUR_Y=$(echo "$CUR_POS" | cut -d',' -f2 | tr -d '[:space:]')

# Get monitor data from hyprctl
MONITOR_INFO=$(hyprctl monitors -j | jq -r --arg x "$CUR_X" --arg y "$CUR_Y" '
  .[] | select(
    (.x <= ($x | tonumber)) and 
    (.x + .width > ($x | tonumber)) and 
    (.y <= ($y | tonumber)) and 
    (.y + .height > ($y | tonumber))
  ) | "\(.name) \(.x) \(.y) \(.width) \(.height)"
')

# Parse values
read -r MON_NAME MON_X MON_Y MON_W MON_H <<< "$MONITOR_INFO"

# Optional: pick a different style per monitor
if [[ "$MON_H" == 1440 ]]; then
	STYLE="/home/max/dots/.config/wofi/style-1440.css"

else
	STYLE="/home/max/dots/.config/wofi/style-1080.css"
fi

 wofi "$@" --style "$STYLE"