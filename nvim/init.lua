local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("varanin.set")
require("varanin.remap")
require("scripts.act")

require("lazy").setup({
  spec = {
    { import = "varanin.plugins" },
  },
  checker = { enabled = true },
})
