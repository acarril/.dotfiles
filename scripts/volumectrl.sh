#!/bin/sh
# Get active sink:
SINK=$(pactl list short sinks | grep RUNNING | cut -c1-1)
# If no active sink then set SINK to internal speakers:
if [ -z "$SINK" ];
then
	SINK=0
fi
# Modify sink volume:
pactl set-sink-volume $SINK $1%
# Store (new) current sink volume:
VOL=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
# Send notification:
notify-send "Volume  [ $VOL % ]" "Sink  [ $SINK ]" -h string:synchronous:volume
