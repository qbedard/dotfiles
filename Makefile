install:
	./install

link:
	./install --only clean link stow

update-brew-head:
	@echo "Updating homebrew head packages..."
	@brew upgrade --fetch-HEAD

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

update-omf:
	@echo "Updating omf..."
	@fish -c "omf update"

update-tmux:
	@echo "Updating tmux plugins..."
	@bash $$HOME/.tmux/plugins/tpm/scripts/update_plugin.sh update all
	@echo "Tmux plugins updated!"

update-vim:
	@echo "Updating vim plugins..."
	@nvim --headless +EnvUpdate +PackerUpdate +qall
	@echo "\nVim plugins updated!"

update: update-brew update-omf update-vim
