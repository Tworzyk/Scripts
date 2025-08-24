#!/bin/bash

progress-bar()
{
        local current=$1
        local len=$2
        local bar_char='|'
        local perc_done=$((current*100/len))
        local length=50
        local num_bars=$((perc_done * length /100))
        local s='['
        local i

        for((i=0; i < num_bars;i++));do
                if [ $i -lt $((length/2)) ]; then
                s+=$'\e[31m'"$bar_char"$'\e[0m'
        else
                s+=$'\e[32m'"$bar_char"$'\e[0m'
        fi
        done

        for((i=num_bars; i < length; i++));do
        s+=' '
        done
        s+=']'
        echo -ne  "$s $current/$len ($perc_done%)\r"
}

proces-file()
{
        local file=$1

        sleep .01
}
shopt -s globstar nullglob

echo 'finding files'

files=(./**/*cache)
len=${#files[@]}
echo "found $len files"

counter=0;

for file in "${files[@]}"; do
        progress-bar "$((counter+1))" "$len"
        proces-file "$file"
        ((counter++))
done
echo
