function onUse(player, item, fromPosition, target, toPosition, isHotkey)
  
    if player:getStorageValue(6024) == 1 then --whatever storage ID you want here
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'The chest is empty.')
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a very special scroll.')
        player:addItem(7724)
        item:setActionId(2504) --action ID you want the key to have here
        player:setStorageValue(6024, 1)
    end
    return true
end