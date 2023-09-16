local message = "this could be a `const fn`\
for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_const_for_fn\
`-W clippy::missing-const-for-fn` implied by `-W clippy::nursery`"

local function tprint(tbl, indent)
    if not indent then
        indent = 0
    end
    for k, v in pairs(tbl) do
        local formatting = string.rep("{ ", indent) .. k .. ": "
        if type(v) == "table" then
            print(formatting)
            tprint(v, indent + 1)
        elseif type(v) == "boolean" then
            print(formatting .. tostring(v))
        else
            print(formatting .. v)
        end
    end
end

print(message)

local function remove_further_information(msg)
    local start, _ = string.find(msg, "for further information")
    if start == nil then
        return msg
    end

    local last = 0
    local i = 0
    while true do
        i = string.find(msg, "\n", last + 1)
        if i == nil then break end
        last = i
    end

    local result = string.sub(msg, 1, start - 1) .. string.sub(msg, last)
    return result
end

print(remove_further_information(message))
