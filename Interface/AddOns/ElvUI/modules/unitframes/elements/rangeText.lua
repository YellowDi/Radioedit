local E, L, V, P, G = unpack(select(2, ...)); --Import: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');
local RC = LibStub("LibRangeCheck-2.0")

--Cache global variables
--Lua functions

--WoW API / Variables
local CreateFrame = CreateFrame

function UF:Configure_RangeText(frame)
	--Rare texture
	local db = frame.db

	local R = frame.RangeText
	if db.range and db.range.enable then
		R.rcText:ClearAllPoints()
		R.rcText:Point(db.range.position, frame.Health, db.range.position, db.range.offsetX, db.range.offsetY)
		R.rcText:Show()
	else
		R.rcText:Hide()
	end
end

function UF:Construct_RangeText(frame)
	local R = CreateFrame("Frame", nil, frame)
	R.rcText = R:CreateFontString(nil, 'OVERLAY')
	UF:Configure_FontString(R.rcText)
	
	R:SetScript("OnUpdate", function(self, elapsed)
		if(self.elapsed and self.elapsed > 0.2) then
			UF:UpdateRangeText(frame)
			
			self.elapsed = 0
		else
			self.elapsed = (self.elapsed or 0) + elapsed
		end	
	end)
	
	return R
end

function UF:UpdateRangeText(frame)
	local rcText
	if not frame or not frame.unitframeType then return end

	if not UnitName(frame.unitframeType) then
		rcText = ''
	else
		local minRange, maxRange = RC:getRange(frame.unitframeType)
		if maxRange then
			rcText = minRange.. '-'.. maxRange
		else
			rcText = '80-?'
		end
	end	
	
	frame.RangeText.rcText:SetText(rcText)
end