local starter = require('mini.starter')
starter.setup({
    header = [[███╗░░██╗██╗░░░██╗██╗███╗░░░███╗
████╗░██║██║░░░██║██║████╗░████║
██╔██╗██║╚██╗░██╔╝██║██╔████╔██║
██║╚████║░╚████╔╝░██║██║╚██╔╝██║
██║░╚███║░░╚██╔╝░░██║██║░╚═╝░██║
╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝]],
    footer = "",
    silent = true,
    items=nil,
    --items = {
    --    starter.sections.telescope(),
    --},
    content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning('center', 'center'),
    },
})
