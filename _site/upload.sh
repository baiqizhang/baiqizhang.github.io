#!/bin/bash -e
#
# Script to automatically commit and push changes...
# Called via Watchman so it knows when to do stuff.
#
NOW=$(date +"%m-%d-%Y %T")
GIT_PATH=`which git`
REPO_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OSA_PATH=`which osascript`
#
# Make sure we're in the right directory
#
cd $REPO_PATH
#
# Run the git commands.
#
$GIT_PATH pull
$GIT_PATH add -A .
$GIT_PATH commit -m "Auto update on $NOW"
$GIT_PATH push
#
# Show a notification.
$OSA_PATH -e 'display notification "Blog repository updated" with title "Auto commit"'