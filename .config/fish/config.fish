if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
    hyprctl splash
    set fish_greeting
end
zoxide init fish | source
alias cd=z
alias nv=nvim 
