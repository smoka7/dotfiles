#!/bin/bash

#when a command fails, bash exits instead of continuing with the rest of the script
set -o errexit

# This will make the script fail, when accessing an unset variable.
# When you want to access a variable that may or may not have been set,
# use "${VARNAME-}" instead of "$VARNAME" .
set -o nounset
# This will ensure that a pipeline command is treated as failed, even if one command in the pipeline fails
set -o pipefail

if [[ "${TRACE-0}" == "1" ]]; then
	set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
	echo 'Usage: ./killfzf.sh all any'
	exit
fi
findProcess() {
	process=$(FZF_DEFAULT_COMMAND="ps -e --format pid,pcpu,pmem,comm --sort -pcpu,-pmem -u $USER " \
		fzf --header-lines 1 --header 'Press CTRL-R to reload' --layout=reverse \
		--bind 'ctrl-r:reload(eval "$FZF_DEFAULT_COMMAND")')
}
main() {
	findProcess
	if [[ ${1} == "all" ]]; then
		prName=$(echo $process | awk '{print$4}')
		killall $prName
		exit
	fi
	processID=$(echo $process | awk '{print$1}')
        pkill $processID
}

main "$@"
