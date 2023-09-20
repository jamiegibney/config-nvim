require("lazy").setup({
    { -- fuzzy finder
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "debugloop/telescope-undo.nvim",
        },
        event = "UIEnter",
    },

    -- themes
    {
        "savq/melange-nvim",
        event = "VimEnter",
    },
    {
        "sainnhe/gruvbox-material",
        name = "gruvbox-material",
        lazy = false,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
    },
    { -- colorscheme generation
        "rktjmp/lush.nvim",
    },

    { -- ast stuff
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        -- event = "LspAttach",
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

    -- { -- undo tree
    --     "mbbill/undotree",
    --     event = "BufRead",
    -- },

    { -- git status
        "tpope/vim-fugitive",
        lazy = false,
    },

    { -- lsp bundle
        "VonHeikemen/lsp-zero.nvim",
        config = function()
            local lsp = require("lsp-zero").preset {
                configure_diagnostics = true,
                setup_servers_on_start = true,
                set_lsp_keymaps = false,
                --[[ manage_nvim_cmp = {
                    set_sources = "recommended",
                    set_basic_mappings = false,
                    set_extra_mappings = false,
                    use_luasnip = true,
                    set_format = true,
                    documentation_window = true,
                }, ]]
            }

            --[[ local cmp = require "cmp"
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"

            local cmp_select = { behaviour = cmp.SelectBehavior.Insert }
            local cmp_mappings = lsp.defaults.cmp_mappings {
                -- ["<CR>"] = cmp.mapping.confirm { select = true },
                ["<C-y>"] = cmp.mapping.confirm { select = true },
                ["<C-e>"] = cmp.mapping.abort(),

                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),

                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-f>"] = cmp.mapping.scroll_docs(-4),

                ["<C-i>"] = cmp.mapping.complete(),

            }
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            lsp.setup_nvim_cmp {
                mapping = cmp_mappings,
                window = {
                    completion = {
                        scrolloff = 5,
                        side_padding = 1,
                    },
                    preselect = require("cmp").PreselectMode.None,
                    complete = {
                        completeopt = "menu,menuone,noinsert,noselect",
                    },
                },
            } ]]

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                },
            })

            -- LSP keymaps are here - note that the default implementation of
            -- any of these keymaps will be used if an LSP server is not available
            -- for the current buffer. also, Telescope implements the LSP references
            -- with "gr" ("go references"), and goto-preview implements (type)
            -- definition preview with "<leader>gd/td".
            lsp.on_attach(function(client, bufnr)
                -- lsp action - "action"
                vim.keymap.set("n", "<leader>a", function()
                    vim.lsp.buf.code_action()
                end)

                -- lsp info - "info"
                vim.keymap.set("n", "<leader>i", function()
                    vim.lsp.buf.hover()
                end)

                -- lsp signature
                vim.keymap.set("n", "<leader>ls", function()
                    vim.lsp.buf.signature_help()
                end)

                -- lsp rename
                vim.keymap.set("n", "<leader>rn", function()
                    vim.lsp.buf.rename()
                end)

                -- lsp format
                vim.keymap.set("n", "<leader>fm", function()
                    vim.lsp.buf.format { async = true }
                end)

                -- lsp usages - "go usages"
                vim.keymap.set("n", "<leader>gu", function()
                    vim.lsp.buf.usages()
                end)

                -- lsp definition - "go definition"
                vim.keymap.set("n", "gd", function()
                    vim.lsp.buf.definition()
                end)

                -- lsp type definition - "type definition"
                vim.keymap.set("n", "td", function()
                    vim.lsp.buf.type_definition()
                end)

                -- lsp diagnostics - "DiagNostics"
                vim.keymap.set("n", "<leader>dn", function()
                    vim.diagnostic.open_float {
                        border = "rounded",
                        source = true,
                    }
                end)
            end)

            -- require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

            lsp.set_server_config {
                on_init = function(client)
                    client.server_capabilities.documentFormattingProvider = true
                    client.server_capabilities.documentRangeFormattingProvider = true
                end,
            }

            lsp.set_sign_icons {
                error = "✘",
                warn = "!",
                hint = "~",
                info = "-",
            }

            require("lspconfig").clangd.setup({
                cmd = {
                    "clangd",
                    "--clang-tidy",
                },
            })

            lsp.skip_server_setup { "rust_analyzer" }

            lsp.setup()

            -- prints a table out
            local function tprint(tbl, indent)
                if not indent then
                    indent = 0
                end
                for k, v in pairs(tbl) do
                    local formatting = string.rep("{ ", indent) .. k .. ": "
                    if type(v) == "table" then
                        print(formatting)
                        tprint(v, indent + 1)
                    elseif type(v) == "boolean" then
                        print(formatting .. tostring(v))
                    else
                        print(formatting .. v)
                    end
                end
            end

            -- TODO: this does not work if the "for further information" dialogue is the last line of the message
            -- removes "for further information" message in clippy diagnostics
            local function remove_further_information(msg)
                local start, _ = string.find(msg, "for further information")
                if start == nil then
                    return msg
                end

                local last = 0
                local i = 0
                while true do
                    i = string.find(msg, "\n", last + 1)
                    if i == nil then
                        break
                    end
                    last = i
                end

                local result = string.sub(msg, 1, start - 1) .. string.sub(msg, last)
                return result
            end

            vim.diagnostic.config {
                virtual_text = {
                    spacing = 3,
                    format = function(diag)
                        return remove_further_information(diag.message)
                    end,
                },
                signs = true,
                update_in_insert = true,
                underline = true,
                severity_sort = true,
            }
        end,

        branch = "v2.x",
        event = "VeryLazy",

        dependencies = {
            -- LSP Support
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            -- {
            --     "hrsh7th/nvim-cmp",
            --     event = "InsertEnter",
            -- },
            -- {
            --     "hrsh7th/cmp-nvim-lsp",
            --     event = "BufRead",
            -- },

            {
                "L3MON4D3/LuaSnip",
                event = "InsertEnter",
            },

            -- autocomplete sources
            -- "saadparwaiz1/cmp_luasnip",
            -- "hrsh7th/cmp-nvim-lua",
            -- "hrsh7th/cmp-nvim-lsp",
            -- "hrsh7th/cmp-buffer",
            -- "hrsh7th/cmp-path",
        },
    },

    {
        "ms-jpq/coq_nvim",
        dependencies = {
            "ms-jpq/coq.thirdparty",
            "ms-jpq/coq.artifacts",
        },

        lazy = false,
    },

    {
        "ms-jpq/coq.artifacts",
    },

    {
        "ms-jpq/coq.thirdparty",
    },

    { -- auto-pairing of () [] {} <> "" '', etc
        "windwp/nvim-autopairs",
        opts = {
            disable_filetype = { "TelescopePrompt", "vim", "plain text", "txt" },
        },
        config = function()
            require("nvim-autopairs").setup {}
        end,
        event = "InsertEnter",
    },

    { -- rust enhancements
        "simrat39/rust-tools.nvim",
        event = "BufRead",
    },

    { -- debugging tool
        "mfussenegger/nvim-dap",
        event = "BufRead",
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
        },
    },

    { -- fast buffer switching
        "theprimeagen/harpoon",
        config = function()
            require("harpoon").setup {
                save_on_toggle = true,
            }
        end,
        event = "BufRead",
    },

    { -- devicons
        "nvim-tree/nvim-web-devicons",
    },

    { -- startup screen
        "goolord/alpha-nvim",
        -- toggle the below to enable alpha
        -- event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("alpha").setup(require("alpha.themes.custom_theme").config)
        end,
    },

    { -- buffer minimap
        "wfxr/minimap.vim",
    },

    { -- rust crate tools
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    { -- colour picker
        "ziontee113/color-picker.nvim",
        cmd = "PickColor",
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
    },

<<<<<<< HEAD
    {                  -- surround text with anything you want!
=======
    {                  -- surround text with delimiters, etc.
>>>>>>> parent of cbac826 (added shortcut for telescope spell suggestions)
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
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

    { -- some floating preview windows
        "rmagatti/goto-preview",
        event = "BufRead",
    },

    { -- indent guides
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
    },
}, {
    defaults = {
        lazy = true,
    },
})
