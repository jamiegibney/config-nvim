local opt = vim.opt
local cmd = vim.cmd

-- block cursor in insert mode (intended for vim practice)
opt.guicursor = "n-v:block,r-cr-c:hor50,o:hor50,a:blinkwait10-blinkoff350-blinkon350-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
-- old settings - vertical bar cursor for insert mode
-- opt.guicursor = "n-v-c:block,i-ci-ve:ver50,r-cr:hor80,o:hor50,a:blinkwait10-blinkoff350-blinkon350-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

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

opt.nu = true
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

cmd "autocmd BufEnter * if &ft ==# 'help' | wincmd L | endif"
-- cmd "autocmd BufEnter * if &ft ==# 'oil' | set winbar=%F"

cmd "autocmd BufWinEnter * exe 'normal zz'"

-- flash text upon yank
cmd "autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }"
