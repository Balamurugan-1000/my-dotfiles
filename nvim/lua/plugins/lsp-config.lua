return {
	-- Mason (LSP installer)
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-LSPConfig (Bridge between Mason & LSPConfig)
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" }, -- Managed by Mason
			})
		end,
	},

	-- LSPConfig (LSP Setup)
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp", -- For completion capabilities
			"nvimdev/lspsaga.nvim", -- Modern LSP UI (IntelliJ-like features)
		},
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Enhanced capabilities with completion support
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Global on_attach function with modern features
			local function on_attach(client, bufnr)
				-- Enable inlay hints if supported
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

				-- Optional: Keybindings for IntelliJ-like navigation
				local opts = { buffer = bufnr, silent = true }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
				vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
			end

			-- 🌙 Lua LSP
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						hint = {
							enable = true, -- Inlay hints for Lua
							paramName = "All", -- Show parameter names
							setType = true, -- Show type hints
						},
					},
				},
			})

			-- 🌐 TypeScript LSP
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "all", -- Show parameter names
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			})

			-- ☕ Java LSP (System-installed jdtls)
			lspconfig.jdtls.setup({
				cmd = {
					"/etc/profiles/per-user/kaizenx/bin/jdtls",
					"-configuration",
					vim.fn.expand("~/.cache/jdtls/config"),
					"-data",
					vim.fn.expand("~/.cache/jdtls/workspace"),
				},
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					java = {
						inlayHints = {
							parameterNames = {
								enabled = "all", -- Show parameter names for Java
							},
						},
					},
				},
			})
		end,
	},

	-- Modern LSP UI (replaces lsp-inlayhints.nvim)
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- For better rendering
			"nvim-tree/nvim-web-devicons", -- For icons
		},
		config = function()
			require("lspsaga").setup({
				lightbulb = { enable = true }, -- Code action indicators
				hover = { max_width = 0.8 }, -- IntelliJ-like hover docs
				symbol_in_winbar = { enable = true }, -- Breadcrumbs
			})
		end,
	},

	-- Completion plugin (required for capabilities)
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
			})
		end,
	},
}
