-- * -- HARPOON KEYMAPS -- * --

-- "harpoon"
vim.keymap.set("n", "<C-h>", function()
    require("harpoon.ui").toggle_quick_menu()
end)
-- "add file"
vim.keymap.set("n", "<leader>af", function()
    print("File added to Harpoon")
    require("harpoon.mark").add_file()
end)

-- "next"
vim.keymap.set("n", "<leader>n", function()
    require("harpoon.ui").nav_next()
end)
-- "previous"
vim.keymap.set("n", "<leader>p", function()
    require("harpoon.ui").nav_prev()
end)

-- "goto 1"
vim.keymap.set("n", "<A-1>", function()
    require("harpoon.ui").nav_file(1)
end)
-- "goto 2"
vim.keymap.set("n", "<A-2>", function()
    require("harpoon.ui").nav_file(2)
end)
-- "goto 3"
vim.keymap.set("n", "<A-3>", function()
    require("harpoon.ui").nav_file(3)
end)
-- "goto 4"
vim.keymap.set("n", "<A-4>", function()
    require("harpoon.ui").nav_file(4)
end)
-- "goto 5"
vim.keymap.set("n", "<A-5>", function()
    require("harpoon.ui").nav_file(5)
end)
-- "goto 6"
vim.keymap.set("n", "<A-6>", function()
    require("harpoon.ui").nav_file(6)
end)
-- "goto 7"
vim.keymap.set("n", "<A-7>", function()
    require("harpoon.ui").nav_file(7)
end)
-- "goto 8"
vim.keymap.set("n", "<A-8>", function()
    require("harpoon.ui").nav_file(8)
end)
-- "goto 9"
vim.keymap.set("n", "<A-9>", function()
    require("harpoon.ui").nav_file(9)
end)
-- "goto 10"
vim.keymap.set("n", "<A-0>", function()
    require("harpoon.ui").nav_file(10)
end)

-- alternative command
-- "goto 1"
vim.keymap.set("n", "<C-6>", function()
    require("harpoon.ui").nav_file(1)
end)
-- "goto 2"
vim.keymap.set("n", "<C-7>", function()
    require("harpoon.ui").nav_file(2)
end)
-- "goto 3"
vim.keymap.set("n", "<C-8>", function()
    require("harpoon.ui").nav_file(3)
end)
-- "goto 4"
vim.keymap.set("n", "<C-9>", function()
    require("harpoon.ui").nav_file(4)
end)
-- "goto 5"
vim.keymap.set("n", "<C-0>", function()
    require("harpoon.ui").nav_file(5)
end)
