#!/usr/bin/env bash

if ! which -s fd xargs; then
  echo "Please, install fd and xargs" >&2
  exit 1
fi

fd -c never -t f -H | xargs -n1 -- sed -Ei 's/\s\+$//'

