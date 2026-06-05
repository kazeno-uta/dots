if status is-interactive
    pfetch
    set fish_greeting 'Hello there !'
    hyprctl splash
    # Commands to run in interactive sessions can go here
end

function arch_news_check
    echo "🔔 Latest Arch Linux news:"
    curl -s https://archlinux.org/news/ | grep -Eo 'href="/news/[^"]+"' | cut -d'"' -f2 | head -n 5 | sed 's|^|https://archlinux.org|'

    echo
    read -l -P "Do you want to continue with the system upgrade? [y/N] " answer
    if test "$answer" = y -o "$answer" = Y
        yay
    else
        echo "⏹️ Upgrade cancelled."
    end
end

alias pacnews="arch_news_check"

alias off="ddcutil --bus 5 setvcp D6 4 & ddcutil --bus 8 setvcp D6 5 & wait && shutdown now"
alias :q=exit
alias nv=nvim
zoxide init fish | source
alias cd=z
alias connect="/opt/cisco/secureclient/bin/vpn connect ssl-vpn1.aau.dk"
alias disconnect="/opt/cisco/secureclient/bin/vpn disconnect"

# Created by `pipx` on 2025-03-05 21:21:47
set PATH $PATH /home/max/.local/bin
