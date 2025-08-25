require "voice.map"
require "voice.options"
require "voice.lsp"
require "voice.plug"
--require("voice.lazy_init")

--No statusline bar
vim.cmd(":hi statusline guibg=NONE")

-- Highlight text when you yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
