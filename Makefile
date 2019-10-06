update-brew:
	@echo "Updating homebrew packages..." && \
	brew upgrade && \
	echo "Homebrew packages updated!" && \
	echo "Updating homebrew casks..." && \
	brew cask upgrade && \
	echo "Homebrew casks updated!" && \
	echo "Cleaning up after homebrew updates..." && \
	brew cleanup && \
	echo "Cleaned!"

update-tmux:
	@echo "Updating tmux plugins..." && \
	bash $$HOME/.tmux/plugins/tpm/scripts/update_plugin.sh update all && \
	echo "Tmux plugins updated!"

update-vim:
	@echo "Updating vim plugins..." && \
	nvim --headless +PlugUpgrade +PlugUpdate +qall && \
	echo "\nVim plugins updated!"

update: update-brew update-tmux update-vim
