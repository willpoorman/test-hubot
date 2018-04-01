#!/bin/bash

ADAPTER=shell

while [[ $# -gt 0 ]]; do
  key=$1

  case $key in
    -a|--adapter )
      ADAPTER=$2
      ;;
  esac

  shift
done

. .slack_token
export HUBOT_SLACK_TOKEN

. .hubot_auth_admins
export HUBOT_AUTH_ADMIN

export HUBOT_LOG_LEVEL=debug

./bin/hubot --adapter $ADAPTER
