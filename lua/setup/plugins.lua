require("lazy").setup({
    { -- fuzzy finder
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = {
            { "nvim-lua/plenary.nvim", },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-telescope/telescope-smart-history.nvim", },
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files", },
            { "<leader>fw", "<cmd>Telescope live_grep", },
            { "<leader>fo", "<cmd>Telescope oldfiles", },
        },
        cmd = "Telescope",
    },

    -- themes
    { "savq/melange-nvim", event = "VeryLazy", },
    -- { "rose-pine/neovim", name = "rose-pine", event = "VeryLazy", },
    -- { "ellisonleao/gruvbox.nvim", event = "VeryLazy", },

    { -- ast stuff
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "LspAttach",
    },

    { -- top-of-buffer context
        "nvim-treesitter/nvim-treesitter-context",
        event = "LspAttach",
        config = function()
            require("treesitter-context").setup {
                max_lines = 3,
            }
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
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "folke/neodev.nvim",
                event = "BufEnter *.lua",
            },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        lazy = false,

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
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

    {
        "simrat39/rust-tools.nvim",
        event = "BufEnter *.rs",
    },

    { -- debugging tool
        "mfussenegger/nvim-dap",
        enabled = false,
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

    -- { -- startup screen
    --     "goolord/alpha-nvim",
    --     cmd = "Alpha",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = function()
    --         require("alpha").setup(require("alpha.themes.custom_theme").config)
    --     end,
    --     enabled = false,
    -- },

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

    { -- a file-system editable like a buffer
        "stevearc/oil.nvim",
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
        enabled = false,
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
        event = "BufRead",
    },

    {
        "kshenoy/vim-signature",
        event = "BufRead",
    },

    {
        "ziontee113/color-picker.nvim",
        lazy = false,
        config = function()
            require("color-picker").setup()
        end
    },
}, {
    defaults = {
        lazy = true,
    },
})
