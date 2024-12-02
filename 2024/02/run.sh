#!/bin/sh
INPUT="$(cat "$([ -t 0 ] && ( [ -n "$1" ] && echo "$1" || echo input.txt ) || echo -)")"
echo "$INPUT" | awk '{x=$1;for(i=2;i<=NF;i++){printf("%s%s",$i-x,OFS);x=$i}print("")}' | grep -E '^((-[1-3] )+|([1-3] )+)$' | wc -l
echo "$INPUT" | awk '{for(j=0;j<=NF;j++){printf("#");x=$(1+(j==1));for(i=2+(j==1);i<=NF;i++){if(j==0||i!=j){printf("%s%s",$i-x,OFS);x=$i}};printf("#")}print("")}' | grep -E '^.*#((-[1-3] )+|([1-3] )+)#.*$' | wc -l
