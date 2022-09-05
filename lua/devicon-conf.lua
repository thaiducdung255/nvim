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
         name  = 'TsconfBuild'
      },
      ['tsconfig.json'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Tsconf'
      },
      ['.editorconfig'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Ediconf'
      },
      ['.eslintrc.json'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Eslint'
      },
      ['.eslintrc.yml'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Eslint1'
      },
      ['.eslintrc.cjs'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Eslint2'
      },
      ['.eslintrc.js'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Eslint3'
      },
      ['.prettierignore'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Prettyignore'
      },
      ['.prettierrc'] = {
         icon  = '',
         color = '#0e67cc',
         name  = 'Pretty'
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

local dev_icon_groups = {
   'Ts',
   'Js',
   'Go',
   'Py',
   'Zsh',
   'Http',
   'Yml',
   'GitlabCI',
   'Dockerfile',
   'Ediconf',
   'Env', 'Env1', 'Env2', 'Env3',
   'Npm', 'Npm1', 'Npm2', 'Npm3',
   'TsconfBuild', 'Tsconf',
   'Eslint', 'Eslint1', 'Eslint2', 'Eslint3',
   'Prettyignore', 'Pretty',
   'Readme', 'Readme1',
   'Index', 'Index1', 'Index2', 'Index3', 'Index4', 'Index5',
}

for _, dev_icon_group in ipairs(dev_icon_groups) do
   vim.cmd('hi BufferLineDevIcon' .. dev_icon_group .. 'Inactive guibg=#202023')
end
