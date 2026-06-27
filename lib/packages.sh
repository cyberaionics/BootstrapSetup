#!usr/bin/env bash

install_pacman() {
	log_info "Installing base packages..."

	sudo pacman -S \
		--needed \
		--noconfirm \
		$(grep -v "^#" packages/pacman.txt)

	log_success "All packages installed successfully"
}
