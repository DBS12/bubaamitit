local useInProtectionZone = false
local useWithoutPzLocked = false
local useWithoutConditionFight = false
local successMessage = 'You have teleported to your house.'

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local okayTeleport = successMessage
    if player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
        okayTeleport = 'Sorry, you should wait a few seconds after a fight.'
	end
    if okayTeleport == successMessage then
        if Player.getHouse(player) then
            local doorPosition = House.getExitPosition(Player.getHouse(player))
            Position.sendMagicEffect(Creature.getPosition(player), CONST_ME_POFF)
            Creature.teleportTo(player, doorPosition, false)
            Position.sendMagicEffect(doorPosition, CONST_ME_TELEPORT)
            Player.sendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, okayTeleport)
        else
            okayTeleport = 'You not have a house.'
            Player.sendCancelMessage(player, okayTeleport)
            Position.sendMagicEffect(Creature.getPosition(player), CONST_ME_POFF)
        end
    else
        Player.sendCancelMessage(player, okayTeleport)
        Position.sendMagicEffect(Creature.getPosition(player), CONST_ME_POFF)
    end
    return true
end