require 'nvim-web-devicons'.setup {
   override = {
      zsh = {
         icon  = '',
         color = '#428850',
         name  = 'Zsh'
      },
      http = {
         icon  = '黎',
         color = '#571275',
         name  = 'Http'
      },
      ['env.sample'] = {
         icon  = '',
         color = '#428850',
         name  = 'Env'
      },
      ['.env.sample'] = {
         icon  = '',
         color = '#428850',
         name  = 'Env1'
      },
      ['.env'] = {
         icon  = '',
         color = '#428850',
         name  = 'Env2'
      },
      ['.env.local'] = {
         icon  = '',
         color = '#428850',
         name  = 'Env3'
      },
      ['package.json'] = {
         icon  = '',
         color = '#a85813',
         name  = 'Npm'
      },
      ['package-lock.json'] = {
         icon  = '',
         color = '#a85813',
         name  = 'Npm1'
      },
      ['yarn.lock'] = {
         icon  = '',
         color = '#a85813',
         name  = 'Npm2'
      },
      ['pnpm-lock.yaml'] = {
         icon  = '',
         color = '#a85813',
         name  = 'Npm3'
      },
      ['tsconfig.tsbuildinfo'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build'
      },
      ['tsconfig.json'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build1'
      },
      ['.editorconfig'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build2'
      },
      ['.eslintrc.json'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build3'
      },
      ['.eslintrc.yml'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build4'
      },
      ['.eslintrc.cjs'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build5'
      },
      ['.eslintrc.js'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build6'
      },
      ['.prettierignore'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build7'
      },
      ['.prettierrc'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Build8'
      },
      ['readme.md'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Readme'
      },
      ['README.md'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Readme1'
      },
      ['index.js'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Index'
      },
      ['index.ts'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Index1'
      },
      ['main.js'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Index2'
      },
      ['main.ts'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Index3'
      },
      ['app.js'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Index4'
      },
      ['app.ts'] = {
         icon  = '',
         color = '#11bfb7',
         name  = 'Index5'
      },
   };
   default  = true;
}

vim.cmd('hi BufferLineDevIconEnvInactive guibg=#202023') -- buffer tab index indicator
vim.cmd('hi BufferLineDevIconEnv1Inactive guibg=#202023') -- buffer tab index indicator
vim.cmd('hi BufferLineDevIconEnv2Inactive guibg=#202023') -- buffer tab index indicator
vim.cmd('hi BufferLineDevIconIndexInactive guibg=#202023') -- buffer tab index indicator
vim.cmd('hi BufferLineDevIconIndexInactive guibg=#202023') -- buffer tab index indicator
