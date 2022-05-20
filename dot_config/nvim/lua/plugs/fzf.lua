local colors = {
  ['fg'] = { 'fg', 'Normal' },
  ['bg'] = { 'bg', 'Normal' },
  ['hl'] = { 'fg', 'Search' },
  ['fg+'] = { 'fg', 'ModeMsg' },
  ['bg+'] = { 'bg', 'CursorLine' },
  ['hl+'] = { 'fg', 'Statement' },
  ['info'] = { 'fg', 'PreProc' },
  ['prompt'] = { 'fg', 'Function' },
  ['pointer'] = { 'fg', 'Const' },
  ['marker'] = { 'fg', 'Statement' },
  ['spinner'] = { 'fg', 'Label' },
  ['header'] = { 'fg', 'Comment' },
  ['gutter'] = { 'bg', 'Normal' },
}
require('fzf-lua').setup({
  fzf_colors = colors,
  winopts = {
    border = 'single',
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
