-- Inicializa o Mason (gerenciador de servidores LSP)
require("mason").setup()

-- Integra o Mason com o LSPConfig
require("mason-lspconfig").setup()

-- Carrega o lspconfig padrão
local lspconfig = require("lspconfig")

-- Lista de servidores que vamos configurar
local servers = {
  "pyright",       -- Python
  "jdtls",         -- Java
  "tsserver",      -- TypeScript
  "rust_analyzer", -- Rust
  "sqlls",         -- SQL
  "lua_ls"         -- Lua (útil pra configurar o próprio Neovim)
}


vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>vc", vim.lsp.buf.rename, {})
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})

-- Conectar LSP com nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, server in ipairs(servers) do
	lspconfig[server].setup {
		capabilities = capabilities,
	}
end
