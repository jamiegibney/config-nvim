local opt = vim.opt
local cmd = vim.cmd

local function cursor_with_insert_block(use_block_cursor_in_insert)
    if use_block_cursor_in_insert then
        return
        "n-v:block,r-cr-c:hor50,o:hor50,a:blinkwait10-blinkoff350-blinkon350-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
    else
        return
        "n-v-c:block,i-ci-ve:ver80,r-cr:hor80,o:hor50,a:blinkwait10-blinkoff350-blinkon350-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
    end
end

opt.guicursor = cursor_with_insert_block(false)

-- only one status bar at the bottom of the screen
opt.laststatus = 3

opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.termguicolors = true
opt.clipboard = "unnamedplus"

opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.relativenumber = true

opt.numberwidth = 3
vim.wo.signcolumn = "yes:2"

opt.scrolloff = 16
opt.updatetime = 40

opt.incsearch = true
opt.hlsearch = true

opt.linebreak = true
opt.breakat = " \t;:,!?."
opt.fillchars = { eob = " " }
opt.cursorline = true

opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.swapfile = false

opt.shortmess:append "sI"

-- default is jcroql
opt.formatoptions = "jcrql"

opt.background = "light"
opt.hidden = true
opt.completeopt = "menuone"

opt.spelllang = "en_gb"

--[[ you can also use:
api.nvim_create_autocmd({ "Events", }, {
    pattern = "*",
    callback = function()
        ...
    end,
})
]]

-- open help windows in a vertical split
cmd "autocmd BufEnter * if &ft ==# 'help' | wincmd L | endif"
-- not really sure what this is supposed to do?
cmd "autocmd BufWinEnter * exe 'normal zz'"

-- flash text upon yank
cmd "autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }"
