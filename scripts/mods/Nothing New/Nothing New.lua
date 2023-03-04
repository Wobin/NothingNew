--[[
Title: Nothing New
Author: Wobin
Date: 04/03/2023
Repository: https://github.com/Wobin/NothingNew
]]--
local ItemUtils = require("scripts/utilities/items")
local mod = get_mod("Nothing New")

mod.on_setting_changed = function(self)
  
  ItemUtils.unmark_all_items_as_new()
  Promise.delay(2):next( function()
      mod:set("turn_on_cleaner", false)
      end)  
end