local GH = 'https://github.com/'
local keymap = vim.keymap

vim.pack.add {
    { src = GH .. 'stevearc/oil.nvim' },
    { src = GH .. 'nvim-telescope/telescope.nvim' },
    { src = GH .. 'echasnovski/mini.icons' },
    { src = GH .. 'echasnovski/mini.snippets' },
    { src = GH .. 'echasnovski/mini.files' },
    { src = GH .. 'echasnovski/mini.animate' },
    { src = GH .. 'lewis6991/gitsigns.nvim' },
    { src = GH .. 'nickkadutskyi/jb.nvim' },
    { src = GH .. 'folke/lazydev.nvim' },
    { src = GH .. 'folke/which-key.nvim' },
    { src = GH .. 'nvim-lua/plenary.nvim' },
    { src = GH .. 'ThePrimeagen/harpoon',               version = 'harpoon2' },
    { src = GH .. 'lukas-reineke/indent-blankline.nvim' },
    { src = GH .. 'nvim-treesitter/nvim-treesitter' },
    { src = GH .. 'MunifTanjim/nui.nvim' },
    { src = GH .. 'm4xshen/hardtime.nvim' },
    { src = GH .. 'rcarriga/nvim-notify' },
    { src = GH .. 'tris203/precognition.nvim' },
    { src = GH .. 'christoomey/vim-tmux-navigator' },
    { src = GH .. 'numToStr/Comment.nvim' },
    { src = GH .. 'andrewferrier/wrapping.nvim' },
}

vim.cmd 'colorscheme jb'
require('Comment').setup()
require('lazydev').setup()
require('wrapping').setup()
require('mini.icons').setup()
require('mini.snippets').setup()
require('mini.files').setup()
require('mini.surround').setup()
require('mini.animate').setup({
    cursor = {timing=function() return 3 end},
    scroll = { timing = function() return 3 end },
})
local which_key = require 'which-key'

which_key.add {
    { '<leader>p', desc = 'find' },
    { '<leader>d', desc = 'debug' },
    { '<leader>g', desc = 'git' },
    { '<leader>r', desc = 'refactor' },
    { '<leader>tw', desc = 'training wheels' },
    { '<leader>v', desc = 'venv select' },

    --{ '<leader>a', icon = 'f1845' }
}

vim.notify = require 'notify'
require('hardtime').setup {
    enabled = false,
    disabled_keys = {
        ['<Up>'] = false,
        ['<Down>'] = false,
        ['<Left>'] = false,
        ['<Right>'] = false,
    },
}

require('oil').setup()
keymap.set('n', '<leader>pv', ':Oil<CR>', { desc = 'explore' })
local builtin = require 'telescope.builtin'
keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'files' })
keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'grep' })
keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'buffers' })
keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'help' })
keymap.set('n', '<leader>pp', function () require('mini.files').open() end, {desc='explorer'})


local harpoon = require 'harpoon'
harpoon.setup()
keymap.set('n', '<leader>h', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '\'Pooned files' })
keymap.set('n', '<leader>a', function()
    harpoon:list():add()
end, { desc = '\'Poon file' })
keymap.set('n', '<F1>', function()
    harpoon:list():select(1)
end)
keymap.set('n', '<F2>', function()
    harpoon:list():select(2)
end)
keymap.set('n', '<F3>', function()
    harpoon:list():select(3)
end)
keymap.set('n', '<F4>', function()
    harpoon:list():select(4)
end)
keymap.set('n', '<F9>', function()
    harpoon:list():prev()
end)
keymap.set('n', '<F10>', function()
    harpoon:list():next()
end)

require('ibl').setup()

keymap.set('n', '<leader>tw', function()
    require('precognition').toggle()
    vim.cmd ':Hardtime toggle'
end)

local gitsigns = require 'gitsigns'
gitsigns.setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 0,
        virt_text_pos = 'right_align'

    }
})
keymap.set('n', '<leader>gh', function () gitsigns.toggle_linehl() end, { desc = 'git highlight' })
keymap.set('n', '<leader>md', '<cmd>Markview HybridToggle<CR>', { desc = 'Toggle viewer' })
