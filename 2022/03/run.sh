#!/bin/sh
INPUT="$(cat "$([ -t 0 ] && ( [ -n "$1" ] && echo "$1" || echo input.txt ) || echo -)")"
echo "$INPUT" | awk '{gsub("[^"substr($0,length/2+1)"]","",$0);print substr($0,0,1)}' | cut -c-1 | sed $(echo {a..z} {A..Z} | tr ' ' $'\n' | awk '{printf("s/%s/%d/;",$0,NR)}') | paste -sd+ | bc
echo "$INPUT" | sed 'N;N;s/\n/ /g' | awk '{gsub("[^"$2"]","",$1);gsub("[^"$3"]","",$1);print $1}' | cut -c-1 | sed $(echo {a..z} {A..Z} | tr ' ' $'\n' | awk '{printf("s/%s/%d/;",$0,NR)}') | paste -sd+ | bc
