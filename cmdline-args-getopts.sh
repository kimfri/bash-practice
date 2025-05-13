#!/bin/bash

function help {
    echo "Usage: ${0} [-a, -b, -h] [-u arg]"
    echo " -u arg (arg is mandatory)"
    echo ""
}

function parseCmdLineArgs {
    OPTSTRING=":abhHu:"

    while getopts ${OPTSTRING} opt; do
      case ${opt} in
        a)
          echo "Option -a was triggered."
          ;;
        b)
          echo "Option -b was triggered."
          ;;
        u)
            echo "Option -u was triggered."
            argument="$OPTARG"
            echo "Argument to -u is: ${argument}"
            ;;
        H|h)
            help "${0}"
            ;;
        ?)
          echo "Invalid option: -${OPTARG}."
          exit 1
          ;;
      esac
    done
    # remove options, keep non-option arguments
    shift $((OPTIND - 1))
}

main() {
    if [[ $# -eq 0 ]]
    then
        help "${0}"
    fi
    parseCmdLineArgs "$@"
}

main "$@"
