local ls = require("luasnip")

ls.config.set_config({
    history = false,
    updateevents = "TextChanged,TextChangedI",
})

vim.keymap.set({ "i", "s" }, "<C-f>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- vim.keymap.set({ "i", "s" }, "<C-m>", function()
--     if ls.jumpable(-1) then
--         ls.jump(-1)
--     end
-- end, { silent = true })

local snip = ls.snippet
local insert = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("csharp", {
    snip({
        trig = "sum",
        name = "C# single-line summary comment",
    }, fmt("/// <summary> {} </summary>", { insert(0) })),
    snip({
        trig = "suml",
        name = "C# multi-line summary comment",
    }, fmt("/// <summary>\n/// {}\n/// </summary>",
        { insert(0) })
    ),
    snip({
        trig = "dbl",
        name = "Unity debug log",
    }, fmt("Debug.Log(\"{}\")", { insert(0) })),
    snip({
        trig = "dblf",
        name = "Unity formatted debug log",
    }, fmt("Debug.LogFormat(\"{}\", {});",
        { insert(1), insert(0) })
    ),
    snip({
        trig = "tdt",
        name = "Unity frame delta time",
    }, fmt("Time.deltaTime", {})),
})

ls.add_snippets("rust", {
    snip({
        trig = "dcc",
        name = "Derive Copy and Clone",
    }, fmt("#[derive(Clone, Copy{}", { insert(0) })),
    snip({
        trig = "prl",
        name = "Print line macro",
    }, fmt("println!({});{}", { insert(1), insert(0) })),
    snip({
        trig = "pr",
        name = "Print macro",
    }, fmt("print!(\"{}\");", { insert(0) })),
})
