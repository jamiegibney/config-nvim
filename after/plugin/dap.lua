local dap = require("dap")
local ui = require("dapui")

require("dapui").setup({
    layouts = {
        {
            elements = {
                {
                    id = "scopes",
                    size = 0.5,
                },
                {
                    id = "stacks",
                    size = 0.5,
                },
            },
            position = "left",
            size = 80,
        },
        {
            elements = {
                {
                    id = "repl",
                    size = 1.0,
                }
            },
            position = "bottom",
            size = 15,
        },
    },
})
require("nvim-dap-virtual-text").setup()

dap.set_log_level("DEBUG")

local function map(keys, func)
    vim.keymap.set("n", keys, func)
end

dap.adapters.lldb = {
    type = "executable",
    command = "/usr/local/Cellar/llvm/18.1.7/bin/lldb-dap",
    name = "lldb",
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp

dap.configurations.rust = {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    initCommands = function()
        -- Find out where to look for the pretty printer Python module
        local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

        local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
        local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

        local commands = {}
        local file = io.open(commands_file, 'r')
        if file then
            for line in file:lines() do
                table.insert(commands, line)
            end
            file:close()
        end
        table.insert(commands, 1, script_import)

        return commands
    end,
}

map("<leader>ab", dap.toggle_breakpoint)
-- map("<leader>gb", dap.run_to_cursor)
-- map("<leader>ev", function() ui.eval(nil, { enter = true }) end)

map("<F1>", dap.continue)
map("<F2>", dap.step_into)
map("<F3>", dap.step_over)
map("<F4>", dap.step_out)
map("<F5>", dap.step_back)
map("<F6>", dap.terminate)
map("<F10>", dap.restart)

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end
