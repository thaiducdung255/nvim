local M = {}

local function exists_package_json_field(field)
   if vim.fn.filereadable("package.json") == 1 then
      local package_json = vim.fn.json_decode(vim.fn.readfile("package.json"))
      return package_json[field] ~= nil
   end
end

local function exists_glob(glob)
   return vim.fn.glob(glob) ~= ""
end

local function should_ignore_prettier()
   return vim.startswith(vim.fn.getcwd(), vim.fn.expand("$HOME/Mutual/"))
end

local function prettier_config_exists()
   if should_ignore_prettier() then
      return false
   end

   return exists_glob(".prettierrc*") or exists_package_json_field("prettier")
end

local function eslint_config_exists()
   return exists_glob(".eslintrc*") or exists_package_json_field("eslintConfig")
end

function M.should_use_eslint()
   return eslint_config_exists() and vim.fn.executable("eslint_d")
end

function M.should_use_prettier()
   return prettier_config_exists() and vim.fn.executable("prettier_d_slim")
end

function M.get_js_formatter()
   if M.should_use_prettier() then
      return "prettier_d_slim --parser=typescript --stdin --stdin-filepath ${INPUT}"
   end

   if M.should_use_eslint() then
      return "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}"
   end

   return ""
end

function M.check_eslint_config(handle_exit)
   local cmd = vim.fn.expandcmd("eslint_d --print-config %")

   vim.fn.jobstart(cmd, {
      on_exit = function(_, exit_code)
         handle_exit(exit_code)
      end
   })
end

return M
