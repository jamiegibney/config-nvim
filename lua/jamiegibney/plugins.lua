require("lazy").setup({
    { -- fuzzy finder
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- themes
    {
        "savq/melange-nvim",
        event = "VimEnter",
    },
    {
        "sainnhe/gruvbox-material",
    },

    { -- colorscheme generation
        "rktjmp/lush.nvim",
        event = "BufEnter",
    },

    { -- ast stuff
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    { -- top-of-buffer context
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                max_lines = 2,
                -- highlight group?
            }
        end,
        lazy = false,
    },
    {
        "nvim-treesitter/playground",
    },

    { -- undo tree
        "mbbill/undotree",
    },

    { -- git status
        "tpope/vim-fugitive",
    },

    { -- lsp bundle
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            {
                "hrsh7th/nvim-cmp",
                event = "InsertEnter",
            }, -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" }, -- Required

            -- autocomplete sources
            { "saadparwaiz1/cmp_luasnip" },
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
    },

    { -- auto-pairing of () [] {} <> "" '', etc
        "windwp/nvim-autopairs",
        opts = {
            disable_filetype = { "TelescopePrompt", "vim", "plain text", "txt" },
        },
        config = function()
            require("nvim-autopairs").setup {}
        end,
    },

    { -- rust enhancements
        "simrat39/rust-tools.nvim",
    },

    { -- debugging tool
        "mfussenegger/nvim-dap",
    },

    { -- auto-saving
        "Pocco81/auto-save.nvim",
        lazy = false,
    },

    { -- gamefied vim motions
        "ThePrimeagen/vim-be-good",
    },

    { -- lsp loading widget
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
    },

    { -- automatic commenting
        "numToStr/Comment.nvim",
        lazy = false,
    },

    { -- awesome buffer visuals
        "eandrju/cellular-automaton.nvim",
        keys = {
            { "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>" },
        },
    },

    { -- fast buffer switching
        "theprimeagen/harpoon",
        config = function()
            require("harpoon").setup {
                save_on_toggle = true,
            }
        end,
    },

    { -- devicons
        "nvim-tree/nvim-web-devicons",
    },

    { -- startup screen
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.custom_theme").config)
        end,
    },

    { -- startup diagnostics
        "dstein64/vim-startuptime",
        lazy = false,
    },

    { -- buffer minimap
        "wfxr/minimap.vim",
        event = "BufEnter",
    },

    { -- rust crate tools
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
        --[[ config = function()
      require("crates").setup()
    end, ]]
    },

    { -- colour picker
        "ziontee113/color-picker.nvim",
        --[[ config = function()
      require("color-picker").setup()
    end, ]]
    },

    { -- better formatting
        "sbdchd/neoformat",
        event = "BufEnter",
    },

    { -- better terminals
        "akinsho/toggleterm.nvim",
        version = "*",
    },

    { -- symbol highlighting
        "tzachar/local-highlight.nvim",
        keys = {
            { "<leader>lh", "<cmd>LocalHighlightToggle<CR>" },
        },
        config = function()
            require("local-highlight").setup {
                hlgroup = "DiffAdd",
                cw_hlgroup = "DiffAdd",
            }
        end,
        lazy = true,
    },

    { -- surround text with delimiters, etc.
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },

    { -- a file-system editable like a buffer
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { -- scrolloff for the end of file
        "Aasim-A/scrollEOF.nvim",
        config = function()
            require("scrollEOF").setup {
                insert_mode = true,
            }
        end,
    },

    {
        "rmagatti/goto-preview",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
    },

    {
        "chiendo97/intellij.vim",
    },

    {
        "takac/vim-hardtime",
    },
}, {
    defaults = {
        lazy = false,
    },
})
