local vipItems = {
   -- [itemid] = amount of vip days
    [5785] = 90
}

function onUse(cid, item, fromPosition, itemEx, toPosition, isHotkey)
    local player = Player(cid)
    local days = vipItems[item.itemid]
    player:addVipDays(days)
    player:say('!* YAY VIP! *!', TALKTYPE_MONSTER_SAY)
    player:getPosition():sendMagicEffect(CONST_ME_STUN)
    player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('You received %s vip days.', days))
    Item(item.uid):remove(1)
    return true
end