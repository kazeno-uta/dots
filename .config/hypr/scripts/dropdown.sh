#!/usr/bin/env fish
#

set  pid (pgrep -f 'kitty.*--class=kitty-dropdown')
set  wsp (hyprctl activeworkspace | grep ID|awk '{print $3}' | grep -oE '^\s*[0-9]+')
set  drop (hyprctl workspaces | grep dropdown)

if test -n "$drop"
                hyprctl dispatch movetoworkspace $wsp,pid:$pid
        else
                hyprctl dispatch movetoworkspacesilent dropdown,pid:$pid
end