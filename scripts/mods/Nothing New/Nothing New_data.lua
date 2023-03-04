local mod = get_mod("Nothing New")

return {
	name = mod:localize("mod_title"),
	description = mod:localize("mod_description"),
	is_togglable = true,
  options = {
		widgets = {
			{
				setting_id = "turn_on_cleaner",
				type = "checkbox",
				default_value = false,
        get = function()
          mod:get("turn_on_cleaner")
        end,
        set = function(new_value)
          mod:set("turn_on_cleaner", new_value, true)        
        end,
			}
		}
	}
}
