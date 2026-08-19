local mod = get_mod("Nothing New")

return {
	name = mod:localize("mod_title"),
	description = mod:localize("mod_description"),
	is_togglable = true,
  options = {
		widgets = {
			{
				setting_id = "turn_on_cleaner",
				type = "button",
        button_text = "turn_on_cleaner_button",
        button_trigger = "held",
        button_hold_duration = 1,
        function_name = "clear_new_item_indicators",
			},
      {
        setting_id = "hide_new_item_indicator",
        type = "checkbox",
        default_value = false,
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
