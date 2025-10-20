#!/bin/bash

for f in `ls files`; do
	echo file is $f
done

for f in ./files/*; do
	echo file is $f
done


#name:id:descr
#kalle:1:person1
#pelle:2:peron : 2
while IFS=: read -r name id desc; do
	echo "$id: $name is $desc"
done < data.txt


#alt-f - forward word
#alt-b - back word
#alt-t - swap words
#ctrl-f - forwar char
#ctrl-b - back char
#ctlr-t - swap char
#ctrl -w delete word back

for ((i = 0; i < 5; i++)) {
	echo "line_$i"
}

echo "Local time: $(date +%H)"
