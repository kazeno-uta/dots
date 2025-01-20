if status is-interactive
    # Commands to run in interactive sessions can go here
    uwufetch
    hyprctl splash | cowsay -f tux
    set fish_greeting
end
zoxide init fish | source
alias cd=z
alias nv=nvim
alias off="shutdown now"
alias BetterDiscord="~/Downloads/BetterDiscord-Linux.AppImage"
alias LS=sl
alias rtfm=man
alias maxwell=" mpv -loop=inf --fs --mute 'https://www.youtube.com/watch?v=kOG0_qjKWEI'"
alias mimir= "systemctl suspend"

# Created by `pipx` on 2024-11-29 12:10:43
set PATH $PATH /home/max/.local/bin
