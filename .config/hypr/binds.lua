---------------------------------
------ KEYBINDINGS CLASSIC ------
---------------------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "thunar"
local menu = "~/.config/hypr/scripts/wofi.sh"

hl.bind("SUPER + L", hl.dsp.exec_cmd("uwsm app -- hyprlock"))

hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("uwsm app -- gnome-system-monitor"))
hl.bind("CTRL + SHIFT + Zenkaku_Hankaku", hl.dsp.exec_cmd("uwsm app -- gnome-system-monitor"))

hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + ALT + C", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("uwsm app -- hyprpicker -a"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- thunar"))
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

hl.bind("SUPER + ALT + N", hl.dsp.exec_cmd("uwsm app -- hyprsunset -t 2500"))
hl.bind("SUPER + ALT + SHIFT + N", hl.dsp.exec_cmd("uwsm app -- pkill hyprsunset"))

hl.bind("SUPER + F", hl.dsp.exec_cmd("uwsm app -- zen-browser"))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen())

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + page_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + page_down", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + X", hl.dsp.window.move({ workspace = "special:magic", follow = false }))
hl.bind("SUPER + D", hl.dsp.workspace.toggle_special("discord"))

hl.bind("SUPER + mouse_down", hl.dsp.layout("rollnext"))
hl.bind("SUPER + mouse_up", hl.dsp.layout("rollprev"))

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("uwsm app -- swaync-client -t -sw"))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("uwsm app -- ~/.config/hypr/scripts/brightness.sh + 5 &"), {
	locked = true,
	repeating = true,
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("uwsm app -- ~/.config/hypr/scripts/brightness.sh - 5 &"), {
	locked = true,
	repeating = true,
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("uwsm app -- pamixer -t"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("uwsm app -- pamixer -d 5"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("uwsm app -- pamixer -i 5"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("uwsm app -- playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("uwsm app -- playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("uwsm app -- playerctl previous"), { locked = true })

hl.bind("print", hl.dsp.exec_cmd("uwsm app -- hyprshot -m active -m window --clipboard-only"))
hl.bind("SUPER + print", hl.dsp.exec_cmd("uwsm app -- hyprshot -m region --clipboard-only -z"))
hl.bind("SUPER + SHIFT + s", hl.dsp.exec_cmd("uwsm app -- hyprshot -m region --clipboard-only -z"))

hl.bind("SUPER + tab", hl.dsp.layout("swapwithmaster"))

hl.bind("SUPER + ALT + up", hl.dsp.layout("orientationtop"))
hl.bind("SUPER + ALT + left", hl.dsp.layout("orientationleft"))
hl.bind("SUPER + ALT + right", hl.dsp.layout("orientationright"))
hl.bind("SUPER + ALT + down", hl.dsp.layout("orientationbottom"))
hl.bind("SUPER + ALT + slash", hl.dsp.layout("orientationcenter"))

hl.bind("SUPER + M", hl.dsp.layout("addmaster"))
hl.bind("SUPER + SHIFT + M", hl.dsp.layout("removemaster"))
hl.bind("SUPER + SHIFT + tab", hl.dsp.workspace.swap_monitors({ monitor1 = "DP-3", monitor2 = "HDMI-A-1" }))

hl.bind(
	"SUPER + mouse:274",
	hl.dsp.exec_cmd(
		'kitty --config ~/.config/kitty/dropdown.conf -o allow_remote_control=yes --class=kitty-dropdown --title=kitty-dropdown env XDG_CONFIG_HOME=/tmp/empty fish --init-command "source ~/.config/fish/empty.fish"'
	)
)
-- no worky
hl.bind("SUPER + ALT + CTRL + down", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,0"))
hl.bind("SUPER + ALT + CTRL + right", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,1"))
hl.bind("SUPER + ALT + CTRL + up", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,2"))
hl.bind("SUPER + ALT + CTRL + left", hl.dsp.exec_cmd("hyprctl keyword monitor DP-3,preferred,0x0,1,transform,2"))
