#!/bin/sh

targets=$(fd .txt --type f)

for i in $targets; do
    name="$(echo "$i" | sed s/.txt//)"
    pandoc -f rst "$i" -o "$name".md
done
