local mason_status, mason = pcall(require, "mason")
if mason_status then
    mason.setup()
end

local mason_lsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lsp_status then
    mason_lspconfig.setup({
        ensure_installed = {
            "pyright",
            "lua_ls",
            "ts_ls",
            "rust_analyzer",
            "sqlls",
            "jdtls",
            "bashls",
            "dockerls",
            "yamlls",
            "marksman",
            "ols",
        },
    })
end

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
    "marksman",
    "ols"
}

for _, server in ipairs(servers) do
    local server_binary = server
    if server == "lua_ls" then server_binary = "lua-language-server" end
    if server == "ts_ls" then server_binary = "typescript-language-server" end
    if vim.fn.executable(server_binary) == 1 or mason_status then
        vim.lsp.config(server, {
            capabilities = capabilities
        })
        vim.lsp.enable(server)
    end
end

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, { desc = "LSP references" })
vim.keymap.set("n", "<leader>vc", vim.lsp.buf.rename, { desc = "LSP rename" })
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "Signature help" })
