-- Telescope Colors
vim.cmd([[
function! TelescopeColors() abort
  "highlight TelescopeSelection guifg=#EBCB8B gui=bold
  "highlight! link TelescopeMatching  Decorator

  highlight  TelescopeMatching  guifg=#EBCB8B
  highlight! link TelescopeSelection CursorLine 

  highlight! link TelescopeMultiSelection  Comment 
  highlight! link TelescopePromptPrefix  String
  highlight! link TelescopeSelectionCaret  TelescopeSelection
endfunction

augroup Colors
    autocmd!
    autocmd ColorScheme * call TelescopeColors()
augroup END
]])


-- lsp colors
vim.cmd([[
function! DiagnosticColors() abort
  hi! link DiagnosticError  LspDiagnosticsDefaultError
  hi! link DiagnosticWarn  LspDiagnosticsDefaultWarning
  hi! link DiagnosticInfo  LspDiagnosticsDefaultInformation
  hi! link DiagnosticHint  LspDiagnosticsDefaultHint
endfunction

augroup Colors2
    autocmd!
    autocmd ColorScheme * call DiagnosticColors()
augroup END
]])

vim.cmd('colorscheme nord')
