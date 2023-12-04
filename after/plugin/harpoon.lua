-- * -- HARPOON KEYMAPS -- * --

local harpoon = require("harpoon")

harpoon:setup({
    settings = {
        save_on_toggle = true,
    },
})

-- "harpoon"
vim.keymap.set("n", "<C-h>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)
-- "add file"
vim.keymap.set("n", "<leader>af", function()
    harpoon:list():append()
    print("File added to Harpoon")
end)

-- "goto 1"
vim.keymap.set("n", "<A-1>", function()
    harpoon:list():select(1)
end)
-- "goto 2"
vim.keymap.set("n", "<A-2>", function()
    harpoon:list():select(2)
end)
-- "goto 3"
vim.keymap.set("n", "<A-3>", function()
    harpoon:list():select(3)
end)
-- "goto 4"
vim.keymap.set("n", "<A-4>", function()
    harpoon:list():select(4)
end)
-- "goto 5"
vim.keymap.set("n", "<A-5>", function()
    harpoon:list():select(5)
end)
-- "goto 6"
vim.keymap.set("n", "<A-6>", function()
    harpoon:list():select(6)
end)
-- "goto 7"
vim.keymap.set("n", "<A-7>", function()
    harpoon:list():select(7)
end)
-- "goto 8"
vim.keymap.set("n", "<A-8>", function()
    harpoon:list():select(8)
end)
-- "goto 9"
vim.keymap.set("n", "<A-9>", function()
    harpoon:list():select(9)
end)

-- alternative command
-- "goto 1"
vim.keymap.set("n", "<C-6>", function()
    harpoon:list():select(1)
end)
-- "goto 2"
vim.keymap.set("n", "<C-7>", function()
    harpoon:list():select(2)
end)
-- "goto 3"
vim.keymap.set("n", "<C-8>", function()
    harpoon:list():select(3)
end)
-- "goto 4"
vim.keymap.set("n", "<C-9>", function()
    harpoon:list():select(4)
end)
-- "goto 5"
vim.keymap.set("n", "<C-0>", function()
    harpoon:list():select(5)
end)
