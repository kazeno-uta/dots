
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

function fish_greeting
    set clipboard (wl-paste --primary)
    if not contains kitty $clipboard and not contains rm $clipboard
        eval "$clipboard"
    else
        echo "may do bad stuff ;-;"
    end
end



alias pacnews="arch_news_check"

alias off="ddcutil --bus 5 setvcp D6 4 & ddcutil --bus 8 setvcp D6 5 & wait && shutdown now"
alias :q=exit
alias nv=nvim
zoxide init fish | source
alias cd=z