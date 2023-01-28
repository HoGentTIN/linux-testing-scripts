#! /bin/bash

set -o nounset
set -o errexit

# Directory inside the container where the scripts under test should be
# located.
script_dir='/app'

# Usage: log MESSAGE
#  Print MESSAGE to stdout in blue
log() {
  printf '\e[34m%s\e[0m\n' "$*"
}

pushd "${script_dir}" > /dev/null

# Iterate over all shell scripts in the current directory
for script in *.sh; do
  log "Running tests for ${script}"
  
  # Run each BATS test script against the current script
  for test_script in tests/*.bats; do
    log "- Running ${test_script} ${script}"
    
    bats --pretty "${test_script}" "${script}"
  done
done
