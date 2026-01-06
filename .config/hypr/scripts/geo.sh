#!/bin/fish

set changed false
set windowId ""

function handle
  switch $argv[1] 
    case 'activewindow>>zen*GeoGuessr*changed=false*'
      set changed true
      swww img -t wipe wallpaper/geoguessr_map_2025-2.png --transition-angle 200 -o HDMI-A-1 --transition-duration 0.9 --resize fit --fill-color 65A6E0FF

    case 'activewindowv2*changed=true*id='
      set windowId (string match -r '>>\w+' $argv[1] | string replace '>>' '')

    case 'activewindow>>zen*changed=true*'
      set hyprctlOut (string match -r 'Window \w+' (hyprctl activewindow) | string replace 'Window ' '')
      if test $hyprctlOut = $windowId -a (echo $argv[1] | grep -q "GeoGuessr"; echo $status) -ne 0
        swww img -t wipe wallpaper/crosscode2.gif --transition-angle 160 -o HDMI-A-1 --transition-duration 0.9
        set changed false
        set windowId ""
      end
  end
end

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -l line
    handle "$line changed=$changed id=$windowId"
end
