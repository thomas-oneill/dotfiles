[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec i3 --force-xinerama -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
xmodmap /home/tomato/.Xmodmap
