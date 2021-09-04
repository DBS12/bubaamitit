function onStepIn(creature, item, position, fromPosition)
    local pid = creature:getId()
    local pos = savePos[pid]
    if pos and pos[2] then
        creature:teleportTo(pos[1])
        pos[2]:sendMagicEffect(CONST_ME_STUN)
        pos[1]:sendMagicEffect(CONST_ME_STUN)
        item:removeAttribute('aid')
        savePos[pid] = nil
    end
    return true
end