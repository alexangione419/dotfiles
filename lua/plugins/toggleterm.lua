return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            close_on_exit = true,
        })

        vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", {})
        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            -- exit terminal
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

            -- move around windows
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

            -- honeslty unsure
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')


    end

}
