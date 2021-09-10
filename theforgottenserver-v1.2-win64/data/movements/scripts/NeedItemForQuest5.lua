local storage = 11115
local item_required = 9020 -- item_id
local teleport_to = {x = 8045, y = 91, z = 7}

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
		doPlayerSendCancel(cid, "Go On!")
		
    else
        doTeleportThing(cid, fromPosition)
        doPlayerSendCancel(cid, "Sorry, You Dont Have Enough Tokens")
    end

    return true
end