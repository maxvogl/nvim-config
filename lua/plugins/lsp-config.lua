-- Language Server Protocol (LSP)
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- check if the language server for the required
        -- language is installed, otherwise it will install?
        ensure_installed = {
          -- "clangd",  -- C++
          -- "cssls",  -- css
          -- "html",  -- HTML
          "tsserver", -- JavaScript
          "julials", -- Julia
          "lua_ls", -- Lua
          -- IN CASE OF <pylsp> OPEN THE FOLLOWING PATH:
          -- ~/.local/share/nvim/mason/packages/python-lsp-server/venv/pyvenv.cfg
          -- AND SET:
          -- include-system-site-packages = true
          "pylsp", -- Python
          -- "",  -- SQL
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- ensure the comunication between
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- neccessary for completions.lua

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.julials.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {}) -- shows docstring when pressing "shift" + "K" over the dessired variable (e.g. require* ...)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- <leader> is \ for default (jp keyboard = "option" + "YEN" or YEN key)
    end,
  },
}
