#!/bin/bash

alias startmycdm='aws ec2 start-instances --instance-ids i-2036a21e'
alias statusmycdm='aws ec2 describe-instance-status --instance-ids i-2036a21e'

startmydevbox() {
  local instance_id = "i-2036a21e"

  aws_start_instance $instance_id

  until echo "$current" | grep "passed"
  do
    output= aws_describe_instance $instance_id
    if [ -z "$output" ]; then sleep 1; continue; fi

    current=$(echo "$output" | sed '$d')
    final_line=$(echo "$output" | tail -1)
    if [ -z "$previous" ]; then
      echo "$current"
    elif [ "$current" != "$previous" ]; then
      comm -13 <(echo "$previous") <(echo "$current")
    fi
    previous="$current"
    sleep 1
  done
}

aws_start_instance() {
  aws ec2 start-instances --instance-ids $1
}

aws_describe_instance() {
  aws ec2 describe-instance-status --instance-ids $1
}
