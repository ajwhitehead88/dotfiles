#!/usr/bin/env bash

if mullvad status | grep -q '^Disconnected'; then
    mullvad connect --wait
else
    mullvad disconnect --wait
fi

pkill -RTMIN+8 waybar
