-- general key remaps — some plugin-specific remaps are in their config files in after/plugins
require("setup.remap")

-- vim settings
require("setup.set")

-- setup lazy
require("setup.lazy_init");

-- load plugins
require("setup.plugins")

-- custom statusline
require("setup.statusline")

-- various auto commands
require("setup.auto_commands")

-- semantic variable highlighting
-- require("setup.semantic_highlighting")

-- set clion-like theme
require("setup.theme").set_theme()

-- lsp initialisation
require("setup.lsp")

-- Any custom functions
require("setup.custom_functions")
