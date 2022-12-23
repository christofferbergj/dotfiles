#!/usr/bin/env bash

windows="$(yabai -m query --spaces --space | jq '.windows')"

if [[ $windows == *","* ]]
then
  yabai -m config window_border on
else
  yabai -m config window_border off
fi

