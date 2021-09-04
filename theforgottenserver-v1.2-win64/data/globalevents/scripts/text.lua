local effects = {
    {position = Position(994, 1000, 7), text = 'Buba', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(994, 999, 7), text = 'TP Room'}, -- text only
    {position = Position(994, 998, 7), text = 'Event', effect = CONST_ME_GROUNDSHAKER},
}

function onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
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
   return true
end