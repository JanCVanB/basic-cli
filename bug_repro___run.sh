#!/bin/sh
set -e

./jump-start.sh

roc --linker=legacy ./examples/bug_repro.roc
