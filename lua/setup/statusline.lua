-- local function git_branch()
--     local branch = vim.fn.system "git branch | grep '*' | tr -d '* ' | tr -d '\n'"
--
--     if string.len(branch) > 0 then
--         return branch
--     else
--         return ""
--     end
-- end
--
-- -- unsure if this is actually working at all tbh (no, it isn't)
-- local function errors()
--     local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
--
--     local res = ""
--
--     if num_errors == 1 then
--         res = num_errors .. " error"
--     elseif num_errors > 1 then
--         res = num_errors .. " errors"
--     end
--
--     return res
-- end
--
-- local function warnings()
--     local num_warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
--
--     local res = ""
--
--     if num_warnings == 1 then
--         res = num_warnings .. " warning"
--     elseif num_warnings > 1 then
--         res = num_warnings .. " warnings"
--     end
--
--     return res
-- end
--
-- vim.api.nvim_set_hl(0, "SLWarn", { bold = true, fg = "#d9aa0d", bg = "#ededed" })
-- vim.api.nvim_set_hl(0, "SLError", { bold = true, fg = "#d95716", bg = "#ededed" })
--
-- local function status_line()
--     local set_color_1 = "%#StatusLineNC#"
--     local file_dir = "/%f"
--     local modified_read_only = "%m%r"
--     local align_right = "%="
--
--     local set_color_error = "%#SLError#"
--     -- local set_color_warn = "%#SLWarn#"
--     local set_color_2 = "%#StatusLine#"
--     local errs = errors()
--     -- local warns = warnings()
--     -- local branch = git_branch()
--     local line_col = "%l:%c"
--     local percentage = "%p%%"
--     local set_color_3 = "%#StatusLineNC#"
--     local file_type = "%y"
--
--     return string.format(
--         "%s%s %s%s%s%s %s%s %s %s%s ",
--         set_color_1,
--         file_dir,
--         modified_read_only,
--         align_right,
--         set_color_error,
--         errs,
--         -- set_color_warn,
--         -- warns,
--         set_color_2,
--         line_col,
--         percentage,
--         set_color_3,
--         file_type
--     )
-- end
--
-- local function set_status_line()
--     vim.opt.statusline = status_line()
-- end

-- set_status_line()

vim.api.nvim_create_autocmd({ "VimEnter", "InsertLeave", "BufWrite" }, {
    pattern = "*",
    callback = function()
        local set_color_1 = "%#StatusLineNC#"
        local set_color_2 = "%#StatusLine#"
        local set_color_3 = "%#StatusLineNC#"
        local set_color_error = "%#SLError#"

        local file_dir = "/%f"
        local modified_read_only = "%m%r"
        local align_right = "%="

        local line_col = "%l:%c"
        local percentage = "%p%%"
        local file_type = "%y"

        local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        local errs = ""
        if num_errors == 1 then
            errs = num_errors .. " error"
        elseif num_errors > 1 then
            errs = num_errors .. " errors"
        end

        vim.opt.statusline = string.format(
            "%s%s %s%s%s%s %s%s %s %s%s ",
            set_color_1,
            file_dir,
            modified_read_only,
            align_right,
            set_color_error,
            errs,
            set_color_2,
            line_col,
            percentage,
            set_color_3,
            file_type
        )
    end
})
