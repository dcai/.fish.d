all:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install --key-bindings --completion --no-update-rc
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
