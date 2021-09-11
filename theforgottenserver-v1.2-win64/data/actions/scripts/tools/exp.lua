-- SCRIPT BY KERN +CREDITS OTLAND--
local config = {
funnyEffect = "YES", 
minimumLevel = 1,
maximumLevel = 717217, -- for infinite type math.huge
}
local addExp = {
[{config.minimumLevel, config.maximumLevel}] = 99999999
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
local level = getPlayerLevel(cid)
    local effect = math.random(CONST_ME_FIREWORK_YELLOW,CONST_ME_FIREWORK_BLUE) 

    if level < config.minimumLevel then
        doPlayerSendCancel(cid, "You need to be at least "..config.minimumLevel.." to use an egg.")
        return FALSE 
    end
    
    if level >= config.maximumLevel then
        doPlayerSendCancel(cid, "Your level is too high for using an egg.")
        return FALSE 
    end

    for k, v in pairs(addExp) do 
        if level >= k[1] and level < k[2] then 
            doPlayerAddExp(cid, v)
            doPlayerSendTextMessage(cid, 22, "Exp? Oppa, Ze Lo Amarta")
            doRemoveItem(item.uid, 1)
            break 
        end 
    end  

        if config.funnyEffect == "YES" then
    local playerexp = addExp
        local pos = getPlayerPosition(cid)
        local positions = {
                {x=pos.x+1,y=pos.y-1,z=pos.z},
                {x=pos.x-1,y=pos.y-1,z=pos.z},
                {x=pos.x+1,y=pos.y+1,z=pos.z},
                {x=pos.x-1,y=pos.y+1,z=pos.z},
                {x=pos.x+1,y=pos.y,z=pos.z},
                {x=pos.x-1,y=pos.y,z=pos.z},
                {x=pos.x,y=pos.y+1,z=pos.z},
                {x=pos.x,y=pos.y-1,z=pos.z}
        }

        for i = 1, table.getn(positions) do
    
            doSendAnimatedText(getThingPos(cid), playerexp, TEXTCOLOR_RED) 
            doSendMagicEffect(positions[i],effect)
        end
    end
    return TRUE 
end