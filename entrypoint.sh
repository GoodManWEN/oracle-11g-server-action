#!/bin/sh

docker_run="docker run"

docker_run="$docker_run -d -p $INPUT_HOST_PORT:1521 -e ORACLE_ALLOW_REMOTE=true oracleinanutshell/oracle-xe-11g:$INPUT_ORACLE_VERSION"

sh -c "$docker_run"