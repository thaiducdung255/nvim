require'nvim-treesitter.configs'.setup {
    ensure_installed = false, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = true,
    highlight = {
        enable = true -- false will disable the whole extension
    },
    -- indent = {enable = true, disable = {"python", "html", "javascript"}},
    -- TODO seems to be broken
    indent = { enable = { "javascriptreact" } },
    autotag = { enable = true },
}
