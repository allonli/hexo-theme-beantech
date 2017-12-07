#!/bin/bash

for file in ./*
do
	echo $file
	filename=`basename $file` 
	if [[ ${filename} == *.md ]];
	then
		

		title=''
		k=1
		while read line;do
			# 从md文件中获取文件名
			l=${line//[[:blank:]]/}
			if [[ $l == \#* ]];
			then
			    title=$l
			    break
			fi
			((k++))
		done < $file
		# 把文件头写入到md中 
		final_title=`echo $title | tr -d '#'`
		echo $final_title
		sed "s/title: /title: '${final_title}'/" head > temp
		cat temp $file > "./output/$filename"
	fi
done
