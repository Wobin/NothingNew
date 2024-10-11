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
        tooltip = "nothing_new_tooltip",
			},
      	{
				setting_id = "ignore_claim",
				type = "checkbox",
				default_value = false,        
			},
      {
        setting_id = "hide_mastery_notification",
        type = "checkbox",
        default_value = false,
        },
      
		}
	}
}
