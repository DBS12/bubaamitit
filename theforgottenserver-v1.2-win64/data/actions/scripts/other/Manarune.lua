function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local level = player:getLevel()
    local magLevel = player:getMagicLevel()
    local min = ((level * 5) + (magLevel * 3) - 50)/2.5
    local max = ((level * 6) + (magLevel * 4))/2.5
    player:addMana(math.random(min, max))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:say("Free Mana? Eize Buba", TALKTYPE_MONSTER_SAY)
    return true
end