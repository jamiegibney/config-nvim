-- custom statusline
require "jamiegibney.statusline"

-- general key remaps — some plugin-specific remaps are in their config files in after/plugins
require "jamiegibney.remap"

-- vim settings
require "jamiegibney.set"

-- lazy setup
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- all plugins
require "jamiegibney.plugins"

-- set clion-like theme
require "jamiegibney.theme"

require "jamiegibney.cmp_spell"
