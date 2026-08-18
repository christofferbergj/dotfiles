-- Monorepo-aware root directory detection
-- Prioritizes monorepo markers to ensure single LSP instance across the entire repo
local get_root_dir = function(fname)
  local util = require("lspconfig.util")
  -- Monorepo markers in priority order
  local root = util.root_pattern(
    "pnpm-workspace.yaml",
    "pnpm-lock.yaml",
    "yarn.lock",
    "package-lock.json",
    "bun.lockb",
    "bun.lock",
    "turbo.json",
    "nx.json",
    "lerna.json",
    "tsconfig.base.json",
    ".git"
  )(fname)

  -- Fallback to package.json/tsconfig.json if not in a recognized monorepo
  if not root then
    root = util.root_pattern("package.json", "tsconfig.json")(fname)
  end

  return root
end

-- Compatible with both Nvim 0.10 (fname) and 0.11 (bufnr, on_dir)
local resolve_root_dir = function(bufnr_or_fname, on_dir)
  local fname = bufnr_or_fname
  if type(bufnr_or_fname) == "number" then
    fname = vim.api.nvim_buf_get_name(bufnr_or_fname)
  end

  local root = get_root_dir(fname)
  if on_dir then
    if root then
      on_dir(root)
    end
  else
    return root
  end
end

local oxfmt_filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "json",
  "jsonc",
  "yaml",
  "toml",
  "html",
  "vue",
  "css",
  "scss",
  "less",
  "markdown",
  "markdown.mdx",
  "graphql",
  "handlebars",
}

return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "oxfmt", "vtsls" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      for _, ft in ipairs(oxfmt_filetypes) do
        local existing = opts.formatters_by_ft[ft] or {}
        opts.formatters_by_ft[ft] = { "oxfmt", unpack(existing) }
        opts.formatters_by_ft[ft].stop_after_first = true
      end

      opts.formatters = opts.formatters or {}
      opts.formatters.oxfmt = {
        condition = function(_, ctx)
          return vim.fs.find({ "oxlintrc.json", ".oxlintrc.json" }, { path = ctx.filename, upward = true })[1]
        end,
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = { virtual_text = false },
      inlay_hints = { enabled = false },
      document_highlight = { enabled = false },
      servers = {
        eslint = { root_dir = resolve_root_dir },
        vtsls = {
          -- Use monorepo-aware root detection
          root_dir = resolve_root_dir,
          -- Critical for monorepos: prevents multiple LSP instances per package
          single_file_support = false,
          on_attach = function(client, bufnr)
            if client.name ~= "vtsls" then
              return
            end

            -- Add monorepo workspace folders so TS server loads projects proactively.
            if client.config._monorepo_workspaces_added then
              return
            end
            client.config._monorepo_workspaces_added = true

            local root = client.config.root_dir
            if type(root) ~= "string" or root == "" then
              return
            end

            local workspace_dirs = {}
            local patterns = { "apps/*", "packages/*" }
            for _, pattern in ipairs(patterns) do
              local matches = vim.fn.globpath(root, pattern, true, true)
              for _, dir in ipairs(matches) do
                if vim.fn.isdirectory(dir) == 1 then
                  table.insert(workspace_dirs, dir)
                end
              end
            end

            if #workspace_dirs == 0 then
              return
            end

            for _, dir in ipairs(workspace_dirs) do
              vim.lsp.buf.add_workspace_folder(dir)
            end

            -- Trigger project discovery on first attach.
            vim.api.nvim_buf_call(bufnr, function()
              vim.lsp.codelens.refresh()
            end)
          end,
          settings = {
            typescript = {
              tsserver = {
                -- Allow a syntax server for snappier lightweight operations.
                useSyntaxServer = "auto",
                maxTsServerMemory = 4096,
                experimental = {
                  enableProjectDiagnostics = true,
                },
              },
              preferences = {
                includePackageJsonAutoImports = "on",
                -- Better monorepo support for cross-package imports
                importModuleSpecifierPreference = "shortest",
                includeCompletionsForModuleExports = true,
                includeCompletionsWithInsertText = true,
              },
              workspace = {
                -- Enable project references for cross-package navigation
                enableProjectDiagnostics = true,
                -- Allow searching across all workspace packages
                autoImportFileExcludePatterns = {},
              },
              inlayHints = {
                parameterNames = { enabled = "all", suppressWhenArgumentMatchesName = true },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true, suppressWhenTypeMatchesName = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
            javascript = {
              tsserver = {
                useSyntaxServer = "auto",
                maxTsServerMemory = 4096,
                experimental = {
                  enableProjectDiagnostics = true,
                },
              },
              preferences = {
                includePackageJsonAutoImports = "on",
                importModuleSpecifierPreference = "shortest",
              },
              workspace = {
                enableProjectDiagnostics = true,
              },
            },
            vtsls = {
              -- Automatically detect and use workspace TypeScript SDK
              autoUseWorkspaceTsdk = true,
              -- Enable experimental features for better DX
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
