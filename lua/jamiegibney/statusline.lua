local function git_branch()
  local branch = vim.fn.system "git rev-pase --abbrev-ref HEAD 2>/dev/null | tr -d '\n'"
  local res = branch .. " |"
  if string.len(branch) > 0 then
    return res
  else
    return ""
  end
end

-- unsure if this is actually working at all tbh (no, it isn't)
local function diagnostic_status()
  local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local num_warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  local res = ""
  local has_warning = num_warnings > 0

  if num_errors > 0 then
    res = "✘ " .. num_errors
    if has_warning then
      res = res .. " "
    end
  end

  if has_warning then
    res = res .. "! " .. num_warnings
  end

  return res
end

local function status_line()
  local set_color_1 = "%#StatusLineNC#"
  local file_dir = "/%f"
  local modified_read_only = "%m%r"
  local align_right = "%="

  local set_color_2 = "%#StatusLine#"
  local err_warn = diagnostic_status()
  local branch = git_branch()
  local line_col = "%l:%c"
  local percentage = "%p%%"
  local set_color_3 = "%#StatusLineNC#"
  local file_type = "%y"
  -- [dir] [+]
  return string.format(
    "%s%s %s%s%s%s   %s %s %s %s%s ",
    set_color_1,
    file_dir,
    modified_read_only,
    align_right,
    set_color_2,
    err_warn,
    branch,
    line_col,
    percentage,
    set_color_3,
    file_type
  )
end

vim.opt.statusline = status_line()
