return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup()
        Options = {
            theme = 'gruvbox-material'
        }
    end
}
