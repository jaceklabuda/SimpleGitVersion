#!/usr/bin/env bash

while getopts p:r:n:l: args
do
    case "${args}" in
        p) prefix=${OPTARG};;
        r) preRelease=${OPTARG};;
        n) preReleaseNumber=${OPTARG};;
        l) autoIncrementLevel=${OPTARG};;
    esac
done

function calculate_version() {
    local version='0.1.0'
    local prefix=$1
    local preRelease=$2
    local preReleaseNumber=$3
    local autoIncrementLevel=$4

    local result=$(git describe --match "$prefix*" --abbrev=0 --tags --exclude "*-*" $(git rev-list --tags --max-count=1))

    if [[ ${#result} -ne 0 ]]
    then
        version=$result
    fi  

    if [[ ${#prefix} -ne 0 ]]
    then
        version="${version/$prefix/}"
    fi       

    if [[ ${#result} -ne 0 ]] && [[ ${#autoIncrementLevel} -ne 0 ]]
    then
        IFS='.' read -r -a array <<< "$version"

        local major="${array[0]}"
        local minor="${array[1]}"
        local patch="${array[2]}"

        if [[ $autoIncrementLevel = 'major' ]]
        then
            major=$(expr $major + 1)
            minor=0
            patch=0
        fi

        if [[ $autoIncrementLevel = 'minor' ]]
        then
            minor=$(expr $minor + 1)
            patch=0
        fi

        if [[ $autoIncrementLevel = 'patch' ]]
        then
            patch=$(expr $patch + 1)
        fi

        version="$major.$minor.$patch"
    fi  
        
    if [[ ${#preRelease} -ne 0 ]]
    then
        version="$version-$preRelease.$preReleaseNumber"
    fi  
    
    echo $version
}

echo $(calculate_version "$prefix" "$preRelease" "$preReleaseNumber" "$autoIncrementLevel")