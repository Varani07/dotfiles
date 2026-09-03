vim.g.mapleader = " "
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
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>c", "o<BS>}<C-c>O")

vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
-- vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")

vim.keymap.set("n", "<leader>7", function()
  vim.cmd("vertical resize -6")
end)
vim.keymap.set("n", "<leader>8", function()
  vim.cmd("vertical resize +6")
end)
vim.keymap.set("n", "<leader>9", function()
  vim.cmd("horizontal resize -6")
end)
vim.keymap.set("n", "<leader>0", function()
  vim.cmd("horizontal resize +6")
end)

vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")


vim.keymap.set("n", "<leader>k", ":Act ")

vim.keymap.set("n", "<leader>nn", "<C-w>w")
vim.keymap.set("n", "<leader>nh", "<C-w><Left>")
vim.keymap.set("n", "<leader>nl", "<C-w><Right>")
vim.keymap.set("n", "<leader>nk", "<C-w><Up>")
vim.keymap.set("n", "<leader>nj", "<C-w><Down>")
