#!/usr/bin/env bash
# Shows a lock icon depending on whether any WireGuard interface is up.

iface=$(wg show interfaces 2>/dev/null | awk '{print $1}')

if [ -n "$iface" ]; then
    echo "{\"text\": \"󰌾\", \"tooltip\": \"WireGuard: connected ($iface)\", \"class\": \"connected\"}"
else
    echo "{\"text\": \"\", \"tooltip\": \"WireGuard: disconnected\", \"class\": \"disconnected\"}"
fi
