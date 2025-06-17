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
    { "rose-pine/neovim",              event = "VeryLazy", enabled = true },
    { "Everblush/nvim",                event = "VeryLazy", enabled = false },
    { "eddyekofo94/gruvbox-flat.nvim", event = "VeryLazy", enabled = false },
    { "luisiacc/gruvbox-baby",         event = "VeryLazy", enabled = false },
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
        setup = require("setup.plugins.fidget"),
        enabled = false,
    },

    { -- lsp stuff
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "saghen/blink.cmp",
                event = "VimEnter",
                lazy = false,
                version = "1.*",
                opts = {
                    keymap = {
                        preset = "none",
                        ["<C-y>"] = {
                            "select_and_accept",
                            function(cmp)
                                cmp.show_and_insert({
                                    providers = { "lsp" },
                                })
                            end
                        },
                        ["<C-p>"] = {
                            "select_prev",
                            function(cmp)
                                cmp.show_and_insert({
                                    providers = { "path" },
                                })
                            end
                        },
                        ["<C-n>"] = {
                            "select_next",
                            function(cmp)
                                cmp.show_and_insert({
                                    providers = { "buffer", "omni" },
                                })
                            end
                        },
                        ["<C-e>"] = { "cancel" },
                        ["<C-f>"] = { "snippet_forward" },
                    },
                    completion = {
                        list = {
                            max_items = 80,
                        },
                        menu = {
                            auto_show = false,
                            draw = {
                                components = {
                                },
                            },
                        },
                    },
                    sources = {
                        default = { "lsp", "buffer", "path", "omni" },
                        per_filetype = {
                            md = { "buffer", "path" },
                            txt = { "buffer", "path" },
                        },
                    },
                    fuzzy = {
                        implementation = "prefer_rust",
                        use_frecency = true,
                        use_proximity = true,
                        sorts = {
                            "exact",
                            "score",
                            "sort_text",
                        },
                    },
                },
            }
        },

        config = function() require("setup.lsp") end,

        lazy = false,
    },

    -- { -- autocompletion
    --     "hrsh7th/nvim-cmp",
    --     lazy = false,
    --
    --     dependencies = {
    --         "hrsh7th/cmp-nvim-lsp",
    --         "saadparwaiz1/cmp_luasnip",
    --         { "hrsh7th/cmp-nvim-lua", ft = { "lua" } },
    --         "hrsh7th/cmp-buffer",
    --
    --         "felipelema/cmp-async-path",
    --         "L3MON4D3/LuaSnip",
    --     }
    -- },

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
        enabled = false,
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
        enabled = false,
    },

    { -- gamefied vim motions
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
        enabled = false,
    },

    { -- automatic commenting
        "numToStr/Comment.nvim",
        event = "BufEnter",
        enabled = false,
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
        enabled = false,
        tag = "v0.4.0",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            require("crates").setup({
                thousands_separator = ",",
                date_format = "%d-%m-%y",
                src = {
                    -- cmp = {
                    --     enabled = true,
                    -- }
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

        event = "BufRead",
        enabled = false,
    },

    {
        "refractalize/oil-git-status.nvim",

        dependencies = {
            "stevearc/oil.nvim",
        },

        config = true,
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
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end
    },

    { -- file "overview" tree
        "simrat39/symbols-outline.nvim",

        config = function()
            require("symbols-outline").setup()
        end,

        cmd = "SymbolsOutline",
        keys = { { "<leader>so", "<cmd>SymbolsOutline<CR>" }, },
        enabled = false,
    },

    { -- move text to the centre of the screen
        "folke/zen-mode.nvim",
        enabled = false,
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
        cmd = "PickColor",
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
}, {
    defaults = {
        lazy = true,
    },
})
