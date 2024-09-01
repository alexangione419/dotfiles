return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {"lua", "python", "javascript", "typescript", "cpp"},
            highlight = { enable = true },
            indent = { enable = true},
        })
    end
}
