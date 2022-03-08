#!/bin/bash

read -p 'Name space: ' spacename
index="$(yabai -m query --spaces --space | jq '.index')"
yabai -m space $index --label $spacename
echo Name of space changed to $spacename
