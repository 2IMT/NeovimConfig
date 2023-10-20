return {
    "rmagatti/auto-session",
    config = function(_, opts)
        require("auto-session").setup {
            log_level = "error",
            auto_session_suppress_dirs = {
                "~/", "~/Projects", "~/Downloads", "/"
            }
        }
    end
}
