-- the leader key, set to space
vim.g.mapleader = " "


-- * --  NORMAL MODE  -- * --

-- toggle line comment
vim.keymap.set("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end)

-- "git status"
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- "undo"-tree
-- vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- keep the caret centred in big vertical motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

-- clear search highlight (but not the search term, so n and N will work)
vim.keymap.set("n", "<C-c>", ":noh<CR>")
vim.keymap.set("n", "<Esc>", ":noh<CR>")

-- move through soft-wrapped lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- "write & source"
vim.keymap.set("n", "<leader>ws", ":w<CR>:so<CR>")

-- "file system" (or "fuck sake", which is funnier)
vim.keymap.set("n", "<leader>fs", ":Oil<CR>")
-- floating option of the above - make sure <C-c> to close is set in after/oil.lua
-- vim.keymap.set("n", "<leader>fs", ":Oil --float<CR>")

-- "previous file"
vim.keymap.set("n", "<leader>pf", "<C-^>")

-- move current line up/down and auto-indent
vim.keymap.set("n", "<C-k>", ":move -2<CR>==")
vim.keymap.set("n", "<C-j>", ":move +1<CR>==")

-- insert semicolon at end of line
vim.keymap.set("n", "<C-CR>", "A;<C-c>")

-- split resizign
-- decrease split width
vim.keymap.set("n", "<C-,>", "4<C-w><")
-- increase split width
vim.keymap.set("n", "<C-.>", "4<C-w>>")
-- decrease split height
vim.keymap.set("n", "<C-->", "4<C-w>-")
-- increase split height
vim.keymap.set("n", "<C-=>", "4<C-w>+")

-- splits
-- "split vertical"
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w><C-w>")
-- "split horizontal"
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w><C-w>")
-- "hide window"
vim.keymap.set("n", "<leader>hw", ":hide<CR>")
-- "close window"
vim.keymap.set("n", "<leader>cw", "ZZ")
-- close all other splits, i.e. "maximise" the current split
vim.keymap.set("n", "<leader><leader>", "<C-w>o")

-- tabs
-- "new tab"
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
-- "open (current buffer in) tab"
vim.keymap.set("n", "<leader>ot", ":tab split<CR>")
-- "close tab"
vim.keymap.set("n", "<leader>ct", ":tabclose<CR>")
-- "tab next"
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>")
-- "tab previous"
vim.keymap.set("n", "<leader>tp", ":tabprev<CR>")
-- "tab only" - close all tabs but the current
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")

-- "clear edits"
vim.keymap.set("n", "<leader>ce", ":e!<CR>")

-- "spelling" - enable typo highlighting
vim.keymap.set("n", "<leader>sp", ":set spell!<CR>")

-- retain content of register after pasting into a selection
vim.keymap.set("x", "<leader>p", "\"_dP")

-- "replace all" - substitute all matched instances of the word under cursor
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- "expand braces"
vim.keymap.set("n", "<leader>eb", "_f{a<CR><Esc>f}i<CR><Esc>")

-- "autosave"
vim.keymap.set("n", "<leader>as", "<cmd>ASToggle<CR>")

-- Normal mode unmaps
-- use x!
vim.keymap.set("n", "<Del>", "")
-- use j!
vim.keymap.set("n", "<CR>", "")
vim.keymap.set("n", "<C-n>", "")
-- use k!
vim.keymap.set("n", "<C-p>", "")
-- use h!
vim.keymap.set("n", "<BS>", "")


-- * --  INSERT MODE  -- * --

-- insert trailing semicolon and enter normal mode
vim.keymap.set("i", "<C-CR>", "<C-c>A;<C-c>")

-- caret navigation in insert mode
vim.keymap.set("i", "<C-k>", "<C-c>gka")
vim.keymap.set("i", "<C-j>", "<C-c>gja")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- allows visual block edits to apply across multiple lines when using <C-c>
vim.keymap.set({ "i", "v", "c" }, "<C-c>", "<Esc>", { noremap = true, })

-- this allows <C-c> to exit replace mode
-- unfortunately this also breaks the replace mode cursor :/
-- vim.keymap.set("n", "r<C-c>", "<Esc>")


-- * --  VISUAL MODE  -- * --

-- move selected block and auto-indent
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv=gv")

-- linewise comment selection - use "gb" to "go blockwise" around a selection
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

-- folding
vim.keymap.set("v", "<leader>fl", "")


-- unmaps all the function keys
require("jamiegibney/unmapped_function_keys")
