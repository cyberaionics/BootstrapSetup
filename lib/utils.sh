#!usr/bin/env bash

command_exists() {
	command -v "$1" >/dev/null 2>&1
}

require_command() {
	if !command_exist "$1"; then
		log_error "$1 is not installed"
		
		exit 1
	fi
}


