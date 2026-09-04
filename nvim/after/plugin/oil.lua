require("oil").setup({
    keymaps = {
        ["g?"] = false,
        ["<CR>"] = "actions.select",
        ["<C-s>"] = false,
        ["<C-h>"] = false,
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = false,
        ["<C-l>"] = false,
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = false,
        ["`"] = false,
        ["g~"] = false,
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = false,
        ["<leader>yp"] = {
            callback = function()
                local entry = require("oil").get_cursor_entry()
                if entry then
                    local dir = require("oil").get_current_dir()
                    local path = vim.fs.joinpath(dir, entry.name)
                    vim.fn.setreg("+", path)
                    print("Copied: " .. path)
                end
            end,
            desc = "Copy path",
        },
    }
})
