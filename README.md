# Personal Neovim RC

In terms of file structure, this is a pretty disorganised directory. Most Lua files, however, are documented where possible.

Broadly speaking, general editor config is found in /lua/jamiegibney, and plugin-specific config is found in /after/plugin. There are some exceptions — some plugin config is found in /lua/jamiegibney/plugin.lua for convenience.

The main flaw of this current setup is that all LSP config is in-line in /lua/jamiegibney/plugin.lua. This was done to easily enable lazy loading, but significantly congests the plugin.lua file. This should be changed when possible.

### TODO
- Separate LSP config to its own file
- Refactor the overall structure of this directory — using modules would be a good idea
- Lazy-load more plugins to improve startup time, which is currently 100-200 ms
    - Telescope, Treesitter and other LSP-related plugins hog most of the startup
- Experiment with built-in autocompletion over using nvim-cmp to see if the performance is any better

### Notes
- I tried to use Coq over nvim-cmp, and whilst I found it to be significantly faster, I chose to revert due to a lack of configuration options. Perhaps I should try it again though, as I do sometimes notice that nvim-cmp is quite slow at loading completion results.
- I would like to rely on fewer plugins, so perhaps looking into ways to achieve what they do with stock Neovim would be a possible option for that.
