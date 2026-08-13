return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"j-hui/fidget.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{
			"saghen/blink.cmp",
			dependencies = { "rafamadriz/friendly-snippets" },

			-- use a release tag to download pre-built binaries
			version = "1.*",

			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				keymap = { preset = "default" },

				appearance = {
					nerd_font_variant = "mono",
				},

				-- (Default) Only show the documentation popup when manually triggered
				completion = { documentation = { auto_show = false } },
			},
		},
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{ "Bilal2453/luvit-meta", lazy = true },
	},

	config = function()
		require("fidget").setup({})
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"tailwindcss",
				"ty",
				"ruff",
				"clangd",
			},
		})

		local capabilities = nil
		if pcall(require, "blink.cmp") then
			capabilities = require("blink.cmp").get_lsp_capabilities()
		end

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = true,
					},
					telemetry = { enable = false },
					format = {
						enabled = true,
						defaultConfig = {
							indent_style = "space",
							indent_size = "2",
						},
					},
				},
			},
		})

		vim.lsp.config("qml-language-server", {
			cmd = { "qml-language-server" },
			filetypes = { "qml" },
			root_markers = { { "qmldir", "shell.qml", "*.qml" }, ".git" },
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
