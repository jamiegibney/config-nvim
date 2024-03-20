local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "sum",
            namr = "C# summary comment",
            dscr = "Expands to `/// <summary>` | `</summary>`.",
        }, {
            text({ "/// <summary> " }),
            insert(1, ""),
            text({ " </summary>" }),
        }),
    },
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "suml",
            namr = "C# summary comment, multiline",
            dscr = "Expands to `/// <summary>`\n`///` |\n`/// </summary>`.",
        }, {
            text({ "/// <summary>", "/// ", }),
            insert(1, ""),
            text({ "", "/// </summary>" }),
        }),
    },
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "dbl",
            namr = "Unity Debug Log",
            dscr = "Expands to `Debug.Log(\"`|`\");`",
        }, {
            text({ "Debug.Log(\"" }),
            insert(1, ""),
            text({ "\");" }),
        }),
    },
})

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "dblf",
            namr = "Unity Debug Log, formatted",
            dscr = "Expands to `Debug.Log(string.Format(\"`|`\"));`",
        }, {
            text({ "Debug.Log(string.Format(\"" }),
            insert(1, ""),
            text({ "\"));" }),
        }),
    },
})
