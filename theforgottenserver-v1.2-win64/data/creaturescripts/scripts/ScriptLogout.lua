function onLogout(player)
local pid = player:getId()
    if savePos[pid] then
        Item(Tile(savePos[pid][2]):getGround().uid):removeAttribute('aid')
        savePos[pid] = nil
    end
    return true
end