return {
    {
        'preservim/vim-markdown',
        ft = 'markdown',
        dependencies = { 'godlygeek/tabular' },
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_conceal = 2
        end
    },
    {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        build = 'cd app && npm install',
        config = function()
            vim.g.mkdp_auto_start = 0
        end,
    },
    {
        'folke/zen-mode.nvim',
        cmd = 'ZenMode',
    },
    {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = true
    },
    {
        'jakewvincent/mkdnflow.nvim',
        ft = 'markdown',
        config = true
    }
}
