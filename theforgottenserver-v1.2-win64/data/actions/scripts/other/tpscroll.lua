savePos = {}

local function sendEffects(pos, eff, pid)
    if savePos[pid] then
        local player = Player(pid)
        if isPlayer(player) then
            pos:sendMagicEffect(eff, player)
            addEvent(sendEffects, 400, pos, eff, pid)
        end
    end
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
        player:sendCancelMessage('You cannot use this while in a fight.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end
    local pid = player:getId()
    if not savePos[pid] then
        savePos[pid] = {player:getPosition()}
        player:teleportTo(player:getTown():getTemplePosition())
        local pos = player:getPosition()
        local randpos = Position(pos.x+math.random(3), pos.y+math.random(2), pos.z)
        savePos[pid] = {savePos[pid][1], randpos}
        local cache  = savePos[pid]
        sendEffects(cache[2], 12, pid)
        sendEffects(cache[1], 35, pid)
        local item = Item(Tile(randpos):getGround().uid)
        item:setActionId(3006)
        addEvent(function()
            if item:getActionId(3006) then
                item:removeAttribute('aid')
                savePos[pid] = nil
            end
        end, 30000)
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You must enter your teleport first before you use this again.')
    end
    return true
end