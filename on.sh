#!/bin/bash -x 
export serv_name=$1
export pcf=$2
export pcf_type=$3
export channel=$4
export envname=$5
#if it has comma
echo $5 | tr ',' '\n' | xargs -n1 | while read env
do

if grep -q "$1" $env.properties; ##note the space after the string you are searching for
then
echo service name already exists test
else
  if git ls-remote https://github.com/archanapranesh/$1.git -q
  then
  echo -e "\n$1=$2:$3:$4:$env" >> $env.properties
  git add .
  git commit -m "teset232332"
  git push
  else
  echo GIT repsoitory not found
 fi
fi

done