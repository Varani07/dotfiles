local run = require("scripts.run")
local window_mode = false

vim.g.mapleader = " "

vim.keymap.set("n", "<C-q>", "ggVG")
vim.keymap.set("n", "<leader>b", "0w")
vim.keymap.set("n", "<leader>m", ":e<CR>")

-- vim.keymap.set("n", "<leader>c", "o<BS>}<C-c>O")
vim.keymap.set("n", "<leader>c", "$a,<C-c>:w<CR>")
vim.keymap.set("n", "<leader>k", ":Act ")
vim.keymap.set("n", "<leader>r", run.run_file,
    {
        desc = "Run current file",
    }
)
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

vim.keymap.set("n", "<leader>ss", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "qq", vim.cmd.q)
vim.keymap.set("n", "<leader>qq", vim.cmd.qa)
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<C-I>", ":tabnext<CR>")
-- vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")

vim.keymap.set("n", "<leader>W", function()
    window_mode = not window_mode
    if window_mode then
        vim.notify("WINDOW MODE")
    else
        vim.notify("NORMAL MODE")
    end
end)

local window_keys = {
    a = "<C-w>h",
    x = "<C-w>j",
    w = "<C-w>k",
    d = "<C-w>l",
    A = "<C-w><",
    D = "<C-w>>",
    W = "<C-w>+",
    X = "<C-w>-",
}

for key, command in pairs(window_keys) do
    vim.keymap.set("n", key, function()
        if window_mode then
            return command
        end

        return key
    end, { expr = true })
end
