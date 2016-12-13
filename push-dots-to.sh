#!/bin/bash
ssh-copy-id "$@"
rsync -a server_dots/ "$@:~"
