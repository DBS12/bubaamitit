local effects = {
    {position = Position(8009, 106, 7), text = 'Ah Kapra, lo ze lo B tamin li.', effect = CONST_ME_DRAWBLOOD},
    {position = Position(8009, 96, 7), text = 'Ah Kapra, lo ze lo A tamin li.'}, -- text only
    {position = Position(8009, 117, 7), text = 'Ah Kapra, lo ze lo C tamin li.', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8009, 127, 7), text = 'Ah Kapra, lo ze lo D tamin li.', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8013, 94, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8013, 104, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8013, 115, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8013, 125, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8029, 132, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8031, 132, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8033, 132, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8035, 132, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8029, 120, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8031, 120, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8033, 120, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8035, 120, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8029, 108, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8031, 108, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8033, 108, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8035, 108, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8029, 95, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8031, 95, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8033, 95, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8035, 95, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8042, 95, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8044, 95, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8046, 95, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8048, 95, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8042, 108, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8044, 108, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8046, 108, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8048, 108, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8042, 120, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8044, 120, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8046, 120, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8048, 120, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8042, 132, 7), text = 'A', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8044, 132, 7), text = 'B', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8046, 132, 7), text = 'C', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8048, 132, 7), text = 'D', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8030, 158, 7), text = 'Winner!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8025, 158, 7), text = 'Losers!!', effect = CONST_ME_TUTORIALARROW},
	{position = Position(8041, 92, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8041, 105, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8041, 117, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8041, 129, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8028, 92, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8028, 105, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8028, 117, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8028, 129, 7), text = 'Read Me!!', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8043, 158, 7), text = 'Temple', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8026, 62, 7), text = 'Easy', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8029, 62, 7), text = 'Hard', effect = CONST_ME_DRAWBLOOD},
	{position = Position(8024, 59, 7), text = 'Read Me!!', effect = CONST_ME_TUTORIALARROW},

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