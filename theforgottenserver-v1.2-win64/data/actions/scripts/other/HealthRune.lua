local exhaust = createConditionObject(CONDITION_EXHAUST)
setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local level = getPlayerLevel(cid)
	local mlevel = getPlayerMagLevel(cid)
	local health_minimum = ((level * 5) + (mlevel * 1) - 50)/3
	local health_maximum = ((level * 10) + (mlevel * 1))/3
	local health_add = math.random(health_minimum, health_maximum)
	
	doPlayerAddMana(cid, mana_add)
        doCreatureAddHealth(cid, health_add)
	doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_MAGIC_BLUE)
	doCreatureSay(itemEx.uid, "Free HP? Eize Buba", TALKTYPE_ORANGE_1)
	return TRUE
end