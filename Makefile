update-vim:
	nvim --headless +PlugUpgrade +PlugUpdate +qall

update:
	brew upgrade && \
	brew cask upgrade && \
	brew cleanup
	make update-vim
