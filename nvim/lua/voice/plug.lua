local GH = 'https://github.com/'

vim.pack.add({
    { src = GH .. 'stevearc/oil.nvim' },
    { src = GH .. 'echasnovski/mini.pick' },
    { src = GH .. 'echasnovski/mini.completion' },
    { src = GH .. 'echasnovski/mini.icons' },
    { src = GH .. 'echasnovski/mini.snippets' },
    { src = GH .. 'echasnovski/mini.diff' },
    { src = GH .. 'catppuccin/nvim' },
    { src = GH .. 'rose-pine/neovim' },
})

vim.cmd('colorscheme rose-pine-moon')
require 'oil'.setup()
vim.keymap.set('n', '<leader>pv', ':Oil<CR>')

require 'mini.pick'.setup()
vim.keymap.set('n', '<leader>pf', ':Pick files<CR>')
vim.keymap.set('n', '<leader>ph', ':Pick help<CR>')

require 'mini.completion'.setup()
require 'mini.icons'.setup()
require 'mini.snippets'.setup()
require 'mini.diff'.setup()

-- Tab cycles lsp completions
vim.keymap.set('i', '<Tab>', '<C-n>')
vim.keymap.set('i', '"<Tab>', '<C-b>')
