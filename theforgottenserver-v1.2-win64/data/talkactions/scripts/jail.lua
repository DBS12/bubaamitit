local config = {
    -- List of players that cannot be jailed
    blacklist = {'Summ', 'Admin'},
    -- if true you can even jail other GMs :)
    canJailAccess = false,

    -- if true it will not show the name of the Staff member that used the command
    anonymous = false,

    -- Position of your jail
    jailPosition = Position(1015, 645, 10),

    -- if unjailToTemple is set to true it will teleport the player to their hometown
    -- otherwise it will use unjailPosition
    unjailToTemple = true,
    unjailPosition = Position(1000, 1001, 7)
}


function onSay(player, words, param)
    if not player:getGroup():getAccess() then
        return true
    end

    local targetPlayer = Player(param)
    if not targetPlayer then
        player:sendCancelMessage('Usage: ' .. words .. ' <playername>')
        return false
    end

    if not config.canJailAccess and targetPlayer:getGroup():getAccess() then
        player:sendCancelMessage('You cannot jail/unjail this player.')
        return false
    end

    local toPosition
    if words == '/jail' then
        toPosition = config.jailPosition
    elseif words == '/unjail' then
        if config.unjailToTemple then
            toPosition = targetPlayer:getTown():getTemplePosition()
        else
            toPosition = config.unjailPosition
        end
    end

    local action = string.sub(words, 2, #words) .. 'ed'
    player:sendCancelMessage('You have ' .. action .. ' ' .. player:getName() .. '.')
    targetPlayer:sendCancelMessage('You have been ' .. action .. (config.anonymous and '' or ' by ' .. targetPlayer:getName()) .. '.')
    targetPlayer:teleportTo(toPosition)
    toPosition:sendMagicEffect(CONST_ME_TELEPORT)
    return false
end