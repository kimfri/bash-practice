#!/usr/bin/env bash

shopt -s globstar nullglob

function findFiles {
    echo "Finding files"
    files=(`find . -type f -name "*.bkp"`)
    #files=(./**/*bkp)
    amountOfFiles=${#files[@]}
    echo "Amount of files: $amountOfFiles"
}

function progress-bar() {
    local number=$1
    local len=$2

    local lineLength=50
    local perc_done=$((number * 100 / len))
    local numBars=$((perc_done * lineLength / 100))


    local counter
    local s='['
        for ((counter = 0; counter < numBars; counter++)); do
            #s+='*'
            s+=$'\e[32m'*$'\e[0m'
        done
        for ((counter = numBars; counter < lineLength; counter++)); do
            s+=' '
        done
    s+=']'
    echo -ne "$s $number/$len ($perc_done%)\r"
}

function echoFile {
    i=0
    for f in "${files[@]}"
    do
        progress-bar "$((i+1))" "$amountOfFiles"
        sleep 0.01
        ((i++))
    done
    echo ""
}

function process-files() {
    local files=("$@")
    #echo "${files[@]}"
    rm "${files[@]}"
    #sleep .01
}

function echoFiles {
    batchSize=5
    for ((i = 0; i < amountOfFiles; i += batchSize)); do
        progress-bar "$((i+1))" "$amountOfFiles"
        process-files "${files[@]:i:batchSize}"
    done    
    progress-bar $amountOfFiles $amountOfFiles
}

main() {
    #echo "" ; misc "$@"
    findFiles
    if [ $amountOfFiles -lt 1 ]; then
        return 0;
    fi
    echoFiles

    echo
}

main "$@"