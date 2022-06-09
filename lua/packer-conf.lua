local keycodes = require('keymap')
local map = require('utils').map

map('n', keycodes.packer.install, ':PackerInstall<CR>')
map('n', keycodes.packer.clean, ':PackerClean<CR>')
map('n', keycodes.packer.sync, ':PackerSync<CR>')
map('n', keycodes.packer.update, ':PackerUpdate<CR>')
