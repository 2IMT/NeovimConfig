return {
    "amrbashir/nvim-docs-view",
    opt = true,
    config = function()
        require("docs-view").setup {position = "right", width = 60}
    end
}
