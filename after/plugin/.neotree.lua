--[[ require("neo-tree").setup {
  window = {
    position = "current",
    mappings = {
      ["<Space>"] = { "toggle_node", nowait = false },
      ["<Tab>"] = "open",
      ["<C-c>"] = "cancel",
    },
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function()
        require("neo-tree.command").execute { action = "close" }
      end,
    },
  },
  filesystem = {
    -- hijack_netrw_behavior = "open_default",
    follow_current_file = { enabled = true },

    components = {
      harpoon_index = function(config, node, _)
        local Marked = require "harpoon.mark"
        local path = node:get_id()
        local succuss, index = pcall(Marked.get_index_of, path)

        if succuss and index and index > 0 then
          return {
            text = string.format(" => %d", index),
            highlight = config.highlight or "NeoTreeDirectoryIcon",
          }
        else
          return {}
        end
      end,
    },
    renderers = {
      file = {
        { "icon" },
        { "name", use_git_status_colors = true },
        { "harpoon_index" },
        { "diagnostics" },
        { "git_status", highlight = "NeoTreeDimText" },
      },
    },
  },
} ]]
