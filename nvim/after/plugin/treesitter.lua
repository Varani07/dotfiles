local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "sql", "rust", "typescript", "python", "java", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent ={
      enable = true,
  }
}

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldcolumn = "1"
