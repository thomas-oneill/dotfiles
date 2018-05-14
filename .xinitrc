[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xmodmap "$HOME/.Xmodmap"
exec i3 --force-xinerama
