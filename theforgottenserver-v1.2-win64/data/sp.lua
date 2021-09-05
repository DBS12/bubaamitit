-- config
--promoted vocations included in function
local gainVoc = {
	[0] = {health = 10, mana = 10, magic = 1, skill = 1, cap = 10},
	[1] = {health = 10, mana = 10, magic = 1, skill = 1, cap = 10},
	[2] = {health = 10, mana = 10, magic = 1, skill = 1, cap = 10},
	[3] = {health = 10, mana = 10, magic = 1, skill = 1, cap = 10},
	[4] = {health = 10, mana = 10, magic = 1, skill = 1, cap = 10}
}

local skillStorage = 62490
local modalId = 4869
local TextModalId = 4870 -- so player may return to skill window
local skillPointsPerLevel = 3 -- points per level
local skillPointsAdvanceStorage = 62491 -- storage to avoid giving points twice for same level
local skillPointsTalkaction = "!points" -- so player knows command when he gets level up

local skills = {
-- name, get value, set value
	[1] = {'Health', function(player) return player:getMaxHealth() end, function(player) local gain = gainVoc[player:getBaseVocId()].health player:setMaxHealth(player:getMaxHealth() + gain) return gain end, 10},
	[2] = {'Mana', function(player) return player:getMaxMana() end, function(player) local gain = gainVoc[player:getBaseVocId()].mana player:setMaxMana(player:getMaxMana() + gain) return gain end, 10},
	[3] = {'Capacity', function(player) return player:getCapacity() / 100 end, function(player) local gain = gainVoc[player:getBaseVocId()].cap player:setCapacity(player:getCapacity() + (gain * 100)) return gain end, 10},
	[4] = {'Magic', function(player) return player:getBaseMagicLevel() end, function(player) local gain = gainVoc[player:getBaseVocId()].magic player:addSkillLevels(SKILL_MAGLEVEL, gain) return gain end, 10},
	[5] = {'Fist', function(player) return player:getSkillLevel(SKILL_FIST) end, function(player) local gain = gainVoc[player:getBaseVocId()].skill player:addSkillLevels(SKILL_FIST, gain) return gain end, 10},
	[6] = {'Club', function(player) return player:getSkillLevel(SKILL_CLUB) end, function(player) local gain = gainVoc[player:getBaseVocId()].skill player:addSkillLevels(SKILL_CLUB, gain) return gain end, 10},
	[7] = {'Sword', function(player) return player:getSkillLevel(SKILL_SWORD) end, function(player) local gain = gainVoc[player:getBaseVocId()].skill player:addSkillLevels(SKILL_SWORD, gain) return gain end, 10},
	[8] = {'Axe', function(player) return player:getSkillLevel(SKILL_AXE) end, function(player) local gain = gainVoc[player:getBaseVocId()].skill player:addSkillLevels(SKILL_AXE, gain) return gain end, 10},
	[9] = {'Distance', function(player) return player:getSkillLevel(SKILL_DISTANCE) end, function(player) local gain = gainVoc[player:getBaseVocId()].skill player:addSkillLevels(SKILL_DISTANCE, gain) return gain end, 10},
	[10] = {'Shielding', function(player) return player:getSkillLevel(SKILL_SHIELD) end, function(player) local gain = gainVoc[player:getBaseVocId()].skill player:addSkillLevels(SKILL_SHIELD, gain) return gain end, 10},
	[11] = {'Fishing', function(player) return player:getSkillLevel(SKILL_FISHING) end, function(player) local gain = gainVoc[player:getBaseVocId()].skill player:addSkillLevels(SKILL_FISHING, gain) return gain end, 10}
}

local skillForVoc = {
	[1] = {1, 2, 3, 4, 10, 11}, -- sorcerer
	[2] = {1, 2, 3, 4, 10, 11}, -- druid
	[3] = {1, 2, 3, 4, 9, 10, 11}, -- paladin
	[4] = {1, 2, 3, 5, 6, 7, 8, 10, 11}, -- knight
}

function Player:getBaseVocId()
	local basevoc = self:getVocation():getDemotion()
	if basevoc then
		return basevoc:getId()
	end
	return self:getVocation():getId()
end

function getExpForLevel(level)
	level = level - 1
	return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
end

function Player:addSkillLevels(skill, count)
	count = math.max(1, count or 1)
	
	if isInArray({SKILL_FIST, SKILL_CLUB, SKILL_SWORD, SKILL_AXE, SKILL_DISTANCE, SKILL_SHIELD, SKILL_FISHING}, skill) then
		for i = 1, count do
			local xp = math.ceil(self:getVocation():getRequiredSkillTries(skill, self:getSkillLevel(skill) + 1) / configManager.getNumber(configKeys.RATE_SKILL))
			self:addSkillTries(skill, xp)
		end
		return true
	end

	if skill == SKILL_MAGLEVEL then
		for i = 1, count do
			local xp = math.ceil(self:getVocation():getRequiredManaSpent(self:getBaseMagicLevel() + 1) / configManager.getNumber(configKeys.RATE_MAGIC))
			self:addManaSpent(xp)
		end
		return true
	end

	if skill == SKILL_LEVEL then
		for i = 1, count do
			local lv = self:getLevel()
			local xp = getExpForLevel(lv + 1) - getExpForLevel(lv)
			self:addExperience(xp, false)
		end
		return true
	end
	return false
end

function Player:sendSkillPointsWindow()
	local pts = self:getStorageValue(skillStorage)
	if pts < 0 then
		self:setStorageValue(skillStorage, 0)
		pts = 0
	end

	local window = ModalWindow(modalId, "Character Mastery", "Available points: [" .. pts .. "]")
	window:addButton(1, "Assign")
	window:addButton(2, "Exit")

	for i = 1, #skills do
		if isInArray(skillForVoc[self:getBaseVocId()], i) then
			window:addChoice(i, skills[i][1] .. ": [" .. skills[i][2](self) .. "][cost: " .. skills[i][4] .. "]")
		end
	end
	
	window:setDefaultEnterButton(1)
	window:setDefaultEscapeButton(2)
	window:sendToPlayer(self)
	return true
end

function Player:skillWindowChoice(windowId, buttonId, choiceId)
	if windowId == modalId then
		if buttonId == 1 then
			if not skills[choiceId] then
				local textWindow = ModalWindow(TextModalId, "Error", "No skill selected.")
				textWindow:addButton(1, "Ok")
				textWindow:setDefaultEnterButton(1)
				textWindow:setDefaultEscapeButton(1)
				textWindow:sendToPlayer(self)
				return true
			end
			local pts = self:getStorageValue(skillStorage)
			if pts < 0 then
				self:setStorageValue(skillStorage, 0)
				pts = 0
			end
			
			if pts - skills[choiceId][4] >= 0 then
				local textWindow = ModalWindow(TextModalId, "Point assigned.", skills[choiceId][1] .. " +" .. skills[choiceId][3](self))
				textWindow:addButton(1, "Ok")
				textWindow:setDefaultEnterButton(1)
				textWindow:setDefaultEscapeButton(1)
				textWindow:sendToPlayer(self)
				self:setStorageValue(skillStorage, pts - skills[choiceId][4])
				return true
			end

			local textWindow = ModalWindow(TextModalId, "Error", "Not enough points")
			textWindow:addButton(1, "Ok")
			textWindow:setDefaultEnterButton(1)
			textWindow:setDefaultEscapeButton(1)
			textWindow:sendToPlayer(self)
			return true
		end
		return false
	end
	
	if not (windowId == TextModalId) then
		return false
	end
		
	self:sendSkillPointsWindow()
	return false
end

function Player:addSkillPoints(count)
	count = math.max(1, count or 1)
	
	local pts = self:getStorageValue(skillStorage)
	if pts < 0 then
		self:setStorageValue(skillStorage, 0)
		pts = 0
	end
	
	return self:setStorageValue(skillStorage, pts + count)
end

function Player:skillPointsAdvance(nlevel)
	if self:getStorageValue(skillPointsAdvanceStorage) < nlevel then
		self:addSkillPoints(skillPointsPerLevel)
		self:setStorageValue(skillPointsAdvanceStorage, nlevel)
		self:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "New skill points available. Type " .. skillPointsTalkaction .. " to open character mastery window.")
	end
	return true
end