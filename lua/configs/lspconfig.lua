local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end
  --  To jump back, press <C-t>.
  map("n", "gd", vim.lsp.buf.definition, opts "[G]oto [D]efinition")
  -- F"n", ind references for the word under your cursor.
  map("n", "gr", require("telescope.builtin").lsp_references, opts "[G]oto [R]eferences")
  -- J"n", ump to the implementation of the word under your cursor.
  map("n", "gI", vim.lsp.buf.implementation, opts "[G]oto [I]mplementation")
  -- J"n", ump to the type of the word under your cursor.
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Type [D]efinition")
  -- F"n", uzzy find all the symbols in your current document.
  map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts "[D]ocument [S]ymbols")
  -- F"n", uzzy find all the symbols in your current workspace.
  map("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts "[W]orkspace [S]ymbols")
  -- R"n", ename the variable under your cursor.
  map("n", "<leader>rn", require "nvchad.lsp.renamer", opts "[R]e[n]ame")
  -- E"n", xecute a code action, usually your cursor needs to be on top of an error
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts "[C]ode [A]ction")
  -- T"n", his is not Goto Definition, this is Goto Declaration.
  map("n", "gD", vim.lsp.buf.declaration, opts "[G]oto [D]eclaration")

  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()
  local lspconfig = require "lspconfig"

  lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = require("blink.cmp").get_lsp_capabilities(M.capabilities),
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
  lspconfig.rust_analyzer.setup {
    on_attach = M.on_attach,
    capabilities = require("blink.cmp").get_lsp_capabilities(M.capabilities),
    on_init = M.on_init,
    settings = {
      ["rust-analyzer"] = {},
    },
  }
  lspconfig.ols.setup {
    on_attach = M.on_attach,
    capabilities = require("blink.cmp").get_lsp_capabilities(M.capabilities),
    on_init = M.on_init,
  }
  lspconfig.pyright.setup {
    on_attach = M.on_attach,
    capabilities = require("blink.cmp").get_lsp_capabilities(M.capabilities),
    on_init = M.on_init,
  }
end

return M
