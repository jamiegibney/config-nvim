require("auto-save").setup {
    execution_message = {
        message = function()
            return "Autosaved"
        end,
        dim = 0.30,
    },
    -- prevent autosaving in non-modifiable and oil buffers
    condition = function(buf)
        local fn = vim.fn
        local utils = require "auto-save.utils.data"

        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil" }) then
            return true
        end
        return false
    end,
    debounce_delay = 30,
}
