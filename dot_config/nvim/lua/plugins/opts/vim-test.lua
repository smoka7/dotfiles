vim.cmd([[ 
let test#php#phpunit#executable = 'php artisan test'
let test#strategy = 'basic'
let test#neovim#term_position = "vert botright"
let test#basic#start_normal = 1 " If using neovim strategy
]])

vim.keymap.set('n', '<Space>tn', '<cmd>TestNearest<CR>')
vim.keymap.set('n', '<Space>tl', '<cmd>TestLast<CR>')
vim.keymap.set('n', '<Space>tf', '<cmd>TestFile<CR>')
vim.keymap.set('n', '<Space>tv', '<cmd>TestVisit<CR>')
