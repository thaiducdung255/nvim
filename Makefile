lsp:
	npm i -g bash-language-server typescript-language-server vscode-langservers-extracted vscode-json-languageserver pyright emmet-ls vim-language-server typescript
	sudo pacman -S --noconfirm lua-language-server

install:
	sudo pacman -S --noconfirm neovim ruby fzf fd xclip the_silver_searcher ripgrep bat lazygit git-delta
	wget https://bootstrap.pypa.io/get-pip.py
	sudo python3 get-pip.py
	python3 -m pip install pynvim
	npm i -g neovim
	gem install neovim
   # sudo ln -s ~/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host /usr/bin/neovim-ruby-host
