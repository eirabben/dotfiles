return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = { enabled = false },
        window = {
          mappings = {
            ["/"] = "none",
          },
        },
      },
      window = {
        mappings = {
          ["e"] = "open",
          ["v"] = {
            function(state)
              local node = state.tree:get_node()
              if not node then
                vim.notify("neo-tree: no node under cursor", vim.log.levels.WARN)
                return
              end

              -- Resolve path. If it's a file, use its parent; if folder, use itself.
              local path = node:get_id()
              local is_dir = node.type == "directory" or node.type == "dir"
              if not is_dir then
                path = require("neo-tree.utils").get_path_parent(path)
              end

              -- Fallback: if somehow empty, use cwd
              if not path or path == "" then
                path = vim.loop.cwd()
              end

              -- Call fzf-lua live_grep
              local ok, fzf = pcall(require, "fzf-lua")
              if not ok then
                vim.notify("fzf-lua not found", vim.log.levels.ERROR)
                return
              end
              fzf.live_grep({
                search_paths = { path },
              })
            end,
            desc = "Live grep in directory",
          },
        },
      },
    },
  },
}
