local C = {}

C.lighten = function()
    local schemes = { 'catppuccin-latte', 'kanagawa-lotus', 'dawnfox', 'dayfox' }
    math.randomseed(tonumber(os.date '%S') or 1)
    vim.opt.background = 'light'
    vim.cmd.colorscheme(schemes[math.random(#schemes)])
end

C.darken = function()
    local schemes = { 'catppuccin-mocha', 'kanagawa-wave', 'tundra', 'nightfox', 'carbonfox', 'duskfox' }
    math.randomseed(tonumber(os.date '%S') or 1)
    vim.opt.background = 'dark'
    vim.cmd.colorscheme(schemes[math.random(#schemes)])
end

C.set_color_scheme = function()
    vim.api.nvim_create_user_command('Golight', C.lighten, {})
    vim.api.nvim_create_user_command('GoDark', C.darken, {})
    local hour = tonumber(os.date '%H')
    if hour < 18 and hour > 7 then
        C.lighten()
        return
    end
    C.darken()
end

return C
