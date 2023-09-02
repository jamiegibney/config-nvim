-- Notes:
--[[
treesitter has "TSNode"s which can represent individual items

there's a "get_locals(bufnr)" function in treesitter

there's a "find_definition()" method which can locate the defining
node and its scope based on a select node

there's a "find_usages()" function which returns an array of all the
usages of x node in a scope

there's a "get_scope_tree()" function which returns an array of
scopes containing a certain node

-- create a table/array of all the variable/parameter definitions
-- generate and store a colour with them
-- iterate through all usages of each node in the table, highlighting it
-- with that colour
-- store the generated colour table somewhere so the same colours can be
-- reloaded again?

look to vim-illuminate and local-highlight for some methods of highlighting
multiple usages of the same node within a file. you'd need to do the same thing,
but with the fg colour and across all nodes within a scope.
--]]
