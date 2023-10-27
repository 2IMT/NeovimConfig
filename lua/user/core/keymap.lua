--------------------------------------------------------------------------------
-- Core keymaps --
--------------------------------------------------------------------------------
-- Exit
vim.keymap.set("n", "<C-q>", "<cmd>qa<CR>")
vim.keymap.set("n", "<C-Q>", "<cmd>qa!<CR>")

-- Buffers
vim.keymap.set("n", "<F5>", "<cmd>bp<CR>")
vim.keymap.set("n", "<F6>", "<cmd>bn<CR>")
vim.keymap.set("n", "<F7>", "<cmd>bd<CR><cmd>bp<CR>")
vim.keymap.set("n", "<F12>", "<cmd>bd!<CR><cmd>bp<CR>")

-- Move lines
vim.keymap.set("n", "<F3>", "<cmd>m -2<CR>")
vim.keymap.set("n", "<F4>", "<cmd>m +1<CR>")

-- Windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize +1<CR>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize -1<CR>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +1<CR>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -1<CR>")

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

--------------------------------------------------------------------------------
-- NvimTree keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>eF", "<cmd>NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>")
vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>")

--------------------------------------------------------------------------------
-- LazyGit keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>")

--------------------------------------------------------------------------------
-- Telescope keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")

--------------------------------------------------------------------------------
-- Docs View keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>dt", "<cmd>DocsViewToggle<CR>")
vim.keymap.set("n", "<leader>du", "<cmd>DocsViewUpdate<CR>")

--------------------------------------------------------------------------------
-- null-ls keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>")

--------------------------------------------------------------------------------
-- ToggleTerm keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>T", "<cmd>ToggleTerm size=11<CR>")

--------------------------------------------------------------------------------
-- Dap keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader><F5>", "<cmd>DapContinue<CR>")
vim.keymap.set("n", "<leader><F6>", "<cmd>DapStepOver<CR>")
vim.keymap.set("n", "<leader><F7>", "<cmd>DapStepInto<CR>")
vim.keymap.set("n", "<leader><F8>", "<cmd>DapStepOut<CR>")
vim.keymap.set("n", "<leader><F12>", "<cmd>DapTerminate<CR>")
vim.keymap.set("n", "<leader>Db", "<cmd>DapToggleBreakpoint<CR>")

--------------------------------------------------------------------------------
-- DapUi keymaps --
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>Dt", "<cmd>lua require('dapui').toggle()<CR>")
vim.keymap.set("n", "<leader>Do", "<cmd>lua require('dapui').open()<CR>")
vim.keymap.set("n", "<leader>Dc", "<cmd>lua require('dapui').close()<CR>")

vim.keymap.set("n", "<leader>De", function()
    vim.ui.input({prompt = "Evaluate Expression: "},
                 function(input) require("dapui").eval(input) end)
end)

vim.keymap.set("n", "<leader>DE", "<cmd>lua require('dapui').eval()<CR>")
