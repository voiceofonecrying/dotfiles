local GH = 'https://github.com/'

vim.pack.add({
    { src = GH .. 'neovim/nvim-lspconfig' },
    { src = GH .. 'mason-org/mason.nvim' },
    { src = GH .. 'mason-org/mason-lspconfig.nvim' },
})

require 'mason'.setup()
require 'mason-lspconfig'.setup()

vim.keymap.set('n', '<leader><Tab>', vim.lsp.buf.format)

vim.diagnostic.config({
    --virtual_text = true,
    virtual_lines = true,
    underline = true
})
