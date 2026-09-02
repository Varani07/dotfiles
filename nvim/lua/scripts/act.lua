vim.api.nvim_create_user_command("Act", function(opts)
    local project = opts.args
    local file = vim.fn.expand("~/.act_projects")

    local f = io.open(file, "r")
    if not f then
        vim.notify("Arquivo ~/.act_projects não encontrado", vim.log.levels.ERROR)
        return
    end

    for line in f:lines() do
        local path = line:match("^([^:]+):")

        if path and vim.fn.fnamemodify(path, ":t") == project then
            f:close()

            vim.cmd("tcd " .. vim.fn.fnameescape(path))
            return
        end
    end

    f:close()
    vim.notify("Projeto não encontrado: " .. project, vim.log.levels.ERROR)
end, {
    nargs = 1,

    complete = function()
        local projects = {}
        local file = io.open(vim.fn.expand("~/.act_projects"), "r")

        if not file then
            return projects
        end

        for line in file:lines() do
            local path = line:match("^([^:]+):")

            if path then
                table.insert(projects, vim.fn.fnamemodify(path, ":t"))
            end
        end

        file:close()
        return projects
    end,
})
