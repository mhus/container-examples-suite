#!/bin/sh

COLORS=(red, green, blue, yellow, pink, purple, orange, brown, black, white, gray, cyan)
COLORS_TEXT=(green, blue, yellow, pink, purple, orange, brown, white, white, black, cyan, red)
COLOR=${COLOR:-"blue"}
MESSAGE=${MESSAGE:-"Hello World!"}
COLOR_TEXT=${COLOR_TEXT:-"white"}
RANDOM_COLOR=${RANDOM_COLOR:-"false"}
if ([ "$RANDOM_COLOR" = "true" ]); then
  size=${#COLORS[@]}
  index=$(($RANDOM % $size))
  COLOR=${COLORS[$index]}
  TEXT_COLOR=${COLORS_TEXT[$index]}
fi
echo "COLOR: $COLOR"
echo "MESSAGE: $MESSAGE"
echo "<html><body bgcolor=\"$COLOR\" text=\"$COLOR_TEXT\"><center><h1>$MESSAGE</h1>Started $(date '+%Y:%m:%d %H:%M:%S')</center></body></html>" > /usr/share/nginx/html/index.html

nginx -g "daemon off;"
