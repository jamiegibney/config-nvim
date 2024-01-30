local function map(mode, keys, func)
    vim.keymap.set(mode, keys, func)
end

--

vim.g.toggle_gjk = false

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

-- I want this to be enabled by default, so this gets called here
toggle_gjk()

--

vim.g.auto_completion = true

-- Toggles nvim-cmp auto-completion. Prints the current state of the toggle.
local function toggle_auto_completion()
    local ac_enabled = vim.g.auto_completion
    local print_string

    if ac_enabled then
        require("cmp").setup({ enabled = false })
        print_string = "Disabled auto-completion"
    else
        require("cmp").setup({ enabled = true })
        print_string = "Enabled auto-completion"
    end

    print(print_string)

    vim.g.auto_completion = not ac_enabled
end
map("n", "<leader>ac", function() toggle_auto_completion() end)

-- "toggle diagnostics"
map("n", "<leader>td", function()
    if vim.diagnostic.is_disabled() then
        print("Diagnostics enabled")
        vim.diagnostic.enable()
    else
        print("Diagnostics disabled")
        vim.diagnostic.disable()
    end
end)
