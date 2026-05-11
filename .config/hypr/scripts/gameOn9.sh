windowId=""
handle() {
  case $1 in
  openwindow*',9,'*)
    notify-send "moving zen to workspace 9"
    windowId="${1#*>>}"        # remove 'openwindow>>'
    windowId="${windowId%%,*}" # remove everything after first comma
    hyprctl dispatch 'hl.dsp.window.move({ workspace = "2", follow = false, window = "class:zen" })'    ;;

  closewindow*"$windowId")
    hyprctl dispatch 'hl.dsp.window.move({ workspace = "1", window = "class:zen" })'
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
