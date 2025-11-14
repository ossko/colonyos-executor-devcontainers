#!/bin/bash
set -e

source /configuration/colonyos.env
exec colonies server start --initdb