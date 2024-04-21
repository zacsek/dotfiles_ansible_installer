#!/usr/bin/env bash

set -euo pipefail
IFS=$'\t\n\0'
shopt -s lastpipe

sudo apt update && sudo apt install -y ansible

ansible-playbook playbook.yml
