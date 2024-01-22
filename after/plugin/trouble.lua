-- goto previous workspace diagnostic
vim.keymap.set("n", "d[", function()
    local tr = require("trouble")
    tr.open()
    require("trouble").previous({ jump = true, skip_groups = true })
    tr.close()
end)

-- goto next workspace diagnostic
vim.keymap.set("n", "d]", function()
    local tr = require("trouble")
    tr.open()
    tr.next({ jump = true, skip_groups = true })
    tr.close()
end)
