function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local level = player:getLevel()
    local magLevel = player:getMagicLevel()
    local min = (level * 5) + (magLevel * 3) - 50
    local max = (level * 6) + (magLevel * 4)
    if player:getVocation():getId() == 1 or player:getVocation():getId() == 2 or player:getVocation():getId() == 3 or player:getVocation():getId() == 4 or player:getVocation():getId() == 5 or player:getVocation():getId() == 6 or player:getVocation():getId() == 7 or player:getVocation():getId() == 8 then
    player:addMana(math.random(min, max))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:say("Hmm Mana", TALKTYPE_MONSTER_SAY)
    else
        player:sendCancelMessage("This rune is not usable for your vocation.")
    end
    return true
end