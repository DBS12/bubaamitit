local message = {
    "Are you stuck somewhere? type !exit. Don't forget to report bug place with !bug command.",
    "To see full list of available commands type !commands.",
    "Please report bugs with command !bug description. Your position when reporting is saved so please stay near bug position.",
    }

local i = 0
function onThink(interval, lastExecution)
local message = message[(i % #message) + 1]
    addEvent(Game.broadcastMessage, 150, 'Info: ' .. message .. '', MESSAGE_STATUS_CONSOLE_ORANGE)
    i = i + 1
    return true
end