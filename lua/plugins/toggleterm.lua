return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup{}
        vim.keymap.set('n', '<C-l>', ':ToggleTerm', {})
    end
}
