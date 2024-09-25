return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = { hide_dotfiles = false, hide_gitignored = false },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { "smart" },
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.90,
          height = 0.85,
          preview_cutoff = 120,
        },
      },
    },
  },
}
