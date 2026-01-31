#!/bin/fish

function handle
  switch $argv[1] 
    case 'activelayout>>keychron-keychron-k8-*'
      cp ~/.config/hypr/classic.binds ~/.config/hypr/binds.conf && hyprctl reload
      notify-send "changed config for standard keyboards"

    case 'activelayout>>pandakb.com-lily58-rgb,*'
      cp ~/.config/hypr/split.binds ~/.config/hypr/binds.conf && hyprctl reload
      notify-send "changed config for split keyboards"
  end
end

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -l line
    handle "$line changed=$changed id=$windowId"
end
