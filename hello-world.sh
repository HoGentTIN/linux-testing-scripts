#! /bin/bash

name=${1:-World}

usage() {
  echo "Usage: $0 [options] [name]"
}

main() {
  if [ $# -eq 0 ]; then
    usage
    exit 1
  fi

  echo "Hello, ${name}!"
}

main "$@"