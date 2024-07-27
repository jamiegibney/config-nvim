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

ls.add_snippets("cs", {
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
    }, fmt("#[derive(Clone, Copy{})]", { insert(0) })),
    snip({
        trig = "ddb",
        name = "Derive Debug",
    }, fmt("#[derive(Debug{})]", { insert(0) })),
    snip({
        trig = "prl",
        name = "Print line macro",
    }, fmt("println!({});{}", { insert(1), insert(0) })),
    snip({
        trig = "pr",
        name = "Print macro",
    }, fmt("print!(\"{}\");", { insert(0) })),
})

ls.add_snippets("cpp", {
    snip({
        trig = "nl",
        name = "Newline character",
    }, fmt("'\\n'{}", { insert(0) })),
    snip({
        trig = "prl",
        name = "std::cout snippet",
    }, fmt("cout << \"{}\" << {}'\\n';", { insert(1), insert(0) })),
    snip({
        trig = "th",
        name = "this-> shortcut",
    }, fmt("this->{}", { insert(0) })),
    snip({
        trig = "cfoff",
        name = "Disable clang-format",
    }, fmt("// clang-format off", {})),
    snip({
        trig = "cfon",
        name = "Enable clang-format",
    }, fmt("// clang-format on", {})),
    snip({
            trig = "classnew",
            name = "\"Safe\" class template",
        },
        fmt(
            "class NAME {{\n private:\n    NAME() = default;\n\n    struct State {{\n        //\n    }} m;\n\n    explicit NAME(State s) : m(std::move(s)) {{}}\n\n public:\n    static NAME create() {{\n        return NAME(State {{\n            //\n        }});\n    }}\n}};",
            {})),

    snip({
        trig = "pasf",
        name = "pasf prelude header",
    }, fmt("#pragma once\n\n#include \"../{}\"\nusing namespace pasf::prelude;", { insert(0) })),
    -- snip({
    --         trig = "newcl",
    --         regTrig = true,
    --         name = "Class template with \"safe\" constructor",
    --     },
    --     ls.function_node(function(_, s)
    --         local cl = s.captures[1]
    --         return "class " .. cl .. " {\n private:\n    " ..
    --             cl ..
    --             "() = default;\n\n    struct State {\n        //\n    } m;\n\n    explicit " ..
    --             cl ..
    --             "(State s) : m(std::move(s)) {}\n\n public:\n    static " ..
    --             cl .. " create() {\n        return " .. cl .. "(State {\n            //\n        });\n    }\n};"
    --     end, {})),
})
