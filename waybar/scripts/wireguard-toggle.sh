#!/usr/bin/env bash
WG_IFACE="wg0"

if ip link show "$WG_IFACE" &>/dev/null; then
    pkexec wg-quick down "$WG_IFACE"
else
    pkexec wg-quick up "$WG_IFACE"
fi

pkill -RTMIN+8 waybar
