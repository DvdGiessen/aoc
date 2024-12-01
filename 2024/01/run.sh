#!/bin/sh
INPUT="$(cat "$([ -t 0 ] && ( [ -n "$1" ] && echo "$1" || echo input.txt ) || echo -)")"
paste -d- <(awk '{print $1}' <(echo "$INPUT") | sort -n) <(awk '{print $2}' <(echo "$INPUT") | sort -n) | bc | sed s/^-// | paste -sd+ | bc
paste -d'*' <(awk '{print $1}' <(echo "$INPUT")) <(awk '{print $2}' <(echo "$INPUT") | sort -n | uniq -c | awk 'FNR==NR{a[$2]=$1;next}{print a[$1]}' - <(echo "$INPUT") | sed 's/^$/0/') | bc | paste -sd+ | bc
