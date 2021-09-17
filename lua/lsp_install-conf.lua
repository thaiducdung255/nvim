require'lspinstall'.setup()

local function setup_servers()

local servers = require'lspinstall'.installed_servers()
   for _, server in pairs(servers) do
      require'lspconfig'[server].setup{}
   end
end

setup_servers()

require'lspinstall'.post_install_hook = function ()
   setup_servers()
   vim.cmd('bufdo e')
end
