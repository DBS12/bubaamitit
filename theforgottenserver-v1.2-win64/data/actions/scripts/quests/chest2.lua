function onUse(player, item, fromPosition, target, toPosition, isHotkey)
  
    if player:getStorageValue(6022) == 1 then --whatever storage ID you want here
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'The chest is empty.')
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a token.')
        player:addItem(9020, 2)
        item:setActionId(2502) --action ID you want the key to have here
        player:setStorageValue(6022, 0)
    end
    return true
end