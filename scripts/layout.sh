#!/bin/bash

# First we append the saved layout of worspace N to workspace M
i3-msg 'workspace 1; append_layout ~/.i3/workspace-2.json'

# And finally we fill the containers with the programs they had
urxvt -e tty-clock -b &
urxvt -e gotop &
urxvt -e ncmpcpp  &
