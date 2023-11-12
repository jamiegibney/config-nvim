# Custom Neovim shortcuts 
All custom keymappings for this Neovim RC.

Some keymappings have a mnemonic below them in *italic* to help with memorisation.

*Updated 17 September 2023*

**`leader` is mapped to `space`**


## Remapped keys/shortcuts
This includes keys/shortcuts which perform their original operation, but are remapped for
added functionality.

- `ctrl + d` and `ctrl + u`
- `n` and `N`
- `ctrl + c` and `escape`
- `j` and `k`


## Unmapped keys/shortcuts
This includes keys/shortcuts which are unmapped and not functional.

- `F1` through `F20`
- In normal mode:
    - `delete` 
    - `return`
    - `ctrl + n`
    - `ctrl + p`
    - `backspace`
    - `shift + return`


## Normal Mode

### General 

`leader + /`: toggle line comment

`leader + ac`: append comment to end of line

*"append comment"*

`leader + ws`: ":w" and ":so" (writes and sources the current file)

*"write and source"*

`leader + gs`: opens [Vim Fugitive](https://github.com/tpope/vim-fugitive) for Git control

*"git status"*

`leader + fs`: opens Oil (file browser plugin)

*"file system"*

`leader + pf`: opens the last-opened file

*"previous file"*

`leader + ce`: clears all edits since last save

*"clear edits"*

`leader + sp`: enable spell-check highlighting

*"spelling"*

`leader + ra`: substitute all matched instances of the word under cursor

*"replace all"*

`leader + eb`: expand curly braces which are on the same line

*"expand braces"*

`leader + as`: toggles autosaving (on by default)

*"autosave"*

`leader + td`: toggles lsp diagnostics, useful for presentation

*"toggle diagnostics"*

`leader + sm`: toggles semantic highlighting (i.e. "rainbow variables")

*"semantic"*

`leader + so`: show symbols outline (i.e. all project symbols)

*"symbols outline"*

`leader + mp`: open rendered markdown preview in browser

*"markdown preview"*

`gx`: goto link under cursor (non-netrw function)

*"goto link"*

`leader + ncfg`: goto Neovim config directory

*"Neovim config"*

`leader + rpg`: goto Rust playground directory

*"rust playground"*

`leader + mr`: "make it rain" effect from [Cellular Automaton](https://github.com/Eandrju/cellular-automaton.nvim)

*"make (it) rain"*

`ctrl +` `k` and `j`: move current line up/down and auto-indent

`ctrl + return`: insert semicolon at end of line

`ctrl + space`: toggle floating terminal

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

`leader + ff`: file search (searches in current directory)

*"find file"*

`leader + fw`: live grep in current directory (searches in current directory)

*"find word"*

`leader + gf`: show all files added to Git

*"git files"*

`leader + fo`: recently-opened files (anywhere, not just current directory)

*"file old"*

`leader + fi`: fuzzy find in the current buffer

*"find in"*

`leader + tr`: resume previous Telescope window

*"telescope resume"*

`leader + bu`: show all open buffers

*"telescope resume"*

`leader + bu`: show all open buffers

*"buffers"*

`leader + su`: show spelling suggestions for item under cursor

*"suggest"*

`leader + u`: show undo history/tree for current buffer

*"undo"*

### Autocompletion
All of these apply to insert mode only.

`ctrl + y`: confirm current autocompletion

*"yes"*

<!-- `ctrl + e`: abort autocompletion -->

`ctrl + n`: select next item in list

`ctrl + p`: select previous item in list

<!-- `ctrl + d`: scroll documentation down -->

<!-- `ctrl + f`: scroll documentation up -->

`ctrl + i`: open autocompletion popup

`ctrl + h`: goto next snippet placeholder

### LSP Related

`leader + lh`: toggle highlighting of all instances of current token

*"local highlighting"*

`leader + ca`: open code actions popup at cursor (NOTE: currently only works in Rust files)

*"code action"*

`leader + a`: open code actions (bottom of window)

*"action"*

`leader + i`: LSP hover — information about the item under cursor

*"information"*

`leader + ls`: show LSP signature help (often "leader + i" is more useful and consistent)

*"LSP signature"*

`leader + rn`: rename all instances of current token

*"rename"*

`leader + fm`: format current file

*"format"*

`leader + dn`: show all diagnostics for current line

*"diagnostics"*

`leader + gd`: preview definition in floating window at cursor

*"preview goto definition"*

`leader + td`: preview type definition in floating window at cursor

*"preview type definition"*

`leader + gu`: LSP usages (often returns an error — use "gr" instead)

*"goto usages"*

`gd`: goto LSP definition

*"goto definition"*

`td`: LSP usages (often returns an error — use "gr" instead)

*"type definition"*

`gr`: show LSP references in telescope

*"goto references"*

### [Harpoon](https://github.com/ThePrimeagen/harpoon)

`ctrl + h`: toggle Harpoon quick menu

*"harpoon"*

`leader + n`: next Harpoon buffer

`leader + p`: previous Harpoon buffer

`alt +` `1` through `0`: goto specific Harpoon buffer

`ctrl +` `6` through `0`: goto Harpoon buffers 1 through 5 (alternative to above)

### [Oil](https://github.com/stevearc/oil.nvim)

`ctrl + o`: open file/directory

`ctrl + i` or `backspace`: go up directory (i.e. "cd ..")

`ctrl + r`: refresh Oil buffer

`ctrl + z`: open in horizontal split

`ctrl + v`: open in vertical split

`grave` (\`): cd Neovim to the current directory (affects Harpoon)

`tilde` (~): cd current Neovim tab to the current directory (affects Harpoon) 

### Splits

`ctrl + .`: increase split width (think of it like "`ctrl + >`")

`ctrl + ,`: decrease split width (think of it like "`ctrl + <`")

`ctrl + =`: increase split height (think of it like "`ctrl + +`")

`ctrl + -`: decrease split height

`leader + sv`: create a new vertical split

*"split vertical"*

`leader + sh`: create a new horizontal split

*"split horizontal"*

`leader + hw`: hides the current buffer

*"hide window"*

`leader + cw`: closes the current buffer

*"close window"*

`leader + leader`: maximise current split

### Tabs
`leader + nt`: create a new tab

*"new tab"*

`leader + ot`: opens the current buffer in a new tab

*"open in tab"*

`leader + ct`: closes the current tab

*"close tab"*

`leader + tn`: goes to the next tab

*"tab next"*

`leader + tp`: goes to the previous tab 

*"tab previous"*

`leader + to`: closes all tabs but the current

*"tab only"*


## Insert Mode

`ctrl + return`: insert trailing semicolon and enter normal mode

`shift + return`: insert newline below cursor without moving position

`ctrl +` `k` or `j` or `l` or `h`: caret navigation in insert mode


## Visual Mode

`leader + p`: retain content of register after pasting into a selection

`ctrl +` `k` and `j`: move selected block and auto-indent

`leader + /`: linewise comment

`leader + fl`: folds the current selection (move the caret in selection to unfold)

*"fold"*

`gb`: blockwise comment

*"go block (comment)"*
