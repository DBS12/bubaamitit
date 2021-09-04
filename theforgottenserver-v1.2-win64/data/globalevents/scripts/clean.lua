local shutdownAtServerSave = false 
local cleanMapAtServerSave = true
  
local function serverSave()
    if shutdownAtServerSave then
        Game.setGameState(GAME_STATE_SHUTDOWN)
    else
        Game.setGameState(GAME_STATE_NORMAL)
    end

    if cleanMapAtServerSave then
        cleanMap()
    end
    

    saveServer()
    Game.broadcastMessage("Map was cleaned, next cleaning in 3 hours", MESSAGE_STATUS_WARNING)
end

local function thirdServerSaveWarning()
    addEvent(serverSave, 1000)
end


local function secondServerSaveWarning()
    addEvent(thirdServerSaveWarning, 60000)
    Game.broadcastMessage("Map will be cleared in 1 minute", MESSAGE_STATUS_WARNING)
end


function onThink(interval, lastExecution)
    addEvent(secondServerSaveWarning, 240000)
    Game.broadcastMessage("Map will be cleared in 5 minutes", MESSAGE_STATUS_WARNING)
    return not shutdownAtServerSave
end