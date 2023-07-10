local lsp = vim.lsp
local api = vim.api

api.nvim_create_user_command('LspStopAttached', function()
    local current_buf = api.nvim_get_current_buf()
    local buf_clients = lsp.get_active_clients({ bufnr = current_buf })
    for _, client in ipairs(buf_clients) do
        client.stop(true)
    end
end, {})

api.nvim_create_user_command('LspRestartAttached', function()
    local current_buf = api.nvim_get_current_buf()
    local buf_clients = lsp.get_active_clients({ bufnr = current_buf })
    local detach_clients = {}
    for _, client in ipairs(buf_clients) do
        client.stop()
        detach_clients[client.name] = client
    end
    local timer = vim.ev.new_timer()
    timer:start(
        500,
        100,
        vim.schedule_wrap(function()
            for client_name, client in pairs(detach_clients) do
                if client.is_stopped() then
                    require('lspconfig.configs')[client_name].launch()
                    detach_clients[client_name] = nil
                end
            end

            if next(detach_clients) == nil and not timer:is_closing() then
                timer:close()
            end
        end)
    )
end, {})

api.nvim_create_user_command('LspToggle', function()
    require('lsp.mappings')
    require('lsp.nullls')
    require('lsp.custom_servers')
end, {})

api.nvim_create_user_command('LSPStopNotAttached', function()
    local current_buf = api.nvim_get_current_buf()
    local clients = lsp.get_active_clients()

    for _, client in ipairs(clients) do
        if not client.attached_buffers[current_buf] then
            client.stop(true)
        end
    end
end, {})
api.nvim_create_user_command('LspDettachClient', function(info)
    local server_name = string.len(info.args) > 0 and info.args or nil
    if server_name == nil then
        return
    end
    local configs = require('lspconfig.configs')
    for _, config in pairs(configs) do
        if config.name == server_name then
            config.manager = nil
        end
    end
end, { nargs = 1 })

api.nvim_create_user_command('LspAttachClient', function(info)
    local server_name = string.len(info.args) > 0 and info.args or nil
    if server_name == nil then
        return
    end
    local server = require('lspconfig')[server_name]
    local success, config = pcall(require, 'lsp.servers.' .. server_name)
    if success then
        server.setup(config)
    end

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    server.setup({ on_attach = function() end, capabilities = capabilities })
end, { nargs = 1 })
