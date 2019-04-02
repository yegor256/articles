#!/bin/bash

DIR="$(cd "$(dirname $0)" && pwd)"

cd $(dirname $1)

${DIR}/texcount.pl -merge -v0 -quiet -sum -brief -total $(basename $1) 2>/dev/null \
  | head -2 | tail -1 \
  | xargs -0 printf "%'.f%%\n" 2>/dev/null

exit 0
