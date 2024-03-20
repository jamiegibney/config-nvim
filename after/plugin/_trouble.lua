-- goto previous workspace diagnostic
vim.keymap.set("n", "d[", function()
    local tr = require("after.plugin._trouble")
    tr.open()
    require("after.plugin._trouble").previous({ jump = true, skip_groups = true })
    tr.close()
end)

-- goto next workspace diagnostic
vim.keymap.set("n", "d]", function()
    local tr = require("after.plugin._trouble")
    tr.open()
    tr.next({ jump = true, skip_groups = true })
    tr.close()
end)