local opt = vim.opt
local cmd = vim.cmd

-- function to choose between a block or line cursor in insert mode
local function insert_with_block_cursor(use_block_cursor_in_insert)
    local prefix
    if use_block_cursor_in_insert then
        prefix = "n-v:block,"
    else
        prefix = "n-v:block,i-ci-ve:ver80,"
    end

    return string.format(
        "%sr-cr:hor80,o:hor50,c:ver80,a:blinkwait10-blinkoff350-blinkon350-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
        prefix
    )
end

-- the cursor!
opt.guicursor = insert_with_block_cursor(true)

-- keep only one status bar at the bottom of the screen
opt.laststatus = 3

-- whether the current indent should be copied to a new line
opt.autoindent = true
-- more contextual indenting, such as in {} blocks
opt.smartindent = true

-- the number of spaces to use for autoindent
opt.shiftwidth = 4
-- number of spaces which a tab should count for
opt.softtabstop = 4
-- use spaces for tabs in insert mode, and when using the <<>> commands
opt.expandtab = true

-- whether to automatically write to a buffer when abandoning it
opt.autowrite = true

-- nice colours :)
opt.termguicolors = true
-- this ensures that vim shares the system clipboard, which I prefer
opt.clipboard = "unnamedplus"

-- ignores the case of search/autocomplete commands
opt.ignorecase = true
-- disables ignorecase if the search pattern contains an uppercase character
opt.smartcase = true

-- whether the current line number should be shown or not
opt.number = true
-- whether line numbers should be relative to the current line or not
opt.relativenumber = true
-- the width in cells of the lines numbers
opt.numberwidth = 3
-- the number of signs in the signcolumn, which may increase the size of the "left margin"
vim.wo.signcolumn = "yes:2"

-- the minimum number of lines from the cursor to the top/bottom of the current buffer
opt.scrolloff = 16

-- this controls the CursorHold event, which is mainly used for the local highlighting plugin
opt.updatetime = 40

-- show the search update ("increment") as it is typed
opt.incsearch = true
-- highlight all search matches
opt.hlsearch = true

-- effectively soft-wrapping at the rhs of the current buffer
opt.linebreak = true
-- where to break lines for soft-wrapping
opt.breakat = " \t;:,!?."
-- the character at which wrapping will occur.
opt.textwidth = 85

-- the chars used after the EOF
opt.fillchars = { eob = " " }
-- enables a highlighted line where the cursor is
opt.cursorline = true

-- yes, this is a good idea
opt.undofile = true
-- the undo file directory
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- this can just get annoying
opt.swapfile = false

-- various file editing prompt options, such as writing
opt.shortmess = "OTxtIsonF"

-- theme background
opt.background = "light"
-- hide buffers when they abandoned
opt.hidden = true

-- language used for spell-checking
opt.spelllang = "en_us"

opt.shada = "!,'200,<50,s10,h"

-- you can also use:
--[[
api.nvim_create_autocmd({ "Events", }, {
    pattern = "*",
    callback = function()
        ...
    end,
})
]]

-- open help windows in a vertical split
cmd "autocmd BufEnter * if &ft ==# 'help' | wincmd L | endif"
cmd "autocmd BufEnter * setlocal formatoptions-=o"
-- centres the window upon opening a buffer
cmd "autocmd BufWinEnter * exe 'normal zz'"
-- opens terminal in insert mode
cmd "autocmd TermOpen * startinsert"
-- cmd "autocmd BufEnter * COQnow --shut-up"

-- flash text upon yank
cmd "autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }"

-- cmd "autocmd BufRead Cargo.toml lua require('crates').show()"

-- vim.api.nvim_create_autocmd("BufRead", {
--     group = vim.api.nvim_create_autocmd("CmpSourceCargo", { clear = true }),
--     pattern = "Cargo.toml",
--     callback = function()
--         cmp.setup.buffer({ sources = { { name = "crates" } } })
--     end
-- })

-- this can preserve folds and stuff between sessions, but it seems to break highlighting for some reason. maybe there's another way
-- cmd "autocmd BufWinLeave * silent mkview"
-- cmd "autocmd BufWinEnter * silent loadview"
