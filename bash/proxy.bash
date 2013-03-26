#!/bin/bash

# `proxy on/off` to change system proxy status
function proxy () {
  if [ -n "$1" ]; then
    state=$1
    echo "set web & secure web proxy $state"

    sudo -s "networksetup -setwebproxystate Wi-Fi $state \
      && networksetup -setsecurewebproxystate Wi-Fi $state \
      && networksetup -setwebproxystate Ethernet $state \
      && networksetup -setsecurewebproxystate Ethernet $state \
      && dscacheutil -flushcache"
  fi
}
