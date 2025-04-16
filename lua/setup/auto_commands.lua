-- open help windows in a vertical split
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        vim.cmd("if &ft ==# 'help' | wincmd L | endif")
    end
})

-- prevent comments from being created on newlines with 'o' and 'O'
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        vim.cmd("setlocal formatoptions-=o")
        -- allow the ability to jump between underscores in words
        vim.cmd("setlocal iskeyword-=_")
    end
})

-- centres the window upon opening a buffer
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = "*",
    callback = function()
        vim.cmd("exe 'normal zz'")
    end
})

-- flash text upon yank ;)
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    pattern = "*",
    callback = function()
        vim.cmd("silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 75 }")
    end
})

-- print a message when the directory has changed
vim.api.nvim_create_autocmd({ "DirChanged" }, {
    pattern = "global",
    callback = function()
        print("Changed to the current working directory")
    end
})

-- same as above, but only for the current tab
vim.api.nvim_create_autocmd({ "DirChanged" }, {
    pattern = "tabpage",
    callback = function()
        print("Changed to the current working directory for the current tab")
    end
})

-- recognise .wgsl files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.wgsl",
    callback = function()
        vim.bo.filetype = "wgsl"
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.glsl", "*.vert", "*.frag", "*.comp", "*.geom", "*.tesc", "*.tese" },
    callback = function()
        vim.bo.filetype = "glsl"
    end
})

-- stop treesitter highlighting for already-configured filetypes
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.c", "*.h", "*.cpp", "*.hpp", "*.lua", "*.sh", "*.toml", "*.md", },
    callback = function()
        vim.treesitter.stop()
    end
})

vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = { "*.rs" },
    callback = function()
        vim.treesitter.start()
    end
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "*.rs" },
    callback = function()
        vim.cmd("setlocal textwidth=80")
    end
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = { "*.json" },
    callback = function()
        vim.cmd("setlocal shiftwidth=2")
    end
})

local remember_folds = vim.api.nvim_create_augroup("remember_folds", {})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    group = remember_folds,
    pattern = "?*",
    command = "silent! loadview 1",
})
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    group = remember_folds,
    pattern = "?*",
    command = "mkview 1",
})

-- allow the ability to reset the theme with ":ResetTheme"
vim.api.nvim_create_user_command("ResetTheme", function()
    require("setup.theme").set_theme()
end, {})

-- I initially set `:W` to alias to `:write`, but found that I relied on that
-- far too often. Whenever I would use a "default Vim" setting like a web
-- editor or different system, I would frequently type `:W` which throws an
-- error. So I've changed this to an explicit error to force myself to type
-- properly.
vim.api.nvim_create_user_command("W", function()
    -- vim.cmd("write")
    error("Please use a lowercase 'w' to write!")
end, {})

-- allow the insert mode cursor appearance to be toggled
vim.api.nvim_create_user_command("ToggleInsertCursor", function()
    require("setup.custom_functions").insert_with_block_cursor()
end, {})

vim.api.nvim_create_autocmd("Colorscheme", {
    callback = function()
        local bg = vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg
        io.stdout:write(("\027]11;#%06x\027\\"):format(bg))
    end
})

vim.api.nvim_create_autocmd("VimLeave", {
    callback = function()
        io.stdout:write("\027]111;;\027\\")
    end
})
