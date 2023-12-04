require("fidget").setup({
    text = {
        spinner = "dots", -- animation shown when tasks are ongoing
        done = "✔", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
    },

    align = {
        bottom = false, -- align fidgets along bottom edge of buffer
        right = true, -- align fidgets along right edge of buffer
    },

    timer = {
        spinner_rate = 80, -- frame rate of spinner animation, in ms
        fidget_decay = 4000, -- how long to keep around empty fidget, in ms
        task_decay = 3000, -- how long to keep around completed task, in ms
    },

    window = {
        blend = 100,
        relative = "editor", -- where to anchor, either "win" or "editor"
        border = "none", -- style of border for the fidget window
    },

    fmt = {
        leftpad = true,   -- right-justify text in fidget box
        stack_upwards = false, -- list of tasks grows upwards
        max_width = 20,    -- maximum width of the fidget box
        fidget =          -- function to format fidget title
            function(fidget_name, spinner)
                return string.format("%s %s", spinner, fidget_name)
            end,
        task = -- function to format each task line
            function(task_name, message, percentage)
                return string.format(
                  "%s%s [%s]",
                  message,
                  percentage and string.format(" (%s%%)", percentage) or "",
                  task_name
                )
            end,
    },
})
