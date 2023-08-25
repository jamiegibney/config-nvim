vim.g.mapleader = " "
vim.g.hardtime_timeout = 1000
vim.g.hardtime_allow_different_key = 1

-- vim.keymap.set("n", "h", "")
-- vim.keymap.set("n", "l", "")
-- vim.keymap.set("i", "<C-h>", "")
-- vim.keymap.set("i", "<C-l>", "")

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
vim.keymap.set("n", "<Esc>", ":let @/ = ''<CR>")

-- "write file"
vim.keymap.set("n", "<leader>wf", ":w<CR>")

-- move by wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- "write & source"
vim.keymap.set("n", "<leader>ws", ":w<CR>:so<CR>")

-- "file system" (or "fuck sake", as I like to think of it)
vim.keymap.set("n", "<leader>fs", ":Oil<CR><C-p>")

-- move line up/down
vim.keymap.set("n", "<C-k>", ":move -2<CR>==")
vim.keymap.set("n", "<C-j>", ":move +1<CR>==")

-- keep caret at start of line when using J
-- vim.keymap.set("n", "J", "mzJ'z")

-- insert trailing semicolon
vim.keymap.set("n", "<S-CR>", "A;<C-c>")

-- window management
-- decrease split width
vim.keymap.set("n", "<C-,>", "4<C-w><")
-- increase split width
vim.keymap.set("n", "<C-.>", "4<C-w>>")
-- decrease split height
vim.keymap.set("n", "<C-->", "4<C-w>-")
-- increase split height
vim.keymap.set("n", "<C-=>", "4<C-w>+")

-- "split vertical"
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w><C-w>")
-- "split horizontal"
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w><C-w>")
-- "hide window"
vim.keymap.set("n", "<leader>hw", ":hide<CR>")
-- "close window"
vim.keymap.set("n", "<leader>cw", "ZZ")
-- close all other splits
vim.keymap.set("n", "<leader><leader>", "<C-w>o")

-- "clear edits"
vim.keymap.set("n", "<leader>ce", ":e!<CR>")

-- "spelling"
vim.keymap.set("n", "<leader>sp", ":set spell!<CR>")

-- retain content of register after pasting into a selection
vim.keymap.set("x", "<leader>p", "\"_dP")

-- "replace all"
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- * --  INSERT  -- * --

-- insert trailing semicolon
vim.keymap.set("i", "<S-CR>", "<C-c>A;<C-c>")

-- enter new line without continuing the comment
vim.keymap.set("i", "<C-CR>", "<CR><C-c>\"_S")

-- caret navigation in insert mode
vim.keymap.set("i", "<C-k>", "<C-c>gka")
vim.keymap.set("i", "<C-j>", "<C-c>gja")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- allow editing across multiple lines in visual block mode when exiting insert
vim.keymap.set("i", "<C-c>", "<Esc>")
-- vim.keymap.set("i", "<Esc>", "<Esc>")

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
