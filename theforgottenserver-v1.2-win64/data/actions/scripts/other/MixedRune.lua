function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local level = player:getLevel()
    local magLevel = player:getMagicLevel()
    local min = ((level * 5) + (magLevel * 3) - 50)/2
    local max = ((level * 6) + (magLevel * 4))/3
    if player:getVocation():getId() == 3 or player:getVocation():getId() == 7 then
    player:addHealth(math.random(min, max))
    player:addMana(math.random(min, max))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:say("Mana And HP? Eize Buba!", TALKTYPE_MONSTER_SAY)
    else
        player:sendCancelMessage("This rune is not usable for your vocation.")
    end
    return true
end