function onUse(player, item, fromPosition, target, toPosition, isHotkey)
  
    if player:getStorageValue(6025) == 1 then --whatever storage ID you want here
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'The chest is empty.')
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a token.')
		doPlayerAddItem(9020,100)
        item:setActionId(2505) --action ID you want the key to have here
        player:setStorageValue(6025, 0)
    end
    return true
end