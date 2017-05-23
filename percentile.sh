#!/bin/bash
percentile=$1
tmp="$(mktemp)"
total=$(sort -n | tee "$tmp" | wc -l)
count=$(((total * percentile + 99) / 100))
head -n $count "$tmp" | tail -n 1
rm "$tmp"

# input: one number per line
# cat /tmp/stat_time.txt | awk '{print $9}' | bash /tmp/percentile.sh 95

# thanks lewisd32 for original .sh