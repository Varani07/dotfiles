--This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')
  use ('ThePrimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')

  use { 'williamboman/mason.nvim', run = ':MasonUpdate' }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- Autocomplete básico com <C-Space>
  use {
	  'hrsh7th/nvim-cmp',
	  requires = {
		  'hrsh7th/cmp-nvim-lsp',
		  'L3MON4D3/LuaSnip'
	  }
  }
  use {"voldikss/vim-floaterm"}
  use 'nvim-tree/nvim-web-devicons'
  -- DAP e debug Python
  use {
      "mfussenegger/nvim-dap",
      requires = {
          "rcarriga/nvim-dap-ui",
          "mfussenegger/nvim-dap-python",
          "theHamsta/nvim-dap-virtual-text",
          "nvim-neotest/nvim-nio"
      }
  }
end)
