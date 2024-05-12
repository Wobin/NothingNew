--[[
Title: Nothing New
Author: Wobin
Date: 12/05/2024
Repository: https://github.com/Wobin/NothingNew
Version 2.0
]]--
local ItemUtils = require("scripts/utilities/items")
local mod = get_mod("Nothing New")


mod.remove_event = function(self, objective)  
  if mod:get("ignore_claim") and objective:name() == "Level 7 Introduce Objective - Penances / Track" then
    mod.Feed._remove_objective(mod.Feed, objective:name())    
  end
end

mod.on_all_mods_loaded = function()  
    mod:hook_safe("HudElementMissionObjectiveFeed", "init", function(self)        
      mod.Feed = self
      mod.Feed._unregister_events(mod)
      Managers.event:register(mod, "event_add_mission_objective", "remove_event")        
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