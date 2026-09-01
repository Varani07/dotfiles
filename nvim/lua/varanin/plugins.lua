return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },

    "ThePrimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "voldikss/vim-floaterm",
    "nvim-tree/nvim-web-devicons",

    {
        "williamboman/mason.nvim",
        enabled = function()
            local f = io.open("/etc/os-release", "r")
            if f then
                local content = f:read("*all")
                f:close()
                if content:match("ID=alpine") then
                    return false
                end
            end
            return true
        end,
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        enabled = function()
            local f = io.open("/etc/os-release", "r")
            if f then
                local content = f:read("*all")
                f:close()
                if content:match("ID=alpine") then
                    return false
                end
            end
            return true
        end,
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("mason-lspconfig").setup()
        end,
    },
    "neovim/nvim-lspconfig",

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            { "zk", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        },
    },
}
