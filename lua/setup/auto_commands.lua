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
        vim.cmd("silent! lua vim.highlight.on_yank { higroup = 'IncSearch', timeout = 100 }")
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
