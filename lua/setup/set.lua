local opt = vim.opt

vim.g.use_dvorak_bindings = false
vim.g.c_syntax_for_h = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0

-- keep only one status bar at the bottom of the screen
opt.laststatus = 3

-- whether the current indent should be copied to a new line
opt.autoindent = true
-- more contextual indenting, such as in {} blocks
opt.smartindent = true

-- the number of spaces to use for autoindent
opt.shiftwidth = 4
-- number of spaces which a tab should count for
opt.tabstop = 4
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
opt.numberwidth = 6
-- the number of signs in the signcolumn, which may increase the size of the "left margin"
vim.wo.signcolumn = "yes"

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
opt.textwidth = 0 -- TODO: just implement this for plain text files

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
opt.spelllang = "en_gb"

opt.shada = "!,'200,<50,s10,h"
