local portalId, t = 1387,
{
    ["orshabaal"] = {
        message = "You have defeated Orshabaal! Run To The Next Boss",
        config = {
            createPos = {x = 7708, y = 46, z = 7},
            toPos = {x = 7745, y = 49, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
    ["latrivan"] = {
        message = "You have defeated Latrivan! Run To The Next Boss",
        config = {
            createPos = {x = 7785, y = 46, z = 7}, --NOTE: You may use empty brackets to create the portal where the monster dies.
            toPos = {x = 7823, y = 48, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["golgordan"] = {
        message = "You have defeated Golgordan! Run To The Next Boss",
        config = {
            createPos = {x = 7863, y = 45, z = 7},
            toPos = {x = 7668, y = 106, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["ghazbaran"] = {
        message = "You have defeated Ghazbaran! Run To The Next Boss",
        config = {
            createPos = {x = 7708, y = 103, z = 7},
            toPos = {x = 7746, y = 105, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["apocalypse"] = {
        message = "You have defeated Apocalypse! Run To The Next Boss",
        config = {
            createPos = {x = 7786, y = 102, z = 7},
            toPos = {x = 7824, y = 105, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["dracola"] = {
        message = "You have defeated Dracola! Run To The Next Boss",
        config = {
            createPos = {x = 7864, y = 102, z = 7},
            toPos = {x = 7668, y = 161, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["raging mage"] = {
        message = "You have defeated Raging Mage! Run To The Next Boss",
        config = {
            createPos = {x = 7708, y = 158, z = 7},
            toPos = {x = 7746, y = 161, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["the old widow"] = {
        message = "You have defeated The Old Widow! Run To The Next Boss",
        config = {
            createPos = {x = 7786, y = 158, z = 7},
            toPos = {x = 7824, y = 161, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["zugurosh"] = {
        message = "You have defeated Zugurosh! Run To The Next Boss",
        config = {
            createPos = {x = 7864, y = 158, z = 7},
            toPos = {x = 7668, y = 216, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    },
	["abyssador"] = {
        message = "You have defeated Abyssador!! Eize Buba!!",
        config = {
            createPos = {x = 7708, y = 213, z = 7},
            toPos = {x = 8029, y = 155, z = 7},
            portalTime = 1, --minutes
            storage = 123
        }
    }
}
 
local function removePortal(position)
    local portal = Tile(position):getItemById(portalId)
    if portal then
        portal:remove()
    end
end

function onKill(creature, target)
    if not target:isMonster() or target:getMaster() then
        return true
    end
   
    local player = Player(creature)
    local k = t[target:getName():lower()]
    if not k then
        return true
    end
   
    local pos, cPos = target:getPosition()
    if type(k.config.createPos) == 'table' then
        if next(k.config.createPos) == nil then
            cPos = pos
        else
            cPos = k.config.createPos
        end
    end
    local item = Game.createItem(portalId, 1, cPos)
    if item:isTeleport() then
        item:setDestination(k.config.toPos)
    end

    local pt = k.config.portalTime
    for i, damage in pairs(target:getDamageMap()) do
        local p = Player(i)
        if p then
            if p:getStorageValue(k.config.storage) < 1 then
                p:setStorageValue(k.config.storage, 1)
            end
        end
    end

    local killMessage = k.message .. " You have " .. pt .. " " .. (pt > 1 and "minutes" or "minute") .. " to escape!"
    target:say(killMessage, TALKTYPE_MONSTER_SAY, 0, 0, target:getPosition())
    addEvent(removePortal, pt * 60 * 1000, cPos)
   return true
end