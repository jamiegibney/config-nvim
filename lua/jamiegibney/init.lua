require("jamiegibney.statusline")
require("jamiegibney.remap")
require("jamiegibney.set")

-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("jamiegibney.plugins")

-- enter Alpha
-- just pretend I'm not calling this twice to get it to work ;)
vim.cmd "autocmd VimEnter * :Alpha"
vim.cmd "autocmd VimEnter * :Alpha"

-- set clion-like theme
require("jamiegibney.theme")
