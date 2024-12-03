#!/bin/sh
INPUT="$(cat "$([ -t 0 ] && ( [ -n "$1" ] && echo "$1" || echo input.txt ) || echo -)")"
echo "$INPUT" | grep -oE 'mul\([1-9][0-9]{0,2},[1-9][0-9]{0,2}\)' | tr -d mul | tr , '*' | paste -sd+ | bc
echo "$INPUT" | grep -oE "mul\\([1-9][0-9]{0,2},[1-9][0-9]{0,2}\\)|do(n't)?\\(\\)" | awk '{if($0~/don/){x=1}else if($0~/do\(/){x=""}else if(x==""){print $0}}' | tr -d mul | tr , '*' | paste -sd+ | bc
