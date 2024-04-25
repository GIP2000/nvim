require("gip.before.set")
require("gip.before.remap")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.opt.background = "dark"
			vim.cmd("colorscheme catppuccin")
		end,
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},
	"tpope/vim-fugitive",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim", opts = {} },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			-- { "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			-- { "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			require("gip.lsp")
		end,
	},
	"nvim-lua/plenary.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	"nvim-treesitter/playground",
	{
		"romgrk/nvim-treesitter-context",
		opts = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			throttle = true, -- Throttles plugin updates (may improve performance)
			max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
			show_all_context = false,
			patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
				-- For all filetypes
				-- Note that setting an entry here replaces all other patterns for this entry.
				-- By setting the 'default' entry below, you can control which nodes you want to
				-- appear in the context window.
				default = {
					"function",
					"method",
					"for",
					"while",
					"if",
					"switch",
					"case",
				},

				rust = {
					"loop_expression",
					"impl_item",
				},

				typescript = {
					"class_declaration",
					"abstract_class_declaration",
					"else_clause",
				},
			},
		},
	},
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
	{
		"nvimdev/guard.nvim",
		-- Builtin configuration, optional
		dependencies = {
			"nvimdev/guard-collection",
		},
		config = function()
			local ft = require("guard.filetype")
			ft("typescript,javascript,typescriptreact"):fmt("prettier")
			-- :lint("eslint_d")

			ft("rust"):fmt("rustfmt")

			ft("lua"):fmt("stylua")

			ft("python"):fmt("black")

			require("guard").setup({
				fmt_on_save = true,
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("gip.telescope")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		config = function()
			local nnoremap = require("gip.keymap").nnoremap
			local silent = { silent = true }
			-- Terminal commands
			-- ueoa is first through fourth finger left hand home row.
			-- This just means I can crush, with opposite hand, the 4 terminal positions
			--
			-- These functions are stored in harpoon.  A plugn that I am developing
			nnoremap("<leader>j", function()
				require("harpoon.mark").add_file()
			end, silent)
			nnoremap("<leader>h", function()
				require("harpoon.ui").toggle_quick_menu()
			end, silent)

			nnoremap("<leader>a", function()
				require("harpoon.ui").nav_file(1)
			end, silent)
			nnoremap("<leader>s", function()
				require("harpoon.ui").nav_file(2)
			end, silent)
			nnoremap("<leader>d", function()
				require("harpoon.ui").nav_file(3)
			end, silent)
			nnoremap("<leader>r", function()
				require("harpoon.ui").nav_file(4)
			end, silent)
		end,
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>/",
				---Block-comment toggle keymap
				block = "<C-/>",
			},
			opleader = {
				-- -Line-comment keymap
				line = "<leader>/",
				---Block-comment keymap
				block = "<C-/>",
			},
		},
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		version = "*",
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.journal"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/Documents/notes",
							},
							default_workspace = "notes",
						},
					},
				},
			})
            vim.wo.foldlevel = 99
            vim.wo.conceallevel = 2
		end,
	}, -- {
	-- 	"kristijanhusak/vim-dadbod-ui",
	-- 	dependencies = {
	-- 		{ "tpope/vim-dadbod", lazy = true },
	-- 		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	-- 	},
	-- 	cmd = {
	-- 		"DBUI",
	-- 		"DBUIToggle",
	-- 		"DBUIAddConnection",
	-- 		"DBUIFindBuffer",
	-- 	},
	-- 	init = function()
	-- 		-- Your DBUI configuration
	-- 		vim.g.db_ui_use_nerd_fonts = 1
	-- 	end,
	-- },
})

require("gip")
