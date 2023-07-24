
require("mason").setup()

-- -------------------------------
-- LSP
-- -------------------------------

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").sumneko_lua.setup{
  capabilities = capabilities,
}

-- -------------------------------
-- Autocomplete
-- -------------------------------
local cmp = require("cmp")
cmp.setup({
  mapping = ({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),

})

require("mason").setup()
