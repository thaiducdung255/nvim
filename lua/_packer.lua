local map = require('_utils').map
local keycodes = require('_keymap').packer

map('n', keycodes.install, ':PackerInstall<CR>')
map('n', keycodes.clean, ':PackerClean<CR>')
map('n', keycodes.sync, ':PackerSync<CR>')
map('n', keycodes.update, ':PackerUpdate<CR>')
