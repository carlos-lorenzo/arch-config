#!/bin/bash

ACTIVE=$(hyprctl activewindow -j)
TITLE=$(echo $ACTIVE | jq -r '.title')
LENGTH=${#TITLE}
MAX_LENGTH=100
if [[ "$TITLE" == "null" ]] || [[ "$TITLE" == "" ]]; then
	TEXT=" $(whoami)@archlinux"
	TOOLTIP="$(uname -s) $(uname -r)"
elif [[ $LENGTH -ge $MAX_LENGTH ]]; then
	TEXT="${TITLE:0:$MAX_LENGTH}..."
	TOOLTIP="class: $(echo $ACTIVE | jq -r '.class')\nxwayland: $(echo $ACTIVE | jq -r '.xwayland')"
else
	TEXT="${TITLE}"
	TOOLTIP="class: $(echo $ACTIVE | jq -r '.class')\nxwayland: $(echo $ACTIVE | jq -r '.xwayland')"
fi

JSON=$(echo "{\"text\":\"${TEXT}\", \"tooltip\":\"${TOOLTIP}\"}" | sed 's/&/\&amp;/g')

echo "${JSON}"