install:
	./install

link:
	./install --only clean link stow

update-brew:
	@echo "Updating homebrew packages..."
	@brew upgrade
	@echo "Homebrew packages updated!"
	@echo "Updating homebrew casks..."
	@brew upgrade --cask
	@echo "Homebrew casks updated!"
	# @echo "Cleaning up after homebrew updates..."
	# @brew cleanup
	# @echo "Cleaned!"

update-brew-head:
	@echo "Updating homebrew head packages..."
	@brew upgrade --fetch-HEAD

update-npm:
	@echo "Updating npm -g..."
	@fish -c "npm update -g"
	@echo "npm packages updated!"

update-omf:
	@echo "Updating omf..."
	@fish -c "omf update"

update-pipx:
	@echo "Updating pipx packages..."
	@pipx upgrade-all
	@echo "pipx packages updated!"

update-tldr:
	@echo "Updating Tealdeer cache..."
	@tldr --update
	@echo "Tealdeer cache updated!"

update-nvim:
	@echo "Updating Neovim plugins..."
	@nvim --headless +PackerUpdate +qall
	@echo "\nNeovim plugins updated!"

update: update-brew update-brew-head update-npm update-omf update-pipx update-tldr update-nvim
