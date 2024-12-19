-- the leader key, set to space
vim.g.mapleader = " "

local function map(mode, keys, func)
    vim.keymap.set(mode, keys, func)
end

-- * --  NORMAL MODE  -- * --

-- toggle line comment
map("n", "<leader>/", function()
    require("Comment.api").toggle.linewise.current()
end)

-- git "diff"
map("n", "<leader>df", function()
    vim.cmd("Gitsigns toggle_word_diff")
    vim.cmd("Gitsigns toggle_linehl")
    vim.cmd("Gitsigns toggle_deleted")
end)

-- "git add" (the current buffer)
map("n", "<leader>ga", "<cmd>!git add %<CR>")

-- "git status"
-- map("n", "<leader>gs", vim.cmd.Git)

-- zen "mode"
map("n", "<leader>mm", "<cmd>ZenMode<CR>")

-- keep the caret centred in big vertical motions
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- clear search highlight (but not the search term, so n and N will work)
map("n", "<C-c>", function() error("PRESS ESC!") end)
map("n", "<Esc>", ":noh<CR>")

-- move through soft-wrapped lines
-- map("n", "j", "gj")
-- map("n", "k", "gk")
-- map("n", "gj", "j")
-- map("n", "gk", "k")

-- "write & source"
map("n", "<leader>ws", ":w<CR>:so<CR>:echo 'File written and sourced'<CR>")

-- "file system" (or "fuck sake" as I affectionately call it)
map("n", "<leader>fs", ":Oil<CR>")
-- floating option of the above - make sure <C-c> to close is set in after/oil.lua
-- map("n", "<leader>fs", ":Oil --float<CR>")

-- "previous file"
map("n", "<leader>pf", "<C-^>:echo 'Switched to previous file'<CR>")

-- move current line up/down and auto-indent
map("n", "<C-p>", "V:move '<-2<CR>gv=gv<Esc>")
map("n", "<C-n>", "V:move '>+1<CR>gv=gv<Esc>")

-- insert semicolon at end of line
map("n", "<C-CR>", "A;<Esc>")

-- copy contents of buffer
map("n", "<leader>%", "<cmd>%y<CR>")

-- crudely convert snake_case to camelCase
map("n", "<leader>cc", "f_x~;x~;x~;x~;x~;x~;x~;x~")

-- "read me"
map("n", "<leader>rm", function()
    local function open(name)
        vim.cmd("edit " .. name)
        print("Opened README")
    end

    -- search for different common variations of READMEs first
    if #vim.fs.find({ "README.md" }, { type = "file" }) >= 1 then
        open("README.md")
    elseif #vim.fs.find("README", { type = "file" }) >= 1 then
        open("README")
    elseif #vim.fs.find("readme.md", { type = "file" }) >= 1 then
        open("readme.md")
    elseif #vim.fs.find("readme", { type = "file" }) >= 1 then
        open("readme")
    else
        -- if none found, just create README.md
        vim.cmd("edit README.md")
        print("No README found; created README.md")
    end
end)

-- "git ignore"
map("n", "<leader>gi", function()
    if #vim.fs.find({ ".gitignore" }, { type = "file" }) >= 1 then
        print("Opened gitignore")
    else
        print("No .gitignore found; created new .gitignore file")
    end

    vim.cmd("edit .gitignore")
end)

map("n", "<leader>th", function()
    vim.cmd("edit ~/.config/nvim/lua/setup/theme.lua")
end)

-- split resizign
-- decrease split width
map("n", "<C-,>", "4<C-w><")
-- increase split width
map("n", "<C-.>", "4<C-w>>")
-- decrease split height
map("n", "<C-->", "4<C-w>-")
-- increase split height
map("n", "<C-=>", "4<C-w>+")

-- splits
-- "split vertical"
map("n", "<leader>sv", "<C-w>v<C-w><C-w>")
-- "split horizontal"
map("n", "<leader>sh", "<C-w>s<C-w><C-w>")
-- "close window"
map("n", "<leader>cw", "ZZ")
-- close all other splits, i.e. "maximise" the current split
map("n", "<leader><leader>", "<C-w>o")

-- tabs
-- "new tab"
map("n", "<leader>nt", ":tab split<CR>")
-- -- "open (current buffer in) tab"
-- map("n", "<leader>ot", ":tab split<CR>")
-- "close tab"
map("n", "<leader>ct", ":tabclose<CR>")
-- "tab next"
map("n", "<leader>tn", ":tabnext<CR>")
-- "tab previous"
map("n", "<leader>tp", ":tabprev<CR>")
-- "tab only" - close all tabs but the current
map("n", "<leader>to", ":tabonly<CR>")

-- unmap tagstack for tmux
map("n", "<C-t>", "")

-- "spelling" - enable typo highlighting
map("n", "<leader>sp", function()
    vim.cmd("set spell!")

    if vim.opt.spell:get() then
        print("Spell-checking enabled")
    else
        print("Spell-checking disabled")
    end
end)

map("n", "<C-c>", ":ToggleTerm <CR><C-c>")

-- retain content of register after pasting into a selection
map("x", "<leader>p", "\"_dP")

-- "replace all" - substitute all matched instances of the word under cursor
map("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- "expand braces"
map("n", "<leader>eb", "_f{a<CR><Esc>_f}i<CR><Esc>")

-- Normal mode unmaps
-- use x!
map("n", "<Del>", "")
-- use j!
map("n", "<CR>", "")
-- use k!
-- use h!
map("n", "<BS>", "")
--
map("n", "<C-f>", "")

-- goto neovim config directory "neovim config"
map("n", "<leader>ncfg", "<cmd>Oil ~/.config/nvim/<CR>")

-- goto rust playground directory "rust playground"
map("n", "<leader>rpg", "<cmd>Oil ~/Documents/dev/Rust/playground/<CR>")

-- "crate"
map("n", "<leader>cr", function()
    require("crates").show_popup()
end)

-- "open here" (in finder)
map("n", "<leader>oh", function()
    vim.cmd("!open .")
end)

-- "pick color"
map("n", "<leader>pc", function()
    vim.cmd("PickColor")
end)

-- * --  INSERT MODE  -- * --

map("i", "<C-c>", function() error("PRESS ESC!") end)

-- insert trailing semicolon and enter normal mode
map("i", "<C-CR>", "<Esc>A;<Esc>")

-- open line below cursor in insert
map("i", "<C-o>", "<Esc>O")

-- backwards-deletes a word in insert mode
map("i", "<C-BS>", "<C-w>")

-- allows visual block edits to apply across multiple lines when using <C-c>
map({ "i", "v", "c", "s" }, "<Esc>", "<Esc>")

-- * --  VISUAL MODE  -- * --

-- easy align
map({ "v", "n" }, "<leader>ea", "<Plug>(EasyAlign)")

-- move selected block and auto-indent
map("v", "<C-p>", ":move '<-2<CR>gv=gv")
map("v", "<C-n>", ":move '>+1<CR>gv=gv")

-- linewise comment
map("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

-- "go block" - blockwise comment selection
map("v", "gb", "<Plug>(comment_toggle_blockwise_visual)")

-- folding
map("v", "<leader>fl", ":fold<CR>")
