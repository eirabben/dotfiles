-- Animated scrolling, resizing and window open/close (LazyVim's mini-animate extra).
-- Cursor movement is not animated: it strains the eyes.
return {
  "nvim-mini/mini.animate",
  opts = {
    cursor = { enable = false },
  },
}
