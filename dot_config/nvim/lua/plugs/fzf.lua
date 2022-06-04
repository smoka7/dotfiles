local colors = {
  ['bg'] = { 'bg', 'TelescopePromptNormal' },
  ['bg+'] = { 'bg', 'CursorLine' },
  ['fg'] = { 'fg', 'TelescopePromptNormal' },
  ['fg+'] = { 'fg', 'CursorLine' },
  ['gutter'] = { 'bg', 'TelescopePromptNormal' },
  ['header'] = { 'fg', 'TelescopePromptNormal' },
  ['hl'] = { 'fg', 'Cursor' },
  ['hl+'] = { 'fg', 'Statement' },
  ['info'] = { 'fg', 'TelescopePromptNormal' },
  ['marker'] = { 'fg', 'Cursor' },
  ['pointer'] = { 'fg', 'Const' },
  ['prompt'] = { 'fg', 'TelescopePromptNormal' },
  ['query'] = { 'fg', 'TelescopePromptNormal' },
  ['spinner'] = { 'fg', 'Label' },
}
require('fzf-lua').setup({
  fzf_colors = colors,
  winopts = {
    border = 'none',
    hl = {
      normal = 'TelescopeNormal', -- window normal color (fg+bg)
      border = 'TelescopeNormal', -- border color (try 'FloatBorder')
      cursor = 'Cursor', -- cursor highlight (grep/LSP matches)
      cursorline = 'CursorLine', -- cursor line
      search = 'TelescopePromptNormal', -- search matches (ctags)
      title       = 'TelescopePromptNormal',        -- preview border title (file/buffer)
      scrollbar_f = 'PmenuThumb',    -- scrollbar "full" section highlight
      scrollbar_e = 'PmenuSbar',     -- scrollbar "empty" section highlight
    },
  },
  lsp = {
    cwd_only = true, -- LSP/diagnostics for cwd only?
  },
})
