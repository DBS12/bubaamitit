local bless = {1, 2, 3, 4, 5}
local cost = 50000 -- Cost in gp.

function onSay(player, words, param)
    for i = 1, table.maxn(bless) do
        if player:hasBlessing(bless[i]) then
            return player:sendTextMessage(MESSAGE_INFO_DESCR, "You already have all blessings.")
        end
    end

    if player:removeMoney(cost) then
        for i = 1, table.maxn(bless) do
            player:addBlessing(bless[i])
        end
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You have bought all blessings.")
        player:say("You have bought all blessings.",  TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You don't have enough money.")
    end
    return true
end