return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "catppuccin",
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        -- TODO: move to x
        lualine_c = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          -- { "fileformat" },
          -- { "filetype" },
        },
      lualine_y = {
          {"swenv"}
        }
      },
    })
  end,
}

-- local function get_venv(variable)
--   local venv = os.getenv(variable)
--   if venv ~= nil and string.find(venv, "/") then
--     local orig_venv = venv
--     for w in orig_venv:gmatch("([^/]+)") do
--       venv = w
--     end
--     venv = string.format("%s", venv)
--   end
--   return venv
-- end
--
-- {
--   "lualine.nvim",
--   opts = function(_, opts)
--     table.insert(opts.sections.lualine_y, {
--       function()
--         local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or "NO ENV"
--         return " " .. venv
--       end,
--       cond = function() return vim.bo.filetype == "python" end,
--     })
--   end
-- }
