if os.getenv("SSH_TTY") then
    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
            ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
        },
        paste = {
            ["+"] = function() retrn { {}, "" } end,
            ["*"] = function() retrn { {}, "" } end,
        },
    }
end
