local L = LibStub("AceLocale-3.0"):GetLocale("Clicked")
local LibTalentInfo = LibStub("LibTalentInfo-1.0")

function Clicked:ShowAddonIncompatibilityPopup(addon)
	StaticPopupDialogs["ClickedAddonIncompatibilityMessage"] = {
		text = L["ERR_ADDON_INCOMPAT_MESSAGE"]:format(addon),
		button1 = L["ERR_ADDON_INCOMPAT_BUTTON_KEEP_X"]:format(L["ADDON_NAME"]),
		button2 = L["ERR_ADDON_INCOMPAT_BUTTON_KEEP_X"]:format(addon),
		OnAccept = function()
			DisableAddOn(addon)
			ReloadUI()
		end,
		OnCancel = function()
			DisableAddOn("Clicked")
			ReloadUI()
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = false,
		preferredIndex = 3
	}

	StaticPopup_Show("ClickedAddonIncompatibilityMessage")
end

function Clicked:ShowInformationPopup(text)
	StaticPopupDialogs["ClickedInformationMessage"] = {
		text = text,
		button1 = L["MSG_POPUP_BUTTON_CONTINUE"],
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3
	}

	StaticPopup_Show("ClickedInformationMessage")
end

function Clicked:ShowConfirmationPopup(message, func, ...)
	StaticPopupDialogs["ClickedConfirmationMessage"] = {
		text = message,
		button1 = L["MSG_POPUP_BUTTON_YES"],
		button2 = L["MSG_POPUP_BUTTON_NO"],
		OnAccept = func,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3
	}

	StaticPopup_Show("ClickedConfirmationMessage")
end

function Clicked:DeepCopyTable(original)
	if original == nil then
		return nil
	end

	local result = {}

	for k, v in pairs(original) do
		if type(v) == "table" then
			v = self:DeepCopyTable(v)
		end

		result[k] = v
	end

	return result
end

function Clicked:GetDataFromString(string, keyword)
	if self:IsStringNilOrEmpty(string) or self:IsStringNilOrEmpty(keyword) then
		return nil
	end

	local pattern = string.format("<%s=(.-)>", keyword)
	local match = string.match(string, pattern)

	return match
end

function Clicked:IsStringNilOrEmpty(string)
	return string == nil or #string == 0
end

function Clicked:IsClassic()
	return WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
end

function Clicked:GetTriStateLoadOptionValue(option)
	if option.selected == 1 then
		return { option.single }
	elseif option.selected == 2 then
		return { unpack(option.multiple) }
	end

	return nil
end

-- Check if the specified keybind is "restricted", a restricted keybind
-- is not allowed to do various actions as it is required for core game
-- input (such as left and right mouse buttons).
--
-- Restricted keybinds can still be used for bindings, but they will
-- have limited functionality.
function Clicked:IsRestrictedKeybind(keybind)
	return keybind == "BUTTON1" or keybind == "BUTTON2"
end

-- Check if a binding's target unit can have a hostility.
-- This will be false when, for example, PARTY_2 is passed
-- in because party members are by definition always friendly.
-- (at the time of configuration at least, i.e. don't take
-- potential mind controls into account)
function Clicked:CanUnitBeHostile(unit)
	if unit == Clicked.TargetUnits.TARGET then
		return true
	end

	if unit == Clicked.TargetUnits.TARGET_OF_TARGET then
		return true
	end

	if unit == Clicked.TargetUnits.FOCUS then
		return true
	end

	if unit == Clicked.TargetUnits.MOUSEOVER then
		return true
	end

	if unit == Clicked.TargetUnits.HOVERCAST then
		return true
	end

	if unit == Clicked.TargetUnits.PET_TARGET then
		return true
	end

	return false
end

function Clicked:CanUnitBeDead(unit)
	if unit == Clicked.TargetUnits.TARGET then
		return true
	end

	if unit == Clicked.TargetUnits.TARGET_OF_TARGET then
		return true
	end

	if unit == Clicked.TargetUnits.FOCUS then
		return true
	end

	if unit == Clicked.TargetUnits.PARTY_1 then
		return true
	end

	if unit == Clicked.TargetUnits.PARTY_2 then
		return true
	end

	if unit == Clicked.TargetUnits.PARTY_3 then
		return true
	end

	if unit == Clicked.TargetUnits.PARTY_4 then
		return true
	end

	if unit == Clicked.TargetUnits.PARTY_5 then
		return true
	end

	if unit == Clicked.TargetUnits.MOUSEOVER then
		return true
	end

	if unit == Clicked.TargetUnits.HOVERCAST then
		return true
	end

	if unit == Clicked.TargetUnits.PET then
		return true
	end

	if unit == Clicked.TargetUnits.PET_TARGET then
		return true
	end

	return false
end

-- Check if a binding's target unit can have a follow up target.
-- This will be the case for most targets, but some targets act
-- as a stop sign in macro code as they will always be valid.
-- For example [@player] or [@cursor] will always be 'true' and
-- thus it doesn't make sense to allow targets beyond.
function Clicked:CanUnitHaveFollowUp(unit)
	if unit == Clicked.TargetUnits.PLAYER then
		return false
	end

	if unit == Clicked.TargetUnits.CURSOR then
		return false
	end

	if unit == Clicked.TargetUnits.HOVERCAST then
		return false
	end

	if unit == Clicked.TargetUnits.DEFAULT then
		return false
	end

	return true
end

function Clicked:GetActiveBindingAction(binding)
	if binding.type == Clicked.BindingTypes.SPELL then
		return binding.actions.spell
	end

	if binding.type == Clicked.BindingTypes.ITEM then
		return binding.actions.item
	end

	if binding.type == Clicked.BindingTypes.MACRO then
		return binding.actions.macro
	end

	if binding.type == Clicked.BindingTypes.UNIT_SELECT then
		return binding.actions.unitSelect
	end

	if binding.type == Clicked.BindingTypes.UNIT_MENU then
		return binding.actions.unitMenu
	end

	return nil
end

function Clicked:GetLocalizedTargetUnits(excludeHovercast)
	local items = {
		[Clicked.TargetUnits.DEFAULT] = L["BINDING_UI_PAGE_TARGETS_UNIT_DEFAULT"],
		[Clicked.TargetUnits.PLAYER] = L["BINDING_UI_PAGE_TARGETS_UNIT_PLAYER"],
		[Clicked.TargetUnits.TARGET] = L["BINDING_UI_PAGE_TARGETS_UNIT_TARGET"],
		[Clicked.TargetUnits.TARGET_OF_TARGET] = L["BINDING_UI_PAGE_TARGETS_UNIT_TARGETTARGET"],
		[Clicked.TargetUnits.HOVERCAST] = L["BINDING_UI_PAGE_TARGETS_UNIT_HOVERCAST"],
		[Clicked.TargetUnits.MOUSEOVER] = L["BINDING_UI_PAGE_TARGETS_UNIT_MOUSEOVER"],
		[Clicked.TargetUnits.FOCUS] = L["BINDING_UI_PAGE_TARGETS_UNIT_FOCUS"],
		[Clicked.TargetUnits.CURSOR] = L["BINDING_UI_PAGE_TARGETS_UNIT_CURSOR"],
		[Clicked.TargetUnits.PET] = L["BINDING_UI_PAGE_TARGETS_UNIT_PET"],
		[Clicked.TargetUnits.PET_TARGET] = L["BINDING_UI_PAGE_TARGETS_UNIT_PET_TARGET"],
		[Clicked.TargetUnits.PARTY_1] = L["BINDING_UI_PAGE_TARGETS_UNIT_PARTY"]:format("1"),
		[Clicked.TargetUnits.PARTY_2] = L["BINDING_UI_PAGE_TARGETS_UNIT_PARTY"]:format("2"),
		[Clicked.TargetUnits.PARTY_3] = L["BINDING_UI_PAGE_TARGETS_UNIT_PARTY"]:format("3"),
		[Clicked.TargetUnits.PARTY_4] = L["BINDING_UI_PAGE_TARGETS_UNIT_PARTY"]:format("4"),
		[Clicked.TargetUnits.PARTY_5] = L["BINDING_UI_PAGE_TARGETS_UNIT_PARTY"]:format("5")
	}

	local order = {
		Clicked.TargetUnits.DEFAULT,
		Clicked.TargetUnits.PLAYER,
		Clicked.TargetUnits.TARGET,
		Clicked.TargetUnits.TARGET_OF_TARGET,
		Clicked.TargetUnits.HOVERCAST,
		Clicked.TargetUnits.MOUSEOVER,
		Clicked.TargetUnits.FOCUS,
		Clicked.TargetUnits.CURSOR,
		Clicked.TargetUnits.PET,
		Clicked.TargetUnits.PET_TARGET,
		Clicked.TargetUnits.PARTY_1,
		Clicked.TargetUnits.PARTY_2,
		Clicked.TargetUnits.PARTY_3,
		Clicked.TargetUnits.PARTY_4,
		Clicked.TargetUnits.PARTY_5
	}

	if excludeHovercast then
		table.remove(order, 5)
	end

	return items, order
end

function Clicked:GetLocalizedTargetHostility()
	local items = {
		[Clicked.TargetHostility.ANY] = L["BINDING_UI_PAGE_TARGETS_HOSTILITY_ANY"],
		[Clicked.TargetHostility.HELP] = L["BINDING_UI_PAGE_TARGETS_HOSTILITY_FRIEND"],
		[Clicked.TargetHostility.HARM] = L["BINDING_UI_PAGE_TARGETS_HOSTILITY_HARM"]
	}

	local order = {
		Clicked.TargetHostility.ANY,
		Clicked.TargetHostility.HELP,
		Clicked.TargetHostility.HARM
	}

	return items, order
end

function Clicked:GetLocalizedTargetVitals()
	local items = {
		[Clicked.TargetVitals.ANY] = L["BINDING_UI_PAGE_TARGETS_VITALS_ANY"],
		[Clicked.TargetVitals.ALIVE] = L["BINDING_UI_PAGE_TARGETS_VITALS_ALIVE"],
		[Clicked.TargetVitals.DEAD] = L["BINDING_UI_PAGE_TARGETS_VITALS_DEAD"]
	}

	local order = {
		Clicked.TargetVitals.ANY,
		Clicked.TargetVitals.ALIVE,
		Clicked.TargetVitals.DEAD
	}

	return items, order
end

function Clicked:GetLocalizedTargetString(target)
	local result = {}

	if Clicked:CanUnitBeHostile(target.unit) and target.hostility ~= Clicked.TargetHostility.ANY then
		local hostility = self:GetLocalizedTargetHostility()
		table.insert(result, hostility[target.hostility])
	end

	if Clicked:CanUnitBeDead(target.unit) and target.vitals ~= Clicked.TargetVitals.ANY then
		local vitals = self:GetLocalizedTargetVitals()
		table.insert(result, vitals[target.vitals])
	end

	local units = self:GetLocalizedTargetUnits()
	table.insert(result, units[target.unit])

	return table.concat(result, " ")
end

function Clicked:GetLocalizedClasses()
	local items = {}
	local order

	local function AppendClass(class)
		local _, _, _, color = GetClassColor(class)
		local name = string.format("|c%s%s|r", color, L["BINDING_UI_PAGE_LOAD_OPTIONS_CLASS_" .. class])

		items[class] = string.format("<text=%s>", name)
	end

	if not self:IsClassic() then
		AppendClass(Clicked.Classes.WARRIOR)
		AppendClass(Clicked.Classes.PALADIN)
		AppendClass(Clicked.Classes.HUNTER)
		AppendClass(Clicked.Classes.ROGUE)
		AppendClass(Clicked.Classes.PRIEST)
		AppendClass(Clicked.Classes.DEATH_KNIGHT)
		AppendClass(Clicked.Classes.SHAMAN)
		AppendClass(Clicked.Classes.MAGE)
		AppendClass(Clicked.Classes.WARLOCK)
		AppendClass(Clicked.Classes.MONK)
		AppendClass(Clicked.Classes.DRUID)
		AppendClass(Clicked.Classes.DEMON_HUNTER)

		order = {
			Clicked.Classes.DEATH_KNIGHT,
			Clicked.Classes.DEMON_HUNTER,
			Clicked.Classes.DRUID,
			Clicked.Classes.HUNTER,
			Clicked.Classes.MAGE,
			Clicked.Classes.MONK,
			Clicked.Classes.PALADIN,
			Clicked.Classes.PRIEST,
			Clicked.Classes.ROGUE,
			Clicked.Classes.SHAMAN,
			Clicked.Classes.WARLOCK,
			Clicked.Classes.WARRIOR
		}
	else
		AppendClass(Clicked.Classes.WARRIOR)
		AppendClass(Clicked.Classes.PALADIN)
		AppendClass(Clicked.Classes.HUNTER)
		AppendClass(Clicked.Classes.ROGUE)
		AppendClass(Clicked.Classes.PRIEST)
		AppendClass(Clicked.Classes.SHAMAN)
		AppendClass(Clicked.Classes.MAGE)
		AppendClass(Clicked.Classes.WARLOCK)
		AppendClass(Clicked.Classes.DRUID)

		order = {
			Clicked.Classes.DRUID,
			Clicked.Classes.HUNTER,
			Clicked.Classes.MAGE,
			Clicked.Classes.PALADIN,
			Clicked.Classes.PRIEST,
			Clicked.Classes.ROGUE,
			Clicked.Classes.SHAMAN,
			Clicked.Classes.WARLOCK,
			Clicked.Classes.WARRIOR
		}
	end

	return items, order
end

function Clicked:GetLocalizedSpecializations(classes)
	local items = {}
	local order = {}

	if classes == nil then
		classes = {}
		classes[1] = select(2, UnitClass("player"))
	end

	if #classes == 1 then
		local class = classes[1]
		local specs = LibTalentInfo:GetClassSpecIDs(class) or {}

		for i = 1, #specs do
			local _, name, _, icon = GetSpecializationInfoByID(specs[i])
			local key = i

			items[key] = string.format("<icon=%d><text=%s>", icon, name)
			table.insert(order, key)
		end
	else
		local max = 0

		-- Find class with the most specializations out of all available classes
		if #classes == 0 then
			for _, specs in LibTalentInfo:AllClasses() do
				if #specs > max then
					max = #specs
				end
			end
		-- Find class with the most specializations out of the selected classes
		else
			for i = 1, #classes do
				local class = classes[i]
				local specs = LibTalentInfo:GetClassSpecIDs(class) or {}

				if #specs > max then
					max = #specs
				end
			end
		end

		for i = 1, max do
			local key = i

			items[key] = string.format("<text=%s>", L["BINDING_UI_PAGE_LOAD_OPTIONS_SPECIALIZATION"]:format(i))
			table.insert(order, key)
		end
	end

	return items, order
end

function Clicked:GetLocalizedTalents(specializations)
	local items = {}
	local order = {}

	if specializations == nil then
		specializations = {}
		specializations[1] = GetSpecializationInfo(GetSpecialization())
	end

	if #specializations == 1 then
		local spec = specializations[1]

		for tier = 1, MAX_TALENT_TIERS do
			for column = 1, NUM_TALENT_COLUMNS do
				local _, name, texture = LibTalentInfo:GetTalentInfo(spec, tier, column)
				local key = #order + 1

				items[key] = string.format("<icon=%d><text=%s>", texture, name)
				table.insert(order, key)
			end
		end
	else
		for tier = 1, MAX_TALENT_TIERS do
			for column = 1, NUM_TALENT_COLUMNS do
				local key = #order + 1

				items[key] = string.format("<text=%s>", L["BINDING_UI_PAGE_LOAD_OPTIONS_TALENT"]:format(tier, column))
				table.insert(order, key)
			end
		end
	end

	return items, order
end

function Clicked:GetLocalizedPvPTalents(specializations)
	local items = {}
	local order = {}

	if specializations == nil then
		specializations = {}
		specializations[1] = GetSpecializationInfo(GetSpecialization())
	end

	if #specializations == 1 then
		local spec = specializations[1]
		local numTalents = LibTalentInfo:GetNumPvPTalentsForSpec(spec, 1)

		for i = 1, numTalents do
			local _, name, texture = LibTalentInfo:GetPvPTalentInfo(spec, 1, i)
			local key = #order + 1

			items[key] = string.format("<icon=%d><text=%s>", texture, name)
			table.insert(order, key)
		end
	else
		local max = 0

		-- Find specialization with the highest number of PvP talents
		if #specializations == 0 then
			for _, specs in LibTalentInfo:AllClasses() do
				for _, spec in ipairs(specs) do
					local numTalents = LibTalentInfo:GetNumPvPTalentsForSpec(spec, 1)

					if numTalents > max then
						max = numTalents
					end
				end
			end
		-- Find specialization with the highest number of PvP talents out of the selected specializations
		else
			for _, spec in ipairs(specializations) do
				local numTalents = LibTalentInfo:GetNumPvPTalentsForSpec(spec, 1)

				if numTalents > max then
					max = numTalents
				end
			end
		end

		for i = 1, max do
			local key = i

			items[key] = string.format("<text=%s>", L["BINDING_UI_PAGE_LOAD_OPTIONS_PVP_TALENT"]:format(i))
			table.insert(order, key)
		end
	end

	return items, order
end
