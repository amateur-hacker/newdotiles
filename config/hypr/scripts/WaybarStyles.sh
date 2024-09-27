#!/bin/bash

# Check which waybar theme is set
THEMEIS=$(basename $(realpath ~/.config/waybar/style.css) | cut -d '.' -f 1)

# Change theme
if [ "$THEMEIS" == "style1" ]; then
  SWITCHTO="style2"
  # hyprctl keyword layerrule "blur,waybar"
  # hyprctl keyword layerrule "blurpopups,waybar"
  # hyprctl keyword layerrule "ignorealpha 0.2,waybar"
else
  SWITCHTO="style1"
  # sed -i 's/, "custom\/separator#dot-line"//g' ~/.config/waybar/config.jsonc
fi

# Set the waybar theme
THEMEFILE="$HOME/.config/waybar/${SWITCHTO}.css"
if [ -f "$THEMEFILE" ]; then
  ln -sf "$THEMEFILE" "$HOME/.config/waybar/style.css"
else
  echo "Error: $THEMEFILE not found"
  dunstify "Error: $THEMEFILE not found"
  exit 1
fi

pkill waybar && hyprctl dispatch exec waybar

# Restart waybar
# Kill already running process
# _ps=(waybar mako dunst)
# for _prs in "${_ps[@]}"; do
#   if [[ $(pidof ${_prs}) ]]; then
#     pkill ${_prs}
#   fi
# done

# exec ~/.config/hypr/scripts/Refresh.sh
