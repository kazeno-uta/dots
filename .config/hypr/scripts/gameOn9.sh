windowId=""
handle() {
  case $1 in
  openwindow*',9,'*)
    windowId="${1#*>>}"        # remove 'openwindow>>'
    windowId="${windowId%%,*}" # remove everything after first comma
    hyprctl dispatch movetoworkspacesilent 2, class:zen
    ;;

  closewindow*"$windowId")
    hyprctl dispatch movetoworkspace 1, class:zen
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
