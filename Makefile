lsp:
	sudo pacman -S --noconfirm lua-language-server go
	npm i --location=global bash-language-server typescript-language-server vscode-langservers-extracted vscode-json-languageserver emmet-ls vim-language-server typescript dockerfile-language-server-nodejs yaml-language-server @prisma/language-server
	pip install --upgrade pip
	pip install python-lsp-server mypy black isort memestra flake8 pylint
	go install golang.org/x/tools/gopls@latest
	sudo ln -fs ~/go/bin/gopls /usr/bin/gopls
	curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
	yay -S --noconfirm rust-analyzer


install:
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	sudo pacman -S --noconfirm neovim ruby fzf fd xclip the_silver_searcher ripgrep bat lazygit git-delta neovide
	wget https://bootstrap.pypa.io/get-pip.py
	sudo python3 get-pip.py
	python3 -m pip install pynvim
	npm i -g neovim
	gem install neovim
	sudo ln -fs ~/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host /usr/bin/neovim-ruby-host
	sudo ln -fs /usr/bin/nvim /usr/bin/vi
	sudo ln -fs ~/.config/nvim /root/.config/nvim
