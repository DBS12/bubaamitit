function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local level = player:getLevel()
    local magLevel = player:getMagicLevel()
    local min = (level * 5) + (maglevel * 1) - 50
    local max = (level * 10) + (maglevel * 1)
    if player:getVocation():getId() == 1 or player:getVocation():getId() == 2 or player:getVocation():getId() == 3 or player:getVocation():getId() == 4 or player:getVocation():getId() == 5 or player:getVocation():getId() == 6 or player:getVocation():getId() == 7 or player:getVocation():getId() == 8 then
    player:addHealth(math.random(min, max))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:say("Mana And HP? Nice!", TALKTYPE_MONSTER_SAY)
    else
        player:sendCancelMessage("This rune is not usable for your vocation.")
    end
    return true
end