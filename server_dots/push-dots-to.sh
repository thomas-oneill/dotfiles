#!/bin/bash
ssh-copy-id "$@"
rsync -a ./* "$@:"
