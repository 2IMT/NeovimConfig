return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim", "jose-elias-alvarez/null-ls.nvim"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local null_ls = require("null-ls")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "",
                    package_uninstalled = ""
                }
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "html", "cssls", "lua_ls", "pyright", "omnisharp", "clangd",
                "cmake"
            },
            automatic_installation = true
        })

        null_ls.setup({
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end
                    })
                end
            end,
            sources = {
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.cmake_lint,
                null_ls.builtins.formatting.lua_format
            }
        })
    end
}
