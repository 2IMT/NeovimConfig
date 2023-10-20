return {
    "nvim-lualine/lualine.nvim",
    opts = true,
    config = function(_, opts)
        require("lualine").setup({disabled_filetypes = {"NvimTree*"}})
    end
}
