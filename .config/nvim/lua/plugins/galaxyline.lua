local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

colors.bg = "NONE" 
colors.fg = "#81A1C1" 
colors.line_bg = "NONE" 
colors.lbg = "#3B4252" 
colors.fg_green = "#8FBCBB" 
colors.yellow = "#EBCB8B" 
colors.cyan = "#A3BE8C" 
colors.darkblue = "#81A1C1" 
colors.green = "#36c692" 
colors.orange = "#D08770" 
colors.purple = "#B48EAD" 
colors.magenta = "#BF616A" 
colors.gray = "#616E88" 
colors.blue = "#4FC1FF" 
colors.red = "#E06C75"

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.blue, i = colors.green,v=colors.violet,
                          [''] = colors.violet,V=colors.violet,
                          c = colors.magenta,no = colors.blue,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.red,Rv = colors.red,
                          cv = colors.blue,ce=colors.blue, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.blue,t = colors.blue}
      local mode = {
                    n = { color = colors.blue, name = 'N' },
                    i = { color = colors.cyan, name = 'I' },
                    v = { color = colors.violet, name = 'V' },
                    [''] = { color = colors.violet, name = 'V' },
                    V = { color = colors.violet, name = 'V' },
                    c = { color = colors.red, name = 'C' },
                    no = { color = colors.red, name = 'No' },
                    s = { color = colors.red, name = 'S' },
                    S = { color = colors.red, name = 'S' },
                    [''] = { color = colors.red, name = 'S' },
                    ic = { color = colors.red, name = 'Ic' },
                    R = { color = colors.red, name = 'R' },
                    Rv = { color = colors.red, name = 'R' },
                    cv = { color = colors.red, name = 'Cv' },
                    ce = { color = colors.red, name = 'Ce' },
                    r = { color = colors.red, name = 'R' },
                    rm = { color = colors.red, name = 'Rm' },
                    ['r?'] = { color = colors.red, name = 'R?' },
                    ['!'] = { color = colors.red, name = '!' },
                    t = { color = colors.red, name = 'T' },
                }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode[vim.fn.mode()].color)
      return '▊ ' .. mode[vim.fn.mode()].name .. ' '
    end,
    separator = " ",
    highlight = {colors.blue,colors.bg,'bold'},
  },
}

gls.left[2] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[3] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.purple,colors.bg,'bold'}
  }
}

-- gls.mid[1] = {
--   ShowLspClient = {
--     provider = 'GetLspClient',
--     condition = function ()
--       local tbl = {['dashboard'] = true,['']=true}
--       if tbl[vim.bo.filetype] then
--         return false
--       end
--       return true
--     end,
--     icon = ' LSP:',
--     highlight = {colors.cyan,colors.bg,'bold'}
--   }
-- }


gls.right[1] = {
  GitIcon = {
    provider = function() return '' end,
    condition = condition.check_git_workspace,
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.orange,colors.bg,'bold'},
  }
}

gls.right[2] = {
  GitBranch = {
    provider = 'GitBranch',
    separator = ' ',
    condition = condition.check_git_workspace,
    highlight = {colors.orange,colors.bg,'bold'},
  }
}

gls.right[3] = {
  Space = {
    provider = function() return ' ' end,
    condition = condition.check_git_workspace,
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.bg,colors.bg,'bold'},
  }
}

gls.right[4] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}

gls.right[5] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳 ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[6] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

gls.right[7] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}

gls.right[8] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.right[9] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.right[10] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[11] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.gray,colors.bg},
  },
}

gls.right[12] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.gray,colors.bg,'bold'},
  }
}

gls.right[13] = {
  endchar = {
    provider = function() return '▊' end,
    separator = " ",
    highlight = 'GalaxyViMode',
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
