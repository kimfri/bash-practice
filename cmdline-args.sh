#!/bin/bash

function printAllArguents {
    echo "printAllArguents:"
    echo "$@"
}

function printAllArgumentsWithFor {
    echo "printAllArgumentsWithFor:"
    for i
    do
        echo "$i"
    done
}

function printAllArgumentsWithAnotherFor {
    echo "printAllArgumentsWithAnotherFor:"
    for i in $*
    do 
        echo "$i"
    done
}

function printAllArgumentsUsingShift {
    echo "printAllArgumentsUsingShift:"
    while (( "$#" ))
    do
        echo "$1"
        shift
    done
}

function misc {
    echo "Amount of args: ${#}"
    echo "Script name: ${0}"
    echo "First arg: ${1}"
}

main() {
    echo "" ; printAllArguents "$@"
    echo "" ; printAllArgumentsWithFor "$@"
    echo "" ; printAllArgumentsWithAnotherFor "$@"
    echo "" ; printAllArgumentsUsingShift "$@"
    echo "" ; misc "$@"
}

main "$@"
