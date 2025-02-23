local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use({
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	})
	use({ "ellisonleao/gruvbox.nvim" })
	use("mfussenegger/nvim-jdtls")
	use({ "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 })
	use("karb94/neoscroll.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({
		"b0o/incline.nvim",
		config = function()
			local colors = require("solarized-osaka.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	})
	use({
		"olivercederborg/poimandres.nvim",
		config = function()
			require("poimandres").setup({
				dim_nc_background = false, -- dim 'non-current' window backgrounds
				disable_background = true, -- disable background
				disable_float_background = false, -- disable background for floats
			})
		end,
	})
	use("arcticicestudio/nord-vim")
	use("p00f/nvim-ts-rainbow")
	use({
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = "yarn install --frozen-lockfile && yarn compile",
	})
	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })
	use("rmagatti/auto-session")
	use("akinsho/toggleterm.nvim")
	use("rmagatti/session-lens")
	use("goolord/alpha-nvim")
	use("kdheepak/lazygit.nvim")
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")
	use("wbthomason/packer.nvim")
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("ThePrimeagen/harpoon")
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion
	use("neovim/nvim-lspconfig") -- LSP
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("rafamadriz/friendly-snippets")
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v<CurrentMajor>.*",
		-- install jsregexp (optional!:).
		run = "make install_jsregexp",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use("folke/zen-mode.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("akinsho/nvim-bufferline.lua")
	use("github/copilot.vim")
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim") -- For git blame & browse

	use("numToStr/Comment.nvim")
	use("kylechui/nvim-surround")
	use("phaazon/hop.nvim")
	use("napmn/react-extract.nvim")
	use("lukas-reineke/indent-blankline.nvim")
end)
