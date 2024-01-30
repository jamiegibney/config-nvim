require("auto-save").setup {
    execution_message = {
        message = function()
            return "File autosaved"
        end,
        dim = 0.50,
    },
    -- prevent autosaving in non-modifiable and oil/harpoon buffers
    condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), { "oil", "harpoon", }) then
            return true
        end
        return false
    end,
    -- delay before autosave is triggered
    debounce_delay = 130,
}
