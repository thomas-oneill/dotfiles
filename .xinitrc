[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xmodmap "$HOME/.Xmodmap"
exec i3 --force-xinerama -V >> ~/i3log-"$(date +'%F-%k-%M-%S')" 2>&1
