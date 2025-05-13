local cmp = require('cmp')

cmp.setup({
  completion = {
    autocomplete = false,  -- 👈 Desativa sugestões automáticas
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),       -- 👈 Ativa sugestão só com <C-Space>
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = 'nvim_lsp' },
  },
})
