local GH = 'https://github.com/'

vim.pack.add({
    { src = GH .. 'neovim/nvim-lspconfig' },
    { src = GH .. 'mason-org/mason.nvim' },
    { src = GH .. 'mason-org/mason-lspconfig.nvim' },
    { src = GH .. 'WhoIsSethDaniel/mason-tool-installer' },
    { src = GH .. 'lervag/vimtex' },
    { src = GH .. 'hrsh7th/cmp-nvim-lsp' },
    { src = GH .. 'hrsh7th/cmp-buffer' },
    { src = GH .. 'hrsh7th/cmp-path'},
    { src = GH .. 'hrsh7th/cmp-cmdline'},
    { src = GH .. 'hrsh7th/nvim-cmp' },
    { src = GH .. 'L3MON4D3/LuaSnip' },
    { src = GH .. 'windwp/nvim-autopairs' }
})

require 'mason'.setup()
require 'mason-lspconfig'.setup()
require 'mason-tool-installer'.setup({
    ensure_installed = {
        'ty',
        'debugpy',
        'lua_ls',
        'stylua',
        'texlab'
    }
})
require 'nvim-autopairs'.setup()

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'tectonic'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'
local handlers = require('nvim-autopairs.completion.handlers')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({
    filetypes = {
      -- "*" is a alias to all filetypes
      ["*"] = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method,
          },
          handler = handlers["*"]
        }
      },
      lua = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end
        }
      },
      python = {
        ["("] = {
          kind = {
            cmp.lsp.CompletionItemKind.Function,
            cmp.lsp.CompletionItemKind.Method
          },
          ---@param char string
          ---@param item table item completion
          ---@param bufnr number buffer number
          ---@param rules table
          ---@param commit_character table<string>
          handler = function(char, item, bufnr, rules, commit_character)
            -- Your handler function. Inspect with print(vim.inspect{char, item, bufnr, rules, commit_character})
          end
        }
      },
      -- Disable for tex
      tex = false
    }
  })
)

cmp.setup({
snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
window = {
   completion = cmp.config.window.bordered(),
   documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<TAB>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' }, -- For luasnip users.
}, {
  { name = 'buffer' },
})
})

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
    settings = {
        workspace = {
            library = vim.api.nvim_get_runtime_file('', true)
        }
    },
    capabilities = capabilities
})
vim.lsp.config('ty', {
    capabilities = capabilities
})
vim.lsp.config('debugpy', {
    capabilities = capabilities
})

vim.keymap.set('n', '<leader>rr', vim.lsp.buf.format, { desc = 'LSP Format' })

vim.diagnostic.config({
    virtual_text = true,
    underline = true
})

vim.lsp.on_type_formatting.enable()
