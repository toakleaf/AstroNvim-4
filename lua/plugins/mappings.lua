return {
  -- mapping will be set universally
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>m"] = { desc = "Macros" },
          ["<leader>mc"] = {
            "/on branch<cr>f/ly$ggP:s/-/ /g<cr>:s/ /-/<cr>:s/ / - /<cr>",
            desc = "Auto commit message from branch `ENG-XXX-Desc-words",
          },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },

  -- mapping will only be set in buffers with an LSP attached
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- K = {
          --   function()
          --     vim.lsp.buf.hover()
          --   end,
          --   desc = "Hover symbol details",
          -- },
          -- -- condition for only server with declaration capabilities
          -- gD = {
          --   function()
          --     vim.lsp.buf.declaration()
          --   end,
          --   desc = "Declaration of current symbol",
          --   cond = "textDocument/declaration",
          -- },
        },
      },
    },
  },
}
