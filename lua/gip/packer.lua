-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')
    -- Themes
    -- use('folke/tokyonight.nvim')
    use("gruvbox-community/gruvbox")
    use('kyazdani42/nvim-web-devicons')
    use('nvim-lualine/lualine.nvim', { requires = { 'kyazdani42/nvim-web-devicons', opt = true } })

    use("nvim-lua/plenary.nvim")
    -- LSP / completion
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("tzachar/cmp-tabnine", { run = "./install.sh" , requires = 'hrsh7th/nvim-cmp'})
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    -- TreeSitter Stuff
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
    -- Bracket Pair Colorizer
    use("p00f/nvim-ts-rainbow")
    -- Telescope
    use('nvim-telescope/telescope.nvim', {
        requires = 'nvim-lua/plenary.nvim'
    })
    -- HAPROON BABY!!!
    use("ThePrimeagen/harpoon")
    -- Git
    use("TimUntersberger/neogit")
    -- Auto comments
    use('numToStr/Comment.nvim')

end)
