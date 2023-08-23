local message = "this could be a `const fn`\
for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_const_for_fn\
`-W clippy::missing-const-for-fn` implied by `-W clippy::nursery`"

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
