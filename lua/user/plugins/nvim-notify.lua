return {
    "rcarriga/nvim-notify",
    priority = 999,
    config = function() vim.notify = require("notify") end
}
