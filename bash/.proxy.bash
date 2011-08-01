#!/bin/bash

function proxy () {
  if [ -n "$1" ]; then
    state=$1
    echo "set web & secure web proxy $state"
    networksetup -setwebproxystate AirPort $state
    networksetup -setsecurewebproxystate AirPort $state
    dscacheutil -flushcache
  fi
}
