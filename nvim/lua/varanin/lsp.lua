require("mason").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "pyright",
  "lua_ls",
  "ts_ls",
  "rust_analyzer",
  "sqlls",
  "jdtls",
  "bashls",
  "dockerls",
  "yamlls",
  "marksman"
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities
  })
  vim.lsp.enable(server)
end

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vc", vim.lsp.buf.rename)
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
