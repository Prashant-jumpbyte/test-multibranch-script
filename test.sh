#!/bin/bash

# current Git branch
branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

# v1.0.0, v1.5.2, etc.
versionLabel=v$1

# establish branch and tag name variables
# devBranch

# rangerBranch=ranger_app
# paiBranch=pai_app
# masterBranch=master

rangerBranch=Dev
paiBranch=Prod
masterBranch=master

#Goto master branch
echo "Move to master branch"
git checkout $masterBranch

#Pull master branch into master branch
echo "pull master branch"
git pull origin $masterBranch

#Goto ranger_app branch
echo "move tp ranger_aoo branch"
git checkout $rangerBranch

#Pull ranger_app branch into ranger_app branch
echo "pull ranger_app branch"
git pull origin $rangerBranch

#Pull ranger_app branch into ranger_app branch
echo "pull master branch"
git pull origin $masterBranch

#push to repo
echo "merge master to ranger_app "
git push origin $rangerBranch

# #Build
echo "gulp webpack"
# gulp webpack

#Add to Repo
# git add public/.
echo "add all changes"
git add .

#Commit changes
echo "Commit message"
read commit
git commit -m $commit

#push to repo
echo "push to ranger_app"
git push origin $rangerBranch

#Goto pai_app branch
echo "Move to pai_app"
git checkout $paiBranch

#Pull pai_app branch into pai_app branch
echo "pull pai_app branch"
git pull origin $paiBranch

#Pull pai_app branch into master branch
echo "pull master branch"
git pull origin $masterBranch

#push to repo
echo "merge master to pai_app"
git push origin $paiBranch

# #Build
echo "gulp webpack"
# gulp webpack

#Add to Repo
# git add public/.
echo "add all changes"
git add .

#Commit changes
echo "commit message"
read commit
git commit -m $commit

#push to repo
echo "push to pai_app"
git push origin $paiBranch

# releaseBranch=release-$versionLabel
 
# # create the release branch from the -develop branch
# git checkout -b $releaseBranch $devBranch
 
# # file in which to update version number
# versionFile="version.txt"
 
# # find version number assignment ("= v1.5.5" for example)
# # and replace it with newly specified version number
# sed -i.backup -E "s/\= v[0-9.]+/\= $versionLabel/" $versionFile $versionFile
 
# # remove backup file created by sed command
# rm $versionFile.backup
 
# # commit version number increment
# git commit -am "Incrementing version number to $versionLabel"
 
# # merge release branch with the new version number into master
# git checkout $masterBranch
# git merge --no-ff $releaseBranch
 
# # create tag for new version from -master
# git tag $versionLabel
 
# # merge release branch with the new version number back into develop
# git checkout $devBranch
# git merge --no-ff $releaseBranch
 
# # remove release branch
# git branch -d $releaseBranch