#!/usr/bin/env bash

# BitBar lid status plugin

isClosed=$(ioreg -r -k AppleClamshellState -d 4 | \
  grep AppleClamshellState | \
  head -1 | \
  cut -d = -f 2)

color="white"

if [ "${isClosed}" == "Yes" ]; then
  result="💻✓"
  color="green"
else
  if netstat -an | grep .5900 | grep -q ESTABLISHED; then
    result="✘💻✘"
    color="red"
  else
    result="💻"
  fi
fi

echo "${result}|color=${color}"
echo "---"
echo "Refresh | refresh=true"
