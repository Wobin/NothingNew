--[[
Title: Nothing New
Author: Wobin
Date: 19/08/2026
Repository: https://github.com/Wobin/NothingNew
]]--

local ItemUtils = require("scripts/utilities/items")
local mod = get_mod("Nothing New")
mod.version = mod.get_metadata and mod:get_metadata("version") or "unknown"

mod.clear_new_item_indicators = function()
    ItemUtils.unmark_all_items_as_new()
end

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
    mod:hook("InventoryBackgroundView", "_get_valid_new_items", function(func, self, inventory_items)
      if mod:get("hide_new_item_indicator") then return {}, {} end
      return func(self, inventory_items)
    end)
    mod:hook("InventoryBackgroundView", "has_new_items_by_type", function(func, self, item_type)
      if mod:get("hide_new_item_indicator") then return false end
      return func(self, item_type)
    end)
end


mod.on_setting_changed = function(setting_name)
  if setting_name == "ignore_claim" and mod.Feed then
    mod.Feed._remove_objective(mod.Feed, "Level 7 Introduce Objective - Penances / Track")    
  end 
end
