#!/usr/bin/env python3
import sys
import subprocess
def trim_to_range(volume):
    volume=int(volume)
    if volume>150:
        volume=150
    elif volume<0:
        volume=0
    return volume
def set_volume(volume):
    subprocess.call("pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo "+str(volume)+'%')
def get_volume():
    current=subprocess.check_output('amixer','-D','pulse','get','Master')
    return current
if __name__ == '__main__':
    command = sys.argv[1]
    if command == 'set':
        set_volume(trim_to_range(sys.argv[2]))
    elif command == 'up':
        new_volume = trim_to_range(int(get_volume()) + int(sys.argv[2]))
        print(get_volume())
        set_volume(new_volume)
    elif command == 'down':
        new_volume = trim_to_range(int(get_volume()) - int(sys.argv[2]))
        set_volume(new_volume)
    elif command=='get':
        print(get_volume())
    

