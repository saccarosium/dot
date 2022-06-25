#!/usr/bin/env bash

TITLE="$1"

SCREEN_WIDTH=2880
SCREEN_HEIGHT=1800

TERM_WIDTH=1280
TERM_HEIGHT=1260

(("X=SCREEN_WIDTH/2-TERM_WIDTH/2"))
(("Y=SCREEN_HEIGHT/2-TERM_HEIGHT/2"))

alacritty -t "${TITLE}" -o window.position.x="${X}" -o window.position.y="${Y}" -o window.dimensions.lines=20 -o window.dimensions.columns=80 -o window.decorations=none -e "$1"
