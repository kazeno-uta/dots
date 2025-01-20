layout=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

if [ "$layout" == "master" ]; then
  hyprctl keyword general:layout dwindle
  notify-send -i "$HOME/.config/hypr/scripts/assets/hyprland.png" "Layout" "Dwindle"
else
  hyprctl keyword general:layout master
  notify-send -i "$HOME/.config/hypr/scripts/assets/hyprland.png" "Layout" "Master"
fi
