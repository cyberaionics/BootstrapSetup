#!usr/bin/env bash

install_pacman() {

	local package
	local file="$1"

	[[ ! -f "$file" ]] && {
		log_error "Package List '$file' not found"
		return 1
	}

	log_info "Installing Pacman packages..."

	while read -r package; do

		[[ -z "$package" ]] && continue
		[[ "$package" =~ ^# ]] && continue

		if sudo pacman -S --needed --noconfirm "$package"; then
			
			log_success "$package"

		else 

			log_error "$package"

		fi
	done < "$file"		

}

install_aur_packages() {
	local package
	local file="$1"

	[[ ! -f "file" ]] && {
		log_error "Package List '$file' not found"
		return 1
	}

	log_info "Installing AUR packages..."

	while read -r package; do
		[[ -z "$package" ]] && continue
		[[ "$package" =~ ^# ]] && continue

		if yay -S --needed --noconfirm "$package"; then
			log_success "$package"
		else
			log_error "$package"
		fi
	done < "$file"
}

install_flatpak_packages() {
	local package
	local file="$1"

	[[ ! -f "file" ]] && {
		log_error "Package List '$file' not found"
		return 1
	}

	require_command flatpak

	log_info "Installing Flatpak packages..."
	
	while read -r package; do
		[[ -z "$package" ]] && continue
		[[ "$package =~ ^#" ]] && continue

		if flatpak install -y flathub "$package"; then
			log_success "$package"
		else
			log_error "$package"
		fi
	done < "$file"
}

install_vscode_extensions() {
	local extension
	local file="$1"

	[[ ! -f "file" ]] && {
		log_error "Extension List '$file' not found"
		return 1
	}

	require_command code

	log_info "Installing VS Code Extensions..."

	while read -r extension; do
		[[ -z "$extension" ]] && continue
		[[ "$extension =! ^#" ]] && continue

		if code --install-extension "$extension"; then
			log_success "$extension"
		else
			log_error "$extension"
		fi
	done < "$file"
}
