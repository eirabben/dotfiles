local wk = require("which-key")
wk.setup()

-- TODO: setup mappings
-- w - window
-- f - find
-- g - go or git
-- t - tab
-- s - show?

wk.register({
  -- File Explorer
	e = { "<cmd>NvimTreeToggle<cr>", "Open [E]xplorer" },
	r = { "<cmd>NvimTreeFindFile<cr>", "[R]eveal Current File" },
}, { prefix = "<leader>" })
