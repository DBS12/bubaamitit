local message = {
	"Change your oufit with !addon '<addon>",
    "To see full list of available commands type !commands.",
    "To see full list of available spells type !spells.",
    "To see full list of diffrent types of highscore type !rank.",
	"Dont forget to check your vip with !checkvip.",
	"Always check your atrr points with !points.",
    }

local i = 0
function onThink(interval, lastExecution)
local message = message[(i % #message) + 1]
    addEvent(Game.broadcastMessage, 150, 'Info: ' .. message .. '', MESSAGE_STATUS_CONSOLE_ORANGE)
    i = i + 1
    return true
end