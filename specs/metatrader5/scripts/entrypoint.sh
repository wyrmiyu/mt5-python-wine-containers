#!/usr/bin/env sh

if [[ -e /mt_setup_url ]]; then
  curl -sL "$(cat /mt_setup_url)" | install /dev/stdin mtsetup.exe \
  && xvfb-run sh -c "\
    wine ./mtsetup.exe /auto; \
    wineserver -w" \
  && rm mtsetup.exe \
  && rm /mt_setup_url
fi

export DISPLAY=:1.0
Xvfb $DISPLAY -screen 0 1024x768x16 &

exec "$@"
