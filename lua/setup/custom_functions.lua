vim.g.toggle_gjk = false

local function map(mode, keys, func)
    vim.keymap.set(mode, keys, func)
end

-- Toggles the behaviour of "j" and "k" to "gj" and "gk" for easy navigation
-- through wrapped lines. Prints the current state of the toggle.
local function toggle_gjk()
    local toggle_enabled = vim.g.toggle_gjk

    local print_string

    if toggle_enabled then
        print_string = "Reset j & k to default"
        map("n", "j", "j")
        map("n", "k", "k")
        map("n", "gj", "gj")
        map("n", "gk", "gk")
    else
        print_string = "Toggled j & k to gj & gk"
        map("n", "j", "gj")
        map("n", "k", "gk")
        map("n", "gj", "j")
        map("n", "gk", "k")
    end

    print(print_string)

    vim.g.toggle_gjk = not toggle_enabled
end
map("n", "<leader>tg", function() toggle_gjk() end)
