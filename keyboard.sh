#!/bin/bash

{
    notify-send "Running xmodmap"

    export DISPLAY=:0

    xmodmap /home/ponder/.Xmodmap

}
# >> /home/ponder/XMM_LOG 2>&1

# chown ponder /home/ponder/XMM_LOG

