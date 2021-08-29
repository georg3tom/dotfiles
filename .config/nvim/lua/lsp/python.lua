require'lspconfig'.pyright.setup {
    on_attach = require'lsp'.on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = O.python.diagnostics.virtual_text,
            signs = O.python.diagnostics.signs,
            underline = O.python.diagnostics.underline,
            update_in_insert = true
        })
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = O.python.analysis.type_checking,
                autoSearchPaths = O.python.analysis.auto_search_paths,
                useLibraryCodeForTypes = O.python.analysis.use_library_code_types
            }
        }
    }
}
