#!/bin/bash


for index in $(yabai -m query --windows --space | jq '.[]' | jq '.id')
do
  yabai -m window $index --toggle border
done
