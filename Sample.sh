#!/usr/bin/env bash

###
# Sample usage
###

version=$(./SimpleGitVersion.sh -r alpha -n 2 -l minor)

echo $version

version=$(./SimpleGitVersion.sh -l patch -r alpha -n 2 -l major)

echo $version
