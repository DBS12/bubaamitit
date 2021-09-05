function onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:skillWindowChoice(modalWindowId, buttonId, choiceId)
    return true
end

function onAdvance(player, skill, oldLevel, newLevel)
    if skill == SKILL_LEVEL then
        player:skillPointsAdvance(newLevel)
    end
    return true
end

function onLogin(player)
    player:registerEvent("skillPoints_advance")
    player:registerEvent("skillPoints_modal")
    return true
end