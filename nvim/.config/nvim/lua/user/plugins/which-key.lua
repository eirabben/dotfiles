local wk = require("which-key")
wk.setup()

-- TODO: setup mappings
-- w - window
-- f - find
-- g - go or git
-- t - tab
-- s - show?

wk.register({
	e = { "<cmd>Neotree toggle<cr>", "Open [E]xplorer" },
}, { prefix = "<leader>" })
