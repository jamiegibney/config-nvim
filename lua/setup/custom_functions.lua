M = {}

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

--

vim.g.insert_block_cursor = true

-- function to choose between a block or line cursor in insert mode
function M.insert_with_block_cursor()
    local state = vim.g.insert_block_cursor
    local prefix

    if state then
        prefix = "n-v:block,i-ci-ve:ver80,"
    else
        prefix = "n-v:block,"
    end

    vim.g.insert_block_cursor = not state

    vim.opt.guicursor = string.format(
        "%sr-cr:hor80,o:hor50,c:ver80,a:blinkwait10-blinkoff350-blinkon350-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
        prefix
    )
end

M.insert_with_block_cursor()

vim.g.increment_alphabetic_characters = false

-- Toggles whether alphabetic characters can be incremented with `<C-a>` and decremented 
-- with `<C-x>` (includes `g<C-a>` and `g<C-x>`).
function M.toggle_alphabetic_incrementing()
    local opt = vim.g.increment_alphabetic_characters

    if opt then
        vim.cmd("setlocal nrformats-=alpha")
        print("Disabled alphabetic incrementing")
    else
        vim.cmd("setlocal nrformats+=alpha")
        print("Enabled alphabetic incrementing")
    end

    vim.g.increment_alphabetic_characters = not opt
end

map("n", "<leader>ai", function() M.toggle_alphabetic_incrementing() end)

return M
