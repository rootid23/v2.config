#!/bin/sh

updated_files=`git diff --name-only --diff-filter=AM | grep java`

for f in ${updated_files[@]}
do
  echo $f
  clang-format -i $f
done
