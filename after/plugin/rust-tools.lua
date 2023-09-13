require("rust-tools").setup {
  hover_actions = {
    auto_focus = true,
  },

  tools = {
    inlay_hints = {
      show_parameter_hints = false,
      only_current_line = true,
      highlight = "DiagnosticHint",
    },
  },

  server = {
    on_attach = function(_, bufnr)
      -- "code action"
      vim.keymap.set("n", "<leader>ca", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
      -- vim.keymap.set("n", "<leader>rr", require("rust-tools").runnables.runnables())
    end,

    settings = {
      ["rust-analyzer"] = {
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
          },
        },
        rustfmt = {
          extraArgs = {
            "--config",
            "use_small_heuristics=Max,control_brace_style=ClosingNextLine,max_width=80,chain_width=60,overflow_delimited_expr=true,short_array_element_width_threshold=100",
          },
        },
      },
    },
  },
}
