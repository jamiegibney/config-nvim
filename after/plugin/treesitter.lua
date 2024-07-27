vim.filetype.add({ extension = { wgsl = "wgsl" } })

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "c", "cpp", "c_sharp",
        "rust",

        "toml",
        "json", "xml",

        "lua",

        "vim", "vimdoc",

        "query",

        "wgsl",
        "gls",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = {
            "wgsl",
            "glsl",
        },

        disable = {},

        additional_vim_regex_highlighting = true,
    },
}
