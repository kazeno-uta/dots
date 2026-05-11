-------------------------------
------ KEYBINDINGS SPLIT ------
-------------------------------

-- See https://wiki.hyprland.org/Configuring/Keywords/
-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local menu = "~/.config/hypr/scripts/wofi.sh"

-- Lock screen
hl.bind("SUPER + L", hl.dsp.exec_cmd("uwsm app -- hyprlock"))

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("gnome-system-monitor"))
hl.bind("SUPER + SHIFT + Zenkaku_Hankaku", hl.dsp.exec_cmd("gnome-system-monitor"))

hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + ALT + C", hl.dsp.window.close())

hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("uwsm app -- hyprpicker -a"))
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(
	"SUPER + SPACE",
	hl.dsp.exec_cmd("sh -c 'choice=\"$(" .. menu .. " --show drun -b -I -i --define=drun-print_desktop_file=true)\"; [ -n \"$choice\" ] && gtk-launch \"$(basename \"${choice%.desktop}\")\"'")
)
hl.bind(
	"SUPER + SHIFT + SPACE",
	hl.dsp.exec_cmd('xdg-open "$(fd . ~ | ' .. menu .. " --dmenu -i -p 'Search Files')\"")
)

hl.bind(
	"SUPER + V",
	hl.dsp.exec_cmd("uwsm app -- sh -c 'cliphist list | " .. menu .. " --dmenu -b -I | cliphist decode | wl-copy'")
)

hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("uwsm app -- pkill waybar && waybar"))

hl.bind("SUPER + ALT + N", hl.dsp.exec_cmd("hyprsunset -t 2500"))
hl.bind("SUPER + ALT + SHIFT + N", hl.dsp.exec_cmd("pkill hyprsunset"))

hl.bind("SUPER + i", hl.dsp.exec_cmd("zen-browser"))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen())

-- Move focus with mainMod + arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + e", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + r", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + f", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + a", hl.dsp.focus({ direction = "down" }))



for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({workspace = i }))
end

-- Cycleworkspaces
hl.bind("SUPER + page_up", hl.dsp.focus({workspace = "e+1" }))
hl.bind("SUPER + page_down", hl.dsp.focus({workspace = "e-1" }))


-- Example specialworkspace (scratchpad)
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({workspace = "special:magic" }))
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))


-- display discord & deezer special worSPACE
hl.bind("SUPER + D", hl.dsp.workspace.toggle_special("discord"))

-- Scroll through existingworkspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.layout("rollnext"))
hl.bind("SUPER + mouse_up", hl.dsp.layout("rollprev"))


-- Move/resize windows
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x= 100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x= -100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x= 0, y = -100, relative = true }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x= 0, y = 100, relative = true }))

-- notifications
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("uwsm app -- swaync-client -t -sw"))

-- Brightness and music control
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("uwsm app -- ~/.config/hypr/scripts/brightness.sh + 5 &"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("uwsm app -- ~/.config/hypr/scripts/brightness.sh - 5 &"), { locked = true, repeating = true })


hl.bind("XF86AudioMute", hl.dsp.exec_cmd("uwsm app -- pamixer -t"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("uwsm app -- pamixer -d 5"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("uwsm app -- pamixer -i 5"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("uwsm app -- playerctl play-pause -- the stupid key is called play , but it toggles "))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("uwsm app -- playerctl next "))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("uwsm app -- playerctl previous"))

-- screenshot
hl.bind("print", hl.dsp.exec_cmd("uwsm app -- hyprshot -m active -m window --clipboard-only"))
hl.bind("SUPER + print", hl.dsp.exec_cmd("uwsm app -- hyprshot -m region --clipboard-only -z "))
hl.bind("SUPER + SHIFT + s", hl.dsp.exec_cmd("uwsm app -- hyprshot -m region --clipboard-only -z "))

-- Master layout controls
hl.bind("SUPER + tab", hl.dsp.layout("swapwithmaster"))

hl.bind("SUPER + ALT + up", hl.dsp.layout("orientationtop"))
hl.bind("SUPER + ALT + down", hl.dsp.layout("orientationbottom"))
hl.bind("SUPER + ALT + left", hl.dsp.layout("orientationleft"))
hl.bind("SUPER + ALT + right", hl.dsp.layout("orientationright"))
hl.bind("SUPER + ALT + slash", hl.dsp.layout("orientationcenter"))

hl.bind("SUPER + M", hl.dsp.layout("addmaster"))
hl.bind("SUPER + SHIFT + M", hl.dsp.layout("removemaster"))

-- swap monitor
hl.bind("SUPER + SHIFT + tab", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-3", monitor2 = "HDMI-A-1" }))


-- kitty dropdown auto command from clipboard (might not be safe uwu)
hl.bind("SUPER + mouse:274", hl.dsp.exec_cmd("kitty --config ~/.config/kitty/dropdown.conf -o allow_remote_control=yes --class=kitty-dropdown --title=kitty-dropdown env XDG_CONFIG_HOME=/tmp/empty fish --init-command \"source ~/.config/fish/empty.fish\""))
-- bind = SUPER, mouse:274, exec, kitty @ --to (ls /tmp/kitty-dropdown-socket* | head -n1 | sed 's/^/unix:/') send-text "$(wl-paste --primary)\n"

--rotatation 
hl.bind("SUPER + ALT + CTRL + down", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,0"))
hl.bind("SUPER + ALT + CTRL + up", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,2"))
hl.bind("SUPER + ALT + CTRL + left", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,2"))
hl.bind("SUPER + ALT + CTRL + right", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,1"))
