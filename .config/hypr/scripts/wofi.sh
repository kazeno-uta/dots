if [pgrep wofi != null]; then
	pkill wofi
fi
wofi --show drun
