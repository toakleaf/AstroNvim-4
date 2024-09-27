local last_filename = ""
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {

      pickers = {
        live_grep = {
          on_input_filter_cb = function()
            -- Reset last_filename whenever the input changes
            last_filename = ""
            return {}
          end,
          entry_maker = function(line)
            local filename = line:match "^(.-):"
            return {
              value = line,
              ordinal = line,
              display = function(entry)
                local coordinates = string.format("%-4s| ", entry.lnum)
                -- if entry.col then coordinates = string.format("%-4s:%-3s | ", entry.lnum, entry.col) end
                if last_filename == filename then return coordinates .. entry.text end
                local full_path = vim.fn.fnamemodify(entry.filename, ":p")
                local display_filename, _ =
                  require("telescope.utils").transform_path({ path_display = { "smart" } }, full_path)
                last_filename = filename
                return display_filename .. " | " .. entry.text,
                  { { { 0, #display_filename }, "TelescopeResultsIdentifier" } }
              end,
              filename = filename,
              lnum = tonumber(line:match ":(%d+):"),
              col = tonumber(line:match ":%d+:(%d+):"),
              text = line:match ":%d+:%d+:(.*)$",
            }
          end,
        },
      },
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
