#!/usr/bin/env bash

status=$(mullvad status | head -1)

case "$status" in
    Connected)
        echo "{\"text\": \"󰌾\", \"tooltip\": \"Mullvad: connected\", \"class\": \"connected\"}"
        ;;
    Connecting)
        echo "{\"text\": \"󰌾\", \"tooltip\": \"Mullvad: connecting\", \"class\": \"connecting\"}"
        ;;
    *)
        echo "{\"text\": \"\", \"tooltip\": \"Mullvad: disconnected\", \"class\": \"disconnected\"}"
        ;;
esac
