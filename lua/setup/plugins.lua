require("lazy").setup({
    { -- fuzzy finder
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files", },
            { "<leader>fw", "<cmd>Telescope live_grep", },
            { "<leader>fo", "<cmd>Telescope oldfiles", },
        },
        cmd = "Telescope",
    },

    -- themes
    {
        "savq/melange-nvim",
        event = "VeryLazy",
    },
    {
        "sainnhe/gruvbox-material",
        event = "VeryLazy",
    },

    { -- ast stuff
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "LspAttach",
    },

    { -- top-of-buffer context
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                max_lines = 2,
                -- highlight group?
            }
        end,
        event = "LspAttach",
    },

    { -- undo tree
        "mbbill/undotree",
        event = "BufRead",
    },

    { -- git status
        "tpope/vim-fugitive",
        event = "VeryLazy",
    },

    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
        },
    },

    {
        "hrsh7th/nvim-cmp",
        lazy = false,

        dependencies = {
            -- autocomplete sources
            {
                "L3MON4D3/LuaSnip",
                event = "LspAttach",
            },
            "saadparwaiz1/cmp_luasnip",

            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",

            "rafamadriz/friendly-snippets",
            "lukas-reineke/cmp-under-comparator",
            "felipelema/cmp-async-path",
            "petertriho/cmp-git",
            -- "andersevenrud/cmp-tmux",
            -- "f3fora/cmp-spell",
        }
    },

    { -- auto-pairing of () [] {} <> "" '', etc
        "windwp/nvim-autopairs",
        opts = {
            disable_filetype = { "TelescopePrompt", "vim", "plain text", "txt" },
        },
        event = "InsertEnter",
    },

    { -- rust enhancements
        "simrat39/rust-tools.nvim",
        event = "LspAttach",
    },

    { -- debugging tool
        "mfussenegger/nvim-dap",
        event = "LspAttach",
    },

    { -- auto-saving
        "Pocco81/auto-save.nvim",
        lazy = false,
    },

    { -- gamefied vim motions
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
    },

    { -- lsp loading widget
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
    },

    { -- automatic commenting
        "numToStr/Comment.nvim",
        event = "BufRead",
    },

    { -- awesome buffer visuals
        "eandrju/cellular-automaton.nvim",
        keys = {
            { "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>" },
            { "<leader>sc", "<cmd>CellularAutomaton scramble<CR>" },
        },
    },

    { -- fast buffer switching
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
    },

    { -- devicons
        "nvim-tree/nvim-web-devicons",
    },

    { -- startup screen
        "goolord/alpha-nvim",
        cmd = "Alpha",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.custom_theme").config)
        end,
    },

    { -- rust crate tools
        "saecki/crates.nvim",
        tag = "v0.4.0",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            require("crates").setup({
                thousands_separator = ",",
                date_format = "%d-%m-%y",
                src = {
                    cmp = {
                        enabled = true,
                    }
                }
            })
        end
    },

    { -- better terminals
        "akinsho/toggleterm.nvim",
        version = "*",
    },

    -- { -- symbol highlighting
    --     "tzachar/local-highlight.nvim",
    --     keys = {
    --         { "<leader>lh", "<cmd>LocalHighlightToggle<CR>" },
    --     },
    --     config = function()
    --         require("local-highlight").setup {
    --             hlgroup = "DiffAdd",
    --             cw_hlgroup = "DiffAdd",
    --         }
    --     end,
    -- },

    { -- surround text with anything you want!
        "kylechui/nvim-surround",
        version = "*",
        event = "InsertEnter",
    },

    { -- a file-system editable like a buffer
        "stevearc/oil.nvim",
    },

    { -- scrolloff for the end of file
        "Aasim-A/scrollEOF.nvim",
        config = function()
            require("scrollEOF").setup {
                insert_mode = true,
            }
        end,

        event = "BufRead",
    },

    { -- indent guides
        "lukas-reineke/indent-blankline.nvim",

        main = "ibl",
        event = "LspAttach",
    },

    { -- markdown previewing
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop", },
        ft = { "markdown" },
        lazy = true,
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", }
        },
        build = function()
            vim.fn["mkdp#util#install"]()
        end
    },

    { -- file "overview" tree
        "simrat39/symbols-outline.nvim",

        config = function()
            require("symbols-outline").setup()
        end,

        cmd = "SymbolsOutline",
    },

    -- {
    --     "jaxbot/semantic-highlight.vim",
    --     cmd = "SemanticHighlightToggle",
    -- },

    -- {
    --     "tpope/vim-abolish",
    --     lazy = false,
    -- },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },

    {
        "sontungexpt/url-open",
        branch = "mini",
        cmd = "URLOpenUnderCursor",

        config = function()
            local status_ok, url_open = pcall(require, "url-open")

            if status_ok then
                url_open.setup({})
            end
        end,
    },

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",

        opts = {
            window = {
                backdrop = 1.0,
            },
        },
    },

    {
        "lewis6991/gitsigns.nvim",

        config = function()
            require("gitsigns").setup()
        end,

        event = "BufRead"
    },

    {
        "tikhomirov/vim-glsl",
        lazy = false,
    },
}, {
    defaults = {
        lazy = true,
    },
})
