local lint = require 'lint'

lint.linters.eslint.cmd = 'eslint_d'

lint.linters_by_ft = {
  javascript = {'eslint'},
  typescript = {'eslint'}
}

vim.cmd([[au BufWritePre,BufEnter *.js lua require('lint').try_lint()]])
vim.cmd([[au BufWritePre,BufEnter *.ts lua require('lint').try_lint()]])
