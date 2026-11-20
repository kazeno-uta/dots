#!/usr/bin/env fish

set MODE $argv[1]

if test "$MODE" = "add"
    # Optional: switch to a specific Hyprland config when Lily58 is plugged
    # cp ~/.config/hypr/hyprland_lily58.conf ~/.config/hypr/hyprland.conf
    notify-send hi
    hyprctl reload
else if test "$MODE" = "remove"
    # Optional: restore default Hyprland config when Lily58 is unplugged
    # cp ~/.config/hypr/hyprland_default.conf ~/.config/hypr/hyprland.conf
    notify-send bye
    hyprctl reload
end
