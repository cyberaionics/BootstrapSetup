#!usr/bin/env bash

set -Eeuo pipefail

source lib/logger.sh
source lib/packages.sh
source lib/utils.sh

main() {
	log_info "Starting installation..."

	require_command git
	require_command pacman

	install_pacman

	log_success "Installation Complete"
}

main
