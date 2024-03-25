#!/bin/bash
# usage: beep.sh [BEEPCOUNT] [BEEPDURATION] [PAUSEDURATION]

# Output raw passed parameters
echo "Raw parameters: $@"

# Default values
BEEPCOUNT=${1:-3}
BEEPDURATION=${2:-0.1}
PAUSEDURATION=${3:-0.5}

# Output all passed parameters
echo "Beep count: $BEEPCOUNT, beep duration: $BEEPDURATION, pause duration: $PAUSEDURATION"


# Function to play a beep
play_beep() {
    echo 1 > /sys/class/gpio/gpio82/value
    sleep $BEEPDURATION
    echo 0 > /sys/class/gpio/gpio82/value
}

# Play the beep for the specified count
for (( i=0; i<BEEPCOUNT; i++ )); do
    play_beep
    sleep $PAUSEDURATION
done
