function onThink(interval)
for _, player in ipairs(Game.getPlayers()) do
	local t = player:getPosition()
	local effects = { {position = t, text = 'VIP', effect = CONST_ME_MAGIC_RED }, }
	if player:isInGhostMode() then
            return true
	end
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 and player:isVip() then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
end
   return true
end