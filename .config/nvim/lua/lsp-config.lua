local lsp = require('lspconfig')
local completion = require('completion')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local custom_attach = function()
  completion.on_attach()
  mapper('n', '<silent><c-]>', 'vim.lsp.buf.definition()')
  mapper('n', '<silent>K', 'vim.lsp.buf.hover()')
  mapper('n', '<silent>gD', 'vim.lsp.buf.implementation()')
  mapper('n', '<silent><c-k>', 'vim.lsp.buf.signature_help()')
  mapper('n', '<silent>1gD', 'vim.lsp.buf.type_definition()')
  mapper('n', '<silent>gr', 'vim.lsp.buf.references()')
  mapper('n', '<silent>g0', 'vim.lsp.buf.document_symbol()')
  mapper('n', '<silent>gW', 'vim.lsp.buf.workspace_symbol()')
  mapper('n', '<silent>gd', 'vim.lsp.buf.declaration()')
  mapper('n', '<leader>ga', 'vim.lsp.buf.code_action()')
  mapper('n', '<leader>dn', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', '<leader>dp', 'vim.lsp.diagnostic.goto_prev()')
  mapper('n', '<leader>f', 'vim.lsp.buf.formatting()')
  mapper('n', '<leader>r', 'vim.lsp.buf.rename()')

end

lsp.clangd.setup({
    cmd = {"clangd", "--background-index"},
    on_attach = custom_attach,
    init_options = {
        clangdFileStatus = true
    },
})

lsp.pyls.setup {
    on_attach = custom_attach,
}

lsp.bashls.setup {
    on_attach = custom_attach,
}
