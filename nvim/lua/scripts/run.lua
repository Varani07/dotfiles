local M = {}

function M.run_file()
    local file = vim.fn.expand("%:p")
    local ft = vim.bo.filetype

    local commands = {
        bash = "bash",
        sh = "bash",
        python = "python"
    }

    local command = commands[ft]

    if not command then
        vim.notify("Unsupported filetype: " .. ft, vim.log.levels.WARN)
        return
    end

    vim.cmd("FloatermNew " .. command .. " " .. vim.fn.shellscape(file))
end

return M
