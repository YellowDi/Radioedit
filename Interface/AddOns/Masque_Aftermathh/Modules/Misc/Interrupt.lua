local Interrupt = CreateFrame("Frame")
Interrupt:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

function Interrupt:Update(self, Event, ...)
	if (Event == "COMBAT_LOG_EVENT_UNFILTERED") then		
		local _, EventType, _, _, SourceName, _, _, _, _, _, _, _, _, _, ExtraSkillID, _ = ...
		if EventType == "SPELL_INTERRUPT" and SourceName == UnitName("player") then
			SendChatMessage("Interrupted %t's " .. GetSpellLink(ExtraSkillID),  "SAY")
		end
	end
end

Interrupt:SetScript("OnEvent", Interrupt.Update)