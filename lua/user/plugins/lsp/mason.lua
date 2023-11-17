return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim", "jose-elias-alvarez/null-ls.nvim",
        "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui"
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local null_ls = require("null-ls")
        local dap = require("dap")
        local dapui = require("dapui")

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
                "html", "cssls", "lua_ls", "pyright", "jdtls", "clangd", "cmake"
            },
            automatic_installation = true
        })

        dap.adapters.cppdbg = {
            id = 'cppdbg',
            type = 'executable',
            command = '/home/daniil/Bin/cpptools/extension/debugAdapters/bin/OpenDebugAD7'
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ',
                                        vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true
            }, {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ',
                                        vim.fn.getcwd() .. '/', 'file')
                end
            }
        }

        dap.configurations.c = dap.configurations.cpp;
        dap.configurations.rust = dap.configurations.cpp;

        dap.adapters.coreclr = {
            type = 'executable',
            command = '/usr/bin/netcoredbg',
            args = {'--interpreter=vscode'}
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll',
                                        vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end
            }
        }

        dapui.setup({
            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                }
            },
            element_mappings = {},
            expand_lines = true,
            floating = {border = "single", mappings = {close = {"q", "<Esc>"}}},
            force_buffers = true,
            icons = {collapsed = "", current_frame = "", expanded = ""},
            layouts = {
                {
                    elements = {
                        {id = "scopes", size = 0.25},
                        {id = "breakpoints", size = 0.25},
                        {id = "stacks", size = 0.25},
                        {id = "watches", size = 0.25}
                    },
                    position = "left",
                    size = 40
                }, {
                    elements = {
                        {id = "repl", size = 0.5}, {id = "console", size = 0.5}
                    },
                    position = "bottom",
                    size = 10
                }
            },
            mappings = {
                edit = "e",
                expand = {"<CR>", "<2-LeftMouse>"},
                open = "o",
                remove = "d",
                repl = "r",
                toggle = "t"
            },
            render = {indent = 1, max_value_lines = 100}
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
                null_ls.builtins.formatting.lua_format,
                null_ls.builtins.diagnostics.jsonlint,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.csharpier,
                null_ls.builtins.formatting.rustfmt
            }
        })
    end
}
