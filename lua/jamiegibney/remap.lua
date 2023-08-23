vim.g.mapleader = " "

-- * --  NORMAL  -- * --

-- toggle line comment
vim.keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end)

-- keep the caret centred during big motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- clear current search (and highlighting)
vim.keymap.set("n", "<C-c>", ":let @/ = ''<CR>")

-- "write file"
vim.keymap.set("n", "<leader>wf", ":w<CR>")

-- "write & source"
vim.keymap.set("n", "<leader>ws", ":w<CR>:so<CR>")

-- "file system"
-- vim.keymap.set("n", "<leader>fs", ":Neotree reveal<CR>")
vim.keymap.set("n", "<leader>fs", ":Oil<CR>")

-- move line up/down
vim.keymap.set("n", "<C-k>", ":move -2<CR>==")
vim.keymap.set("n", "<C-j>", ":move +1<CR>==")

-- keep caret at start of line when using J
-- vim.keymap.set("n", "J", "mzJ'z")

-- insert trailing semicolon
vim.keymap.set("n", "<S-CR>", "A;<C-c>")

-- window management
-- decrease split width
vim.keymap.set("n", "<C-[>", "3<C-w><")
-- increase split width
vim.keymap.set("n", "<C-]>", "3<C-w>>")
-- "hide window"
vim.keymap.set("n", "<leader>hw", ":hide<CR>")
-- "close window"
vim.keymap.set("n", "<leader>cw", "ZZ")

-- "clear edits"
vim.keymap.set("n", "<leader>ce", ":e!<CR>")

-- "spelling"
vim.keymap.set("n", "<leader>sp", ":set spell!<CR>")

-- make the buffer rain!
vim.keymap.set("n", "<leader>mr", ":CellularAutomaton make_it_rain<CR>")

-- retain content of register after pasting into a selection
vim.keymap.set("x", "<leader>p", "\"_dP")

-- "replace all"
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- close all other splits
vim.keymap.set("n", "<leader><leader>", "<C-w>o")

-- * --  INSERT  -- * --

-- insert trailing semicolon
vim.keymap.set("i", "<S-CR>", "<C-c>A;")

-- enter new line without continuing the comment
vim.keymap.set("i", "<C-CR>", "<C-c>jO")

-- caret navigation in insert mode
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- allow editing across multiple lines in visual block mode when exiting
vim.keymap.set("i", "<C-c>", "<Esc>")

-- * --  VISUAL  -- * --

-- move selected block
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv=gv")
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv=gv")

-- block-comment around selection
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

-- * --  TERMINAL -- * --

-- toggle terminal/normal mode
vim.keymap.set("t", "<C-`>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-`>", "i")
