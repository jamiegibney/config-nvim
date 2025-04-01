require("lazy").setup({
    { -- fuzzy finder
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            { "nvim-lua/plenary.nvim", },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            -- { "nvim-telescope/telescope-smart-history.nvim", },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files", },
            { "<leader>fw", "<cmd>Telescope live_grep", },
            { "<leader>fo", "<cmd>Telescope oldfiles", },
        },
        cmd = "Telescope",
    },

    { "savq/melange-nvim",             event = "VeryLazy", enabled = true },
    { "Everblush/nvim",                event = "VeryLazy", enabled = false },
    { "eddyekofo94/gruvbox-flat.nvim", event = "VeryLazy", enabled = false },
    { "luisiacc/gruvbox-baby",         event = "VeryLazy", enabled = false },
    { "rose-pine/neovim",              event = "VeryLazy", enabled = false },
    { "rebelot/kanagawa.nvim",         event = "VeryLazy", enabled = false },
    { "rjshkhr/shadow.nvim",           event = "VeryLazy", enabled = false },

    { -- syntax highlighting
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "LspAttach",
    },

    { -- top-of-buffer context
        "nvim-treesitter/nvim-treesitter-context",
        event = "LspAttach",
        config = function()
            require("treesitter-context").setup({
                max_lines = 5,
            })
        end,
    },

    -- { -- undo tree
    --     "mbbill/undotree",
    --     keys = { "<leader>u" },
    -- },

    -- { -- git status
    --     "tpope/vim-fugitive",
    --     event = "VeryLazy",
    -- },

    { -- lsp loading widget
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        setup = require("setup.plugins.fidget")
    },

    { -- lsp stuff
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            { "folke/neodev.nvim", ft = { "lua" } },
        },
    },

    {
        "Issafalcon/lsp-overloads.nvim",
        event = "LspAttach",
    },

    { -- autocompletion
        "hrsh7th/nvim-cmp",
        lazy = false,

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            { "hrsh7th/cmp-nvim-lua", ft = { "lua" } },
            "hrsh7th/cmp-buffer",

            "felipelema/cmp-async-path",
            "L3MON4D3/LuaSnip",
        }
    },

    -- { -- rust-tools replacement
    --     "mrcjkb/rustaceanvim",
    --     version = "^3",
    --
    --     ft = {
    --         "rust",
    --     },
    -- },

    { -- rust enhancements
        "simrat39/rust-tools.nvim",
        ft = { "rust", },
    },

    { -- debugging tools
        "mfussenegger/nvim-dap",

        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",
        },
    },

    { -- auto-saving
        "Pocco81/auto-save.nvim",
        lazy = false,
    },

    { -- gamefied vim motions
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
    },

    { -- automatic commenting
        "numToStr/Comment.nvim",
        event = "BufEnter",
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
        lazy = false,
    },

    { -- surround text with anything you want!
        "kylechui/nvim-surround",
        version = "*",
        event = "InsertEnter",
    },

    { -- scrolloff for the end of file
        "Aasim-A/scrollEOF.nvim",
        config = function()
            require("scrollEOF").setup {
                insert_mode = true,
            }
        end,
        -- enabled = false,

        event = "BufRead",
    },

    {
        "refractalize/oil-git-status.nvim",

        dependencies = {
            "stevearc/oil.nvim",
        },

        config = true,
    },

    { -- a file-system editable like a buffer
        "stevearc/oil.nvim",
    },

    { -- indent guides
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = false,
    },

    { -- markdown previewing
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop", },
        ft = { "markdown" },
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
        keys = { { "<leader>so>", "<cmd>SymbolsOutline<CR>" }, },
        enabled = false,
    },

    { -- move text to the centre of the screen
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        keys = { "<leader>mm" },
        opts = {
            window = {
                backdrop = 1.0,
            },
        },
    },

    { -- show git diff in buffer
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
        event = "BufRead",
    },

    { -- show marks in the sign column
        "kshenoy/vim-signature",
        event = "BufRead",
        enabled = false,
    },

    { -- pick colours directly in the editor
        "ziontee113/color-picker.nvim",
        lazy = false,
        keys = { "<leader>pc" },
        config = function()
            require("color-picker").setup()
        end
    },

    { -- case formatting coercion
        "tpope/vim-abolish",
        event = "BufRead",
    },

    {
        "m4xshen/hardtime.nvim",
        lazy = false,
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        enabled = false,
    },

    {
        "MeanderingProgrammer/markdown.nvim",
        main = "render-markdown",
        ft = { "markdown" },
        enabled = false,
    },

    {
        "madskjeldgaard/cppman.nvim",
        dependencies = { "MunifTanjim/nui.nvim", },
        config = function()
            local cppman = require("cppman")
            cppman.setup()

            -- vim.keymap.set("n", "<leader>cm", function()
            --     cppman.open_cppman_for(vim.fn.expand("<cword>"))
            -- end)
        end,
        keys = {
            { "<leader>cm", "<cmd>lua require('cppman').open_cppman_for(vim.fn.expand('<cword>'))<CR>", },
        },
        enabled = false,
    },

    {
        "junegunn/vim-easy-align",
        lazy = false,
    },

    -- {
    --     "rachartier/tiny-inline-diagnostic.nvim",
    --     event = "VeryLazy",
    --     priority = 1000,
    --     -- config = function()
    --     -- end
    -- },

    -- {
    --     "saghen/blink.cmp",
    --     lazy = false,
    --     -- optional: provides snippets for the snippet source
    --     -- dependencies = "rafamadriz/friendly-snippets",
    --
    --     version = "v0.*",
    -- },
}, {
    defaults = {
        lazy = true,
    },
})
