require('lsp.diagnostic')
require('lsp.helpers')

if os.getenv('NO_LSP') then
    return
end

require('lsp.mappings')
require('lsp.nullls')
require('lsp.attach_servers')
