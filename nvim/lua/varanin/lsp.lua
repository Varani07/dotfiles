-- 1. Capacidades do Autocomplete
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 2. Servidores mainstream, só habilita se o binário existir no sistema
--    (nome do lspconfig -> nome do executável)
local servers = {
    pyright        = "pyright-langserver",
    lua_ls         = "lua-language-server",
    ts_ls          = "typescript-language-server",
    rust_analyzer  = "rust-analyzer",
    sqlls          = "sql-language-server",
    jdtls          = "jdtls",
    bashls         = "bash-language-server",
    dockerls       = "docker-langserver",
    yamlls         = "yaml-language-server",
    marksman       = "marksman",
}

for name, bin in pairs(servers) do
    if vim.fn.executable(bin) == 1 then
        vim.lsp.config(name, { capabilities = capabilities })
        vim.lsp.enable(name)
    end
end

-- 3. Odin Language Server (ols)
vim.lsp.config("ols", {
    cmd = { "ols" },
    filetypes = { "odin" },
    root_markers = { "ols.json", ".git" },
    capabilities = capabilities,
})
vim.lsp.enable("ols")

-- 4. Atalhos globais de LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, { desc = "LSP references" })
vim.keymap.set("n", "<leader>vc", vim.lsp.buf.rename, { desc = "LSP rename" })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help" })
