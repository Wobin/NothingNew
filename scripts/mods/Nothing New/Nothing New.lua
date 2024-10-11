--[[
Title: Nothing New
Author: Wobin
Date: 11/10/2024
Repository: https://github.com/Wobin/NothingNew
Version 3.0
]]--

local ItemUtils = require("scripts/utilities/items")
local mod = get_mod("Nothing New")
mod.version = "3.0"

mod.on_all_mods_loaded = function()  
    mod:info(mod.version)
    mod:hook_safe("HudElementMissionObjectiveFeed", "_add_objective", function(self, objective, ui_renderer, locally_added)        
      if not mod.Feed then mod.Feed = self end
      if mod:get("ignore_claim") and objective:name() == "Level 7 Introduce Objective - Penances / Track" then
            self._remove_objective(self, objective:name())    
      end
    end)  
    mod:hook_require("scripts/utilities/mastery", function(mastery)
      mod:hook(mastery, "has_available_points", function(func, data, traits)
        if mod:get("hide_mastery_notification") then return false end
        return func(data, traits)
      end)
    end)
end


mod.on_setting_changed = function(setting_name)
  if setting_name == "turn_on_cleaner" then
    ItemUtils.unmark_all_items_as_new()
    Promise.delay(2):next( function()
        mod:set("turn_on_cleaner", false)
      end)  
  end 
  if setting_name == "ignore_claim" then
    mod.Feed._remove_objective(mod.Feed, "Level 7 Introduce Objective - Penances / Track")    
  end
end