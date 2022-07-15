require("ui.colors")

vim.opt.guifont = "JetBrains Mono,Iosevka Term:h13"
-- vim.opt.guifont = "FiraCode Nerd Font:h12"
-- vim.opt.linespace = 2

vim.g.neovide_transparency = 1
vim.g.neovide_window_floating_blur = 0
vim.g.neovide_window_floating_opacity = 0
vim.g.neovide_floating_blur = 0
vim.g.neovide_floating_opacity = 1

vim.keymap.set({ "i" }, "<C-\\>", "<C-W>")
vim.keymap.set({ "i" }, "<C-BS>", "<C-W>")
vim.keymap.set({ "i" }, "<C-v>", '<Left><C-o>"+p')
vim.keymap.set({ "n" }, "<C-v>", '"+p')
