--[[ require("nice-reference").setup {
  border = "double",
  auto_choose = true,
}

-- vim.keymap.set("n", "gr", "")
vim.lsp.handlers["textDocument/references"] = require("nice-reference").reference_handler
]]
