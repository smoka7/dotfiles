vim.cmd([[ 
let test#php#phpunit#executable = 'php artisan test'
]])

vim.keymap.set("n", "<Space>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<Space>tl", ":TestLast<CR>")
vim.keymap.set("n", "<Space>tf", ":TestFile<CR>")
vim.keymap.set("n", "<Space>tv", ":TestVisit<CR>")
