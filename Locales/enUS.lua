local L = LibStub("AceLocale-3.0"):NewLocale("Clicked", "enUS", true)

if not L then
	return
end

L["ADDON_NAME"] = "Clicked"

L["ERR_FRAME_REGISTRATION"] = "|cffe31919Clicked|r: Unable to register unit frame: %s"
L["ERR_ADDON_INCOMPAT_MESSAGE"] = "Clicked is not compatible with %s and requires one of the two to be disabled."
L["ERR_ADDON_INCOMPAT_BUTTON_KEEP_X"] = "Keep %s"

L["MSG_PROFILE_UPDATED"] = "|cffe31919Clicked|r: Upgraded profile from version %s to version %s"
L["MSG_BINDING_UI_READ_ONLY_MODE"] = "|cffe31919Clicked|r: You are in combat, the binding configuration is in read-only mode."

L["MSG_POPUP_BUTTON_CONTINUE"] = "Continue"
L["MSG_POPUP_BUTTON_OK"] = "Okay"
L["MSG_POPUP_BUTTON_YES"] = "Yes"
L["MSG_POPUP_BUTTON_NO"] = "No"

L["BINDING_UI_FRAME_TITLE"] = "Clicked Binding Configuration"
L["BINDING_UI_FRAME_STATUS_TEXT"] = "%s | %s"

L["BINDING_UI_TREE_LABEL_CAST"] = "Cast %s"
L["BINDING_UI_TREE_LABEL_USE"] = "Use %s"
L["BINDING_UI_TREE_LABEL_RUN_MACRO"] = "Run custom macro"
L["BINDING_UI_TREE_LABEL_TARGET_UNIT"] = "Target the unit"
L["BINDING_UI_TREE_LABEL_UNIT_MENU"] = "Open the unit menu"
L["BINDING_UI_TREE_KEYBIND_UNBOUND"] = "UNBOUND"
L["BINDING_UI_TREE_LOADED"] = "Loaded"
L["BINDING_UI_TREE_UNLOADED"] = "Unloaded"

L["BINDING_UI_TREE_TOOLTIP_TARGETS"] = "Targets"
L["BINDING_UI_TREE_TOOLTIP_MACRO"] = "Macro"

L["BINDING_UI_BUTTON_NEW"] = "New"
L["BINDING_UI_BUTTON_CREATE"] = "Create"
L["BINDING_UI_BUTTON_DUPLICATE"] = "Duplicate"
L["BINDING_UI_BUTTON_COPY"] = "Copy Data"
L["BINDING_UI_BUTTON_PASTE"] = "Paste Data"
L["BINDING_UI_BUTTON_DELETE"] = "Delete"
L["BINDING_UI_BUTTON_SELECT"] = "Select"
L["BINDING_UI_BUTTON_FROM_SPELLBOOK"] = "Pick from spellbook"

L["BINDING_UI_POPUP_DELETE_BINDING_LINE_1"] = "Are you sure you want to delete this binding?"
L["BINDING_UI_POPUP_DELETE_BINDING_LINE_2"] = "%s %s"

L["BINDING_UI_POPUP_DELETE_GROUP_LINE_1"] = "Are you sure you want to delete this group and ALL bindings it contains? This will delete %s bindings."
L["BINDING_UI_POPUP_DELETE_GROUP_LINE_2"] = "%s"

L["BINDING_UI_TOOLTIP_SET_KEYBIND"] = "Press a key to bind, or ESC to clear the binding."

L["BINDING_UI_SEARCHBOX_PLACEHOLDER"] = "Search..."

L["BINDING_UI_GROUP_NAME_DEFAULT"] = "New Group"

L["BINDING_UI_PAGE_TITLE_ACTIONS"] = "Actions"
L["BINDING_UI_PAGE_TITLE_TARGETS"] = "Targets"
L["BINDING_UI_PAGE_TITLE_CONDITIONS"] = "Conditions"
L["BINDING_UI_PAGE_TITLE_STATUS"] = "Status"
L["BINDING_UI_PAGE_TITLE_TEMPLATE"] = "Create a new binding"

L["BINDING_UI_PAGE_TEMPLATE_TITLE_SIMPLE_BINDING"] = "Simple Binding"
L["BINDING_UI_PAGE_TEMPLATE_TITLE_CLICKCAST_BINDING"] = "Clickcast Binding"
L["BINDING_UI_PAGE_TEMPLATE_TITLE_HEALER_BINDING"] = "Healer Binding"
L["BINDING_UI_PAGE_TEMPLATE_TITLE_GROUP"] = "Group"

L["BINDING_UI_PAGE_TEMPLATE_DESCRIPTION_SIMPLE_BINDING"] = "A simple binding without any target prioritization, identical to standard action buttons."
L["BINDING_UI_PAGE_TEMPLATE_DESCRIPTION_CLICKCAST_BINDING"] = "A binding that only activates when hovering over a unit frame."
L["BINDING_UI_PAGE_TEMPLATE_DESCRIPTION_HEALER_BINDING"] = "A binding commonly used by healers, it will prioritize mouseover -> target -> player."
L["BINDING_UI_PAGE_TEMPLATE_DESCRIPTION_GROUP"] = "A group to organize multiple bindings."

L["BINDING_UI_PAGE_GROUP_LABEL_GOUP_NAME_ICON"] = "Group Name and Icon"

L["BINDING_UI_PAGE_ACTION_HELP_RESTRICTED_KEYBIND"] = "The left or right mouse button can only activate when hovering over unit frames."
L["BINDING_UI_PAGE_ACTION_HELP_SPELL_BOOK"] = "Click on a spell book entry to select it."
L["BINDING_UI_PAGE_ACTION_HELP_ITEM_SHIFT_CLICK"] = "Tip: You can shift-click an item in your bags when the input field is selected to autofill."
L["BINDING_UI_PAGE_ACTION_HELP_HOVERCAST"] = "This macro will only execute when hovering over unit frames, in order to interact with the selected target use the [@mouseover] conditional."
L["BINDING_UI_PAGE_ACTION_HELP_MACRO_MODE_APPEND"] = "This mode will directly append the macro text onto an automatically generated command generated by other bindings using the specified keybind. Generally, this means that it will be the last section of an '/use' command.\n\nWith this mode you're not writing a macro command. You're adding parts to an already existing command, so writing '/use Holy Light' will not work, in order to cast Holy Light simply type 'Holy Light"

L["BINDING_UI_PAGE_ACTION_LABEL_TYPE"] = "Action"
L["BINDING_UI_PAGE_ACTION_LABEL_MACRO_NAME_ICON"] = "Macro Name and Icon (optional)"
L["BINDING_UI_PAGE_ACTION_LABEL_ADDITIONAL_OPTIONS"] = "Options"
L["BINDING_UI_PAGE_ACTION_LABEL_TARGETS_UNIT"] = "On this target"
L["BINDING_UI_PAGE_ACTION_LABEL_TARGETS_UNIT_EXTRA"] = "Or"

L["BINDING_UI_PAGE_ACTION_TYPE_SPELL"] = "Cast a spell"
L["BINDING_UI_PAGE_ACTION_TYPE_ITEM"] = "Use an item"
L["BINDING_UI_PAGE_ACTION_TYPE_MACRO"] = "Run a macro (advanced)"
L["BINDING_UI_PAGE_ACTION_TYPE_UNIT_TARGET"] = "Target the unit"
L["BINDING_UI_PAGE_ACTION_TYPE_UNIT_MENU"] = "Open the unit menu"

L["BINDING_UI_PAGE_ACTION_SELECTED_SPELL"] = "Target Spell"
L["BINDING_UI_PAGE_ACTION_SELECTED_ITEM"] = "Target Item"
L["BINDING_UI_PAGE_ACTION_SELECTED_MACRO"] = "Macro Text"

L["BINDING_UI_PAGE_ACTION_MACRO_MODE_FIRST"] = "Run first (default)"
L["BINDING_UI_PAGE_ACTION_MACRO_MODE_LAST"] = "Run last"
L["BINDING_UI_PAGE_ACTION_MACRO_MODE_APPEND"] = "Append after bindings"

L["BINDING_UI_PAGE_ACTION_ADDITIONAL_OPTIONS_INTERRUPT_CURRENT_CAST"] = "Interrupt current cast"
L["BINDING_UI_PAGE_ACTION_ADDITIONAL_OPTIONS_START_AUTO_ATTACK"] = "Start auto-attack"

L["BINDING_UI_PAGE_TARGETS_UNIT_DEFAULT"] = "Default"
L["BINDING_UI_PAGE_TARGETS_UNIT_PLAYER"] = "Player (you)"
L["BINDING_UI_PAGE_TARGETS_UNIT_TARGET"] = "Target"
L["BINDING_UI_PAGE_TARGETS_UNIT_TARGETTARGET"] = "Target of target"
L["BINDING_UI_PAGE_TARGETS_UNIT_MOUSEOVER"] = "Mouseover target"
L["BINDING_UI_PAGE_TARGETS_UNIT_HOVERCAST"] = "Unit frame"
L["BINDING_UI_PAGE_TARGETS_UNIT_FOCUS"] = "Focus target"
L["BINDING_UI_PAGE_TARGETS_UNIT_CURSOR"] = "Cursor position"
L["BINDING_UI_PAGE_TARGETS_UNIT_PET"] = "Pet"
L["BINDING_UI_PAGE_TARGETS_UNIT_PET_TARGET"] = "Pet Target"
L["BINDING_UI_PAGE_TARGETS_UNIT_PARTY"] = "Party %s"
L["BINDING_UI_PAGE_TARGETS_UNIT_NONE"] = "<No one>"
L["BINDING_UI_PAGE_TARGETS_UNIT_REMOVE"] = "<Remove this option>"

L["BINDING_UI_PAGE_TARGETS_HOSTILITY_ANY"] = "Friendly, Hostile"
L["BINDING_UI_PAGE_TARGETS_HOSTILITY_FRIEND"] = "Friendly"
L["BINDING_UI_PAGE_TARGETS_HOSTILITY_HARM"] = "Hostile"

L["BINDING_UI_PAGE_TARGETS_VITALS_ANY"] = "Alive, Dead"
L["BINDING_UI_PAGE_TARGETS_VITALS_ALIVE"] = "Alive"
L["BINDING_UI_PAGE_TARGETS_VITALS_DEAD"] = "Dead"

L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_NEVER"] = "Never load"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_CLASS"] = "Class"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_RACE"] = "Race"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_SPECIALIZATION"] = "Talent specialization"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_TALENT"] = "Talent selected"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_PVP_TALENT"] = "PvP talent selected"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_WAR_MODE"] = "War Mode"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_FORM"] = "Form"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_STANCE"] = "Stance"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_PLAYER_NAME_REALM"] = "Player Name-Realm"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_COMBAT"] = "Combat"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_SPELL_KNOWN"] = "Spell known"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_IN_GROUP"] = "In group"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_PLAYER_IN_GROUP"] = "Player in group"
L["BINDING_UI_PAGE_LOAD_OPTIONS_LABEL_PET"] = "Pet"

L["BINDING_UI_PAGE_LOAD_OPTIONS_WAR_MODE_TRUE"] = "War Mode enabled"
L["BINDING_UI_PAGE_LOAD_OPTIONS_WAR_MODE_FALSE"] = "War Mode disabled"

L["BINDING_UI_PAGE_LOAD_OPTIONS_N_SPECIALIZATION"] = "Specialization %s"
L["BINDING_UI_PAGE_LOAD_OPTIONS_N_TALENT"] = "Talent %s/%s"
L["BINDING_UI_PAGE_LOAD_OPTIONS_N_PVP_TALENT"] = "PvP Talent %s"
L["BINDING_UI_PAGE_LOAD_OPTIONS_N_STANCE"] = "Stance %s"

L["BINDING_UI_PAGE_LOAD_OPTIONS_STANCE_NONE"] = "None"
L["BINDING_UI_PAGE_LOAD_OPTIONS_STANCE_HUMANOID"] = "Humanoid Form"

L["BINDING_UI_PAGE_LOAD_OPTIONS_COMBAT_TRUE"] = "In combat"
L["BINDING_UI_PAGE_LOAD_OPTIONS_COMBAT_FALSE"] = "Not in combat"

L["BINDING_UI_PAGE_LOAD_OPTIONS_IN_GROUP_SOLO"] = "Not in a group"
L["BINDING_UI_PAGE_LOAD_OPTIONS_IN_GROUP_PARTY"] = "In a party"
L["BINDING_UI_PAGE_LOAD_OPTIONS_IN_GROUP_RAID"] = "In a raid group"
L["BINDING_UI_PAGE_LOAD_OPTIONS_IN_GROUP_PARTY_OR_RAID"] = "In a party or raid group"

L["BINDING_UI_PAGE_LOAD_OPTIONS_PET_ACTIVE"] = "Pet"
L["BINDING_UI_PAGE_LOAD_OPTIONS_PET_INACTIVE"] = "No pet"

L["BINDING_UI_PAGE_STATUS_NOT_LOADED"] = "Not loaded"
L["BINDING_UI_PAGE_STATUS_GENERATED_LOCAL"] = "Generated local macro"
L["BINDING_UI_PAGE_STATUS_GENERATED_FULL"] = "Generated full macro"
L["BINDING_UI_PAGE_STATUS_GENERATED_RELATIVES"] = "Generated from %d other binding(s)"

L["INTERFACE_UI_TITLE_GENERAL"] = "Clicked"
L["INTERFACE_UI_TITLE_PROFILES"] = "Profiles"
L["INTERFACE_UI_TITLE_BLACKLIST"] = "Frame Blacklist"

L["INTERFACE_UI_GENERAL_POPUP_CAST_ON_KEY_DOWN"] = "If you are using custom unit frames you may have to adjust a setting within the unit frame configuration panel to enable support for this, and potentially even a UI reload.\n\nFor |cff1784d1ElvUI|r, check the box at: \n/ec -> UnitFrames -> Target On Mouse-Down, and reload the UI."

L["INTERFACE_UI_GENERAL_MINIMAP_ICON_NAME"] = "Enable minimap icon"
L["INTERFACE_UI_GENERAL_MINIMAP_ICON_DESCRIPTION"] = "Enable or disable the minimap icon."

L["INTERFACE_UI_GENERAL_CAST_ON_KEY_DOWN_NAME"] = "Cast on key down rather than key up"
L["INTERFACE_UI_GENERAL_CAST_ON_KEY_DOWN_DESCRIPTION"] = "This option will make bindings trigger on the 'down' portion of a button press rather than the 'up' portion."

L["INTERFACE_UI_BLACKLIST_HELP"] = "If you want to exclude certain unit frames from click-cast functionality, you can tick the boxes next to each item in order to blacklist them. This will take effect immediately."
L["INTERFACE_UI_BLACKLIST_HEADER_SELECTED"] = "Selected"
L["INTERFACE_UI_BLACKLIST_ADD"] = "Add a unit frame"

L["INTERFACE_UI_BLACKLIST_SOURCE_UNKNOWN"] = "Other"
L["INTERFACE_UI_BLACKLIST_SOURCE_BLIZZARD"] = "Blizzard"
L["INTERFACE_UI_BLACKLIST_SOURCE_ELVUI"] = "|cff1784d1ElvUI|r"
L["INTERFACE_UI_BLACKLIST_SOURCE_GRID2"] = "Grid2"
L["INTERFACE_UI_BLACKLIST_SOURCE_VUHDO"] = "|cffffe566VuhDo|r"
L["INTERFACE_UI_BLACKLIST_SOURCE_GLADIUS"] = "Gladius"

L["INTERFACE_UI_BLACKLIST_FRAME_NAME"] = "%s: %s"
