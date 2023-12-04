-- general key remaps — some plugin-specific remaps are in their config files in after/plugins
require("jamiegibney.remap")

-- setup lazy
require("jamiegibney.lazy_init");

-- load plugins
require("jamiegibney.plugins")

-- custom statusline
require("jamiegibney.statusline")

-- vim settings
require("jamiegibney.set")

-- various auto commands
require("jamiegibney.auto_commands")

-- semantic variable highlighting
-- require("jamiegibney.semantic_highlighting")

-- set clion-like theme
require("jamiegibney.theme").set_theme()

-- lsp initialisation
require("jamiegibney.lsp")
