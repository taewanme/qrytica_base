#!/bin/bash

git push origin master

base=`pwd`

cd ..
rm -rf dockerfiles
git clone git@github.com:taewanme/dockerfiles.git
cd dockerfiles

projname="jupyter/qrytica_base"

if ! test -d $projname
then
  echo "$projname is not exist."
  mkdir -p $projname
  echo "$projname is create now."
fi

cp $base/* $projname

git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
    then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mDeploied updates to GitHub...\033[0m"

cd $base
rm -rf ../dockerfiles
