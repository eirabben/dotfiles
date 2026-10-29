-- Leaner statusline: keep git diff counts and the macro indicator; drop the clock,
-- plugin-update count and Sidekick/Copilot status icons.
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local diff = vim.tbl_filter(function(c)
        return type(c) == "table" and c[1] == "diff"
      end, opts.sections.lualine_x)

      opts.sections.lualine_x = vim.list_extend({
        {
          function()
            return "recording @" .. vim.fn.reg_recording()
          end,
          cond = function()
            return vim.fn.reg_recording() ~= ""
          end,
          color = function()
            return { fg = Snacks.util.color("Constant") }
          end,
        },
      }, diff)
      opts.sections.lualine_z = {}
    end,
  },
}
