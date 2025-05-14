#!/usr/bin/env bash

dir="~/dotfiles/waybar"
theme='style-1'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
