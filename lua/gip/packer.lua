-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")
    -- Themes
    use("folke/tokyonight.nvim")
    use("gruvbox-community/gruvbox")
    use("olimorris/onedarkpro.nvim")

    use("kyazdani42/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim", { requires = { "kyazdani42/nvim-web-devicons", opt = true } })
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            -- Snippet Collection (Optional)
            -- {'rafamadriz/friendly-snippets'},
        },
    })
    use({
        "jay-babu/mason-null-ls.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "williamboman/mason.nvim" },
            { "jose-elias-alvarez/null-ls.nvim" },
        },
    })

    use("nvim-lua/plenary.nvim")
    use("tzachar/cmp-tabnine", { run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate",
    })
    -- TreeSitter Stuff
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
    -- Bracket Pair Colorizer
    -- use("p00f/nvim-ts-rainbow")
    use("https://gitlab.com/HiPhish/rainbow-delimiters.nvim")
    -- Telescope
    use("nvim-telescope/telescope.nvim", {
        requires = "nvim-lua/plenary.nvim",
    })
    -- HAPROON BABY!!!
    use("ThePrimeagen/harpoon")
    -- Git
    use("TimUntersberger/neogit")
    -- Auto comments
    use("numToStr/Comment.nvim")

    -- undotree
    use("mbbill/undotree")
    use("stevearc/oil.nvim")
end)
