return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = true },
  },
  opts = function()
    local icons = LazyVim.config.icons.diagnostics
    return {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = vim.fn.has("nvim-0.10") == 1 and "icons" or "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.Error,
            [vim.diagnostic.severity.WARN] = icons.Warn,
            [vim.diagnostic.severity.HINT] = icons.Hint,
            [vim.diagnostic.severity.INFO] = icons.Info,
          },
        },
      },
      inlay_hints = { enabled = true, exclude = {} },
      codelens = { enabled = false },
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
      format = {
        timeout_ms = 2000,
      },
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
              },
            },
          },
        },
        ruff_lsp = {},
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        bashls = {},
        emmet_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              completion = { callSnippet = "Replace" },
              hint = {
                enable = true,
                setType = true,
              },
            },
          },
        },
      },
      setup = {},
    }
  end,
  config = function(_, opts)
    LazyVim.format.register(LazyVim.lsp.formatter())
    LazyVim.lsp.on_attach(function(client, buffer)
      require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
    end)
    LazyVim.lsp.setup()
    LazyVim.lsp.on_dynamic_capability(require("lazyvim.plugins.lsp.keymaps").on_attach)

    if vim.fn.has("nvim-0.10") == 1 and opts.inlay_hints.enabled then
      LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(_, buf)
        if not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buf].filetype) then
          vim.lsp.inlay_hint.enable(true, { bufnr = buf })
        end
      end)
    end

    vim.diagnostic.config(opts.diagnostics)

    local servers = opts.servers
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      pcall(require, "cmp_nvim_lsp") and require("cmp_nvim_lsp").default_capabilities() or {},
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts =
        vim.tbl_deep_extend("force", { capabilities = vim.deepcopy(capabilities) }, servers[server] or {})
      if server_opts.enabled == false then
        return
      end
      if opts.setup[server] and opts.setup[server](server, server_opts) then
        return
      end
      require("lspconfig")[server].setup(server_opts)
    end

    local ensure_installed = {}
    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local all_mslp_servers = have_mason
        and vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      or {}

    for server, server_opts in pairs(servers) do
      server_opts = server_opts == true and {} or server_opts
      if server_opts.enabled ~= false then
        if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
          setup(server)
        else
          table.insert(ensure_installed, server)
        end
      end
    end

    if have_mason then
      mlsp.setup({
        ensure_installed = ensure_installed,
        handlers = { setup },
      })
    end
  end,
}
