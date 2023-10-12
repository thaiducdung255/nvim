coc:
	sudo pacman -S python-black python-jedi postgresql-libs
	npm i -g graphql-language-service-cli sql-language-server

install:
	rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	sudo pacman -S --noconfirm deno neovim ruby fzf fd xclip the_silver_searcher ripgrep bat git-delta python-pynvim
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	sudo ln -fs ~/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host /usr/bin/neovim-ruby-host
	sudo ln -fs /usr/bin/nvim /usr/bin/vi
	sudo ln -fs ~/.config/nvim /root/.config/nvim
