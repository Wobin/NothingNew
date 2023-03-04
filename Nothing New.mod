return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`Nothing New` encountered an error loading the Darktide Mod Framework.")

		new_mod("Nothing New", {
			mod_script       = "Nothing New/scripts/mods/Nothing New/Nothing New",
			mod_data         = "Nothing New/scripts/mods/Nothing New/Nothing New_data",
			mod_localization = "Nothing New/scripts/mods/Nothing New/Nothing New_localization",
		})
	end,
	packages = {},
}
