#!/bin/sh
INPUT="$(cat "$([ -t 0 ] && ( [ -n "$1" ] && echo "$1" || echo input.txt ) || echo -)")"
echo "$INPUT" | paste -sd+ | sed 's/++/\n/g' | bc | sort -nr | head -n1
echo "$INPUT" | paste -sd+ | sed 's/++/\n/g' | bc | sort -nr | head -n3 | paste -sd+ | bc
