local effects = {
    {position = Position(994, 1000, 7), text = 'Cities', effect = CONST_ME_DRAWBLOOD},
    {position = Position(994, 999, 7), text = 'Quests'}, -- text only
    {position = Position(994, 998, 7), text = 'Hunting', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 997, 7), text = 'NPC', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 998, 7), text = 'Depot', effect = CONST_ME_DRAWBLOOD},
	{position = Position(994, 997, 7), text = 'Arena', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 999, 7), text = 'Events', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 1000, 7), text = 'Trainer', effect = CONST_ME_DRAWBLOOD},
	{position = Position(994, 999, 6), text = 'Bosses', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 1001, 6), text = 'Donation Castles', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 999, 6), text = 'Donation Castles 2', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 998, 6), text = 'Donation Castles 3', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1006, 996, 6), text = 'Deticated Donation Castels ', effect = CONST_ME_DRAWBLOOD},
	{position = Position(1001, 992, 7), text = 'Donations', effect = CONST_ME_DRAWBLOOD},
	{position = Position(999, 992, 7), text = 'First Items', effect = CONST_ME_DRAWBLOOD},
	{position = Position(994, 998, 6), text = 'VIP', effect = CONST_ME_DRAWBLOOD},
	{position = Position(972, 627, 7), text = 'Ofek', effect = CONST_ME_DRAWBLOOD},
	{position = Position(972, 629, 7), text = 'Yarin', effect = CONST_ME_DRAWBLOOD},
	{position = Position(972, 631, 7), text = 'Dor', effect = CONST_ME_DRAWBLOOD},
	{position = Position(972, 633, 7), text = 'Shlomi', effect = CONST_ME_DRAWBLOOD},
	{position = Position(783, 1104, 7), text = 'Temple', effect = CONST_ME_DRAWBLOOD},
	{position = Position(784, 1105, 6), text = 'Temple', effect = CONST_ME_DRAWBLOOD},
	{position = Position(785, 1106, 5), text = 'Temple', effect = CONST_ME_DRAWBLOOD},
	{position = Position(789, 1107, 5), text = 'Daram Island 1', effect = CONST_ME_DRAWBLOOD},
	{position = Position(792, 1107, 5), text = 'Daram Island 2', effect = CONST_ME_DRAWBLOOD},
	{position = Position(795, 1109, 5), text = 'Kazordoon', effect = CONST_ME_DRAWBLOOD},
	{position = Position(786, 1109, 5), text = 'Buba City', effect = CONST_ME_DRAWBLOOD},
	{position = Position(788, 1106, 6), text = 'Svargrond', effect = CONST_ME_DRAWBLOOD},
	{position = Position(791, 1106, 6), text = 'Yalahar', effect = CONST_ME_DRAWBLOOD},
	{position = Position(794, 1108, 6), text = 'Farmine', effect = CONST_ME_DRAWBLOOD},
	{position = Position(794, 1111, 6), text = 'Gray Beach', effect = CONST_ME_DRAWBLOOD},
	{position = Position(794, 1114, 6), text = 'Roshamuul', effect = CONST_ME_DRAWBLOOD},
	{position = Position(791, 1115, 6), text = 'Rookgaard 1', effect = CONST_ME_DRAWBLOOD},
	{position = Position(788, 1115, 6), text = 'Isle of Solitude', effect = CONST_ME_DRAWBLOOD},
	{position = Position(785, 1114, 6), text = 'Island Of Destiny', effect = CONST_ME_DRAWBLOOD},
	{position = Position(785, 1111, 6), text = 'Rathleton', effect = CONST_ME_DRAWBLOOD},
	{position = Position(785, 1108, 6), text = 'Krailos', effect = CONST_ME_DRAWBLOOD},
	{position = Position(787, 1105, 7), text = 'Venore', effect = CONST_ME_DRAWBLOOD},
	{position = Position(790, 1105, 7), text = 'Thais', effect = CONST_ME_DRAWBLOOD},
	{position = Position(793, 1107, 7), text = 'Carlin', effect = CONST_ME_DRAWBLOOD},
	{position = Position(793, 1110, 7), text = 'AbDendriel', effect = CONST_ME_DRAWBLOOD},
	{position = Position(793, 1113, 7), text = 'Rookgaard 2', effect = CONST_ME_DRAWBLOOD},
	{position = Position(790, 1114, 7), text = 'Liberty Bay', effect = CONST_ME_DRAWBLOOD},
	{position = Position(787, 1114, 7), text = 'Port Hope', effect = CONST_ME_DRAWBLOOD},
	{position = Position(784, 1113, 7), text = 'Ankrahmun', effect = CONST_ME_DRAWBLOOD},
	{position = Position(784, 1110, 7), text = 'Darashia', effect = CONST_ME_DRAWBLOOD},
	{position = Position(784, 1107, 7), text = 'Edron', effect = CONST_ME_DRAWBLOOD},
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