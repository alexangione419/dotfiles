return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        log_level = vim.log.levels.DEBUG,
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "pyright", "ts_ls" },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- 1) Global defaults for ALL servers (optional but nice)
      vim.lsp.config("*", {
        -- you can set shared capabilities, flags, etc here later
      })

      -- 2) Per-server overrides (optional)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- 3) Enable servers (THIS is the key migration step)
      vim.lsp.enable({ "ts_ls", "gopls", "pyright", "lua_ls" })

      -- 4) Keymaps only when an LSP actually attaches (best practice)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- hover for errors
      vim.api.nvim_create_autocmd("CursorHold", {
          callback = function()
              vim.diagnostic.open_float(nil, { focus = false })
          end,
      })
    end,
  },
}

