if status is-interactive
    uwufetch
    hyprctl splash
    # Commands to run in interactive sessions can go here
end

alias off="shutdown now"
alias :q=exit
alias betterdiscord="~/Downloads/BetterDiscord-Linux.AppImage"
alias nv=nvim
zoxide init fish | source
alias cd=z
alias maxwell="mpv 'https://www.youtube.com/watch?v=kOG0_qjKWEI' --loop=inf --fs --mute"
