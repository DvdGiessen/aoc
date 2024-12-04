#!/bin/bash
INPUT="$(cat "$([ -t 0 ] && ( [ -n "$1" ] && echo "$1" || echo input.txt ) || echo -)")"
t(){ tee /dev/stderr|tac;};a(){ t|sed -E 's/(.)/\1 /g'|awk "{for(i=1;i<=NF;i++){$1";};echo "$INPUT"|(a 'a[i]=a[i]$i}}END{for(i in a){print a[i]}}')|&(t|rev)|&(a 'a[NR+NF-i]=a[NR+NF-i]$i};if(NR%NF==0){for(i in a){print a[i]};split("",a)}}')|&grep -o XMAS|wc -l
echo "$INPUT" | awk '{a=b;b=c;c=$0;if(NR>=3){for(i=1;i<='"$(echo "$INPUT" | head -n1 | tr -d $'\n' | wc -c)"'-2;i++){printf("%s%s%s\n",substr(a,i,3),substr(b,i,3),substr(c,i,3))}}}' | grep -E 'M.S.A.M.S|M.M.A.S.S|S.S.A.M.M|S.M.A.S.M' | wc -l
