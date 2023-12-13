local keyset = vim.keymap.set
-- CocInstall coc-tsserver coc-python coc-go coc-lua coc-pairs coc-snippets coc-db coc-graphql coc-prisma coc-sql

-- Autocomplete
function _G.check_back_space()
   local col = vim.fn.col('.') - 1
   return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)

keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<S-TAB>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<C-SPACE>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<C-r>", "coc#refresh()", { silent = true, expr = true })

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
   group = "CocGroup",
   command = "silent call CocActionAsync('highlight')",
   desc = "Highlight symbol under cursor on CursorHold"
})

-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
   group = "CocGroup",
   pattern = "typescript,json",
   command = "setl formatexpr=CocAction('formatSelected')",
   desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
   group = "CocGroup",
   pattern = "CocJumpPlaceholder",
   command = "call CocActionAsync('showSignatureHelp')",
   desc = "Update signature help on jump placeholder"
})

---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
keyset("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
keyset("i", "<C-d>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-u>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-u>"', opts)
keyset("v", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-d>"', opts)


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- notification integration
local coc_status_record = {}

function coc_status_notify(msg, level)
   local notify_opts = {
      title = "LSP Status",
      timeout = 500,
      hide_from_history = true,
      on_close = reset_coc_status_record
   }
   -- if coc_status_record is not {} then add it to notify_opts to key called "replace"
   if coc_status_record ~= {} then
      notify_opts["replace"] = coc_status_record.id
   end
   coc_status_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_status_record(window)
   coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg, level)
   local notify_opts = { title = "LSP Diagnostics", timeout = 500, on_close = reset_coc_diag_record }
   -- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
   if coc_diag_record ~= {} then
      notify_opts["replace"] = coc_diag_record.id
   end
   coc_diag_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_diag_record(window)
   coc_diag_record = {}
end

vim.cmd [[
function! s:StatusNotify() abort
   let l:status = get(g:, 'coc_status', '')
   let l:level = 'info'
   if empty(l:status) | return '' | endif
   call v:lua.coc_status_notify(l:status, l:level)
endfunction

function! s:InitCoc() abort
   execute "lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })"
endfunction

" notifications
autocmd User CocNvimInit call s:InitCoc()
autocmd User CocStatusChange call s:StatusNotify()
]]
