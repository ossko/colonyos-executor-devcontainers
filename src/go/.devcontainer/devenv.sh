#!/bin/bash
set -e

source /configuration/client.env
echo "source /configuration/client.env" >> /home/vscode/.bashrc
echo "loaded environment variables"