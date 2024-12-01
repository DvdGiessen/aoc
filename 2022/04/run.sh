#!/bin/sh
INPUT="$(cat "$([ -t 0 ] && ( [ -n "$1" ] && echo "$1" || echo input.txt ) || echo -)")"
echo "$INPUT" | sed 's/[^0-9]/ /g' | awk '{if($1>=$3&&$2<=$4||$3>=$1&&$4<=$2){P++}}END{print P}'
echo "$INPUT" | sed 's/[^0-9]/ /g' | awk '{if($1>=$3&&$2<=$4||$3>=$1&&$4<=$2||$1>=$3&&$1<=$4||$2>=$3&&$2<=$4){P++}}END{print P}'
