require("rust-tools").setup({
    hover_actions = {
        auto_focus = true,
    },

    tools = {
        inlay_hints = {
            show_parameter_hints = true,
            only_current_line = true,
            highlight = "DiagnosticHint",
        },
    },

    server = {
        on_attach = function(client, bufnr)
            local map = function(keys, func)
                local opts = { buffer = bufnr }
                vim.keymap.set("n", keys, func, opts)
            end

            -- "code action"
            map("<leader>ca", function()
                require("rust-tools").code_action_group.code_action_group()
            end)

            -- "information"
            map("<leader>i", function() vim.lsp.buf.hover() end)

            -- "rename"
            map("<leader>rn", function() vim.lsp.buf.rename() end)

            -- "format"
            map("<leader>fm", function() vim.lsp.buf.format({ async = true }) end)

            -- "goto definition"
            map("gd", function() vim.lsp.buf.definition() end)

            -- "diagnostics"
            map("<leader>dn", function()
                vim.diagnostic.open_float({
                    source = true,
                })
            end)
        end,

        cmd = {
            "ra-multiplex",
            "client",
            "--server-path",
            "/Users/jamiegibney/.local/share/nvim/mason/bin/rust-analyzer",
        },

        settings = {
            ["rust-analyzer"] = {
                procMacro = {
                    enable = true,
                },
                lens = {
                    enable = false,
                },
                cachePriming = {
                    enable = false,
                },
                checkOnSave = {
                    command = "clippy",
                    extraArgs = {
                        "--all",
                        "--",
                        "-W",
                        "clippy::pedantic",
                        "-W",
                        "clippy::nursery",
                        "-W",
                        "clippy::style",
                        "-W",
                        "clippy::suspicious",
                        "-W",
                        "clippy::complexity",
                        "-W",
                        "clippy::perf",
                        "-W",
                        "clippy::clone_on_ref_ptr",
                        "-D",
                        "unsafe_op_in_unsafe_fn",
                        -- annoying casting lints that I never want to see again
                        "-A",
                        "clippy::cast_sign_loss",
                        "-A",
                        "clippy::cast_precision_loss",
                        "-A",
                        "clippy::cast_lossless",
                        "-A",
                        "clippy::cast_possible_truncation",
                        "-A",
                        "clippy::cast_possible_wrap",
                        -- and these...
                        -- "-A",
                        -- "clippy::missing_const_for_fn",
                        -- "-A",
                        -- "clippy::redundant_closure_for_method_calls",
                        "-A",
                        "clippy::must_use_candidate",
                    },
                },
                rustfmt = {
                    extraArgs = {
                        "--config",
                        "use_small_heuristics=Max,control_brace_style=ClosingNextLine,max_width=80,chain_width=60,overflow_delimited_expr=true,short_array_element_width_threshold=80,wrap_comments=true,use_field_init_shorthand=true",
                    },
                },
            },
        },
    },
})
