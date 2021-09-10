local storage = 11111
local item_required = 6543 -- item_id
local teleport_to = {x = 8048, y = 156, z = 7}

function onStepIn(cid, item, position, fromPosition)

    if not isPlayer(cid) then
        return false
    end

    local tp = 0
    if getPlayerStorageValue(cid, storage) == 1 then
        tp = 1
    elseif getPlayerItemCount(cid, item_required) >= 1 then
        doPlayerRemoveItem(cid, item_required, 1)
        setPlayerStorageValue(cid, storage, 0)
        tp = 1
    end

    if tp == 1 then
        doTeleportThing(cid, teleport_to)
		doPlayerSendCancel(cid, "We Have A Winner!")
		
    else
        doTeleportThing(cid, fromPosition)
        doPlayerSendCancel(cid, "Sorry, You Dont Have 1 Blue Buba Egg")
    end

    return true
end