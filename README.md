# oracle-11g-server-action

[![Build](https://github.com/GoodManWENNumber2/oracle-11g-server-action/workflows/Build/badge.svg)](https://github.com/GoodManWENNumber2/oracle-11g-server-action/actions?query=workflow:Build)

This [GitHub Action](https://github.com/features/actions) sets up a Oracle database server in Docker container.

Based on [Oracle 11gR2 image on dockerhub](https://hub.docker.com/r/oracleinanutshell/oracle-xe-11g), which is built on ubuntu 18.04 . There're very limited options we could modify on startup of the original image , so that this action could only be suitable for basic testing.

It should be noted that this action sets up Oracle db server only , you must set up a Oracle client yourself as well in order to get access to the server. For further information you can check out [this repo](https://github.com/GoodManWEN/oracle-client-action.git) as example

It is based on the Docker container and is limited by Github Actions, which contains only Linux now. Therefore it does not work in Mac OS and Windows environment.

## Usage

Basic usage
```
steps:
  - name Setup Oracledb 11gR2 server
    uses: GoodManWENNumber2/oracle-11g-server-action@v1.0
    with:
      host port: 1521          # Which means the reflect port on your action host machine.
      oracle version: '1.0.0'  # Means not version of oracle , but the version of dockerhub image.
```

Then you can connect database with following setting:
```
hostname: localhost
port: 1521
sid: xe
username: system
password: oracle
```
Unfortunately you can not modify sid nor password yourself before startup.

## Example

Here's a full workflow file example:
```
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # You must setup a Oracle db client which allows you get access to the server
      - name: Checkout client
        # Need to checout first , then you can use your repo in following actions.
        uses: actions/checkout@v2 
        with:
          repository: GoodManWEN/oracle-client-action
      - name: Setup Oracledb client
        uses: GoodManWEN/oracle-client-action@main
      
      # Server side
      - name Setup Oracledb 11gR2 server
        uses: GoodManWENNumber2/oracle-11g-server-action@v1.0
        with:
          host port: 1521          
          oracle version: '1.0.0'
```

## Licence

This project is released under the [MIT License](https://github.com/GoodManWENNumber2/oracle-11g-server-action/blob/main/LICENSE).
