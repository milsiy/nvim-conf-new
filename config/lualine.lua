require("lualine").setup({
	options = {
		theme = {
			normal = { c = { bg = "" } },
			inactive = { c = { bg = "" } },
		},
		component_separators = { left = "", right = "─" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
