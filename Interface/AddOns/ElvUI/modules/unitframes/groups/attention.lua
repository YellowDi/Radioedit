local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB
local UF = E:GetModule('UnitFrames');

local _, ns = ...
local ElvUF = ns.oUF
assert(ElvUF, "ElvUI was unable to locate oUF.")

function UF:Construct_AttentionFrames(unitGroup)
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)	
	
	self.menu = UF.SpawnMenu

	self.Health = UF:Construct_HealthBar(self, true)
	self.Name = UF:Construct_NameText(self)

	table.insert(self.__elements, UF.UpdateThreat)
	self:RegisterEvent('PLAYER_TARGET_CHANGED', UF.UpdateThreat)
	self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', UF.UpdateThreat)
	self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', UF.UpdateThreat)		
	
	self.RaidIcon = UF:Construct_RaidIcon(self)
	
	UF:Update_AttentionFrames(self, E.db['unitframe']['units']['attention'])
	UF:Update_StatusBars()
	UF:Update_FontStrings()	
	
	return self
end

function UF:Update_AttentionHeader(header, db)
	header:Hide()
	header:SetAttribute('oUF-initialConfigFunction', ([[self:SetWidth(%d); self:SetHeight(%d); self:SetFrameLevel(5)]]):format(db.width, db.height))
	header.db = db
	
	UF:ClearChildPoints(header:GetChildren())
	
	if not header.mover then
		self:ChangeVisibility(header, 'custom show') --fucking retarded bug fix
	end
	
	self:ChangeVisibility(header, 'raid')

	header:SetAttribute('showRaid', true)
	header:SetAttribute('point', 'BOTTOM')
	
	header:SetAttribute('columnAnchorPoint', 'TOP')

	UF:ClearChildPoints(header:GetChildren())
	header:SetAttribute('yOffset', 5)

	header:SetAttribute('columnAnchorPoint', 'TOP')
	header:SetAttribute('point', 'BOTTOM')

	header:SetAttribute('nameList', table.concat(E.AttentionList, ','))
	
	if not header.positioned then
		header:ClearAllPoints()
		header:Point("LEFT", E.UIParent, "LEFT", 300, 250)	
		E:CreateMover(header, header:GetName()..'Mover', L['Attention Frames'], nil, nil, nil, 'ALL,RAID25,EUI')
		
		header:SetAttribute('minHeight', header.dirtyHeight)
		header:SetAttribute('minWidth', header.dirtyWidth)
		header.positioned = true;
	end	
end

function UF:Update_AttentionFrames(frame, db)
	frame.db = db
	local BORDER = E:Scale(2)
	local SPACING = E:Scale(1)
	local UNIT_WIDTH = db.width
	local UNIT_HEIGHT = db.height

	frame.colors = ElvUF.colors
	if not InCombatLockdown() then
		frame:Size(UNIT_WIDTH, UNIT_HEIGHT)
		
		if _G[frame:GetName()..'Target'] then
			_G[frame:GetName()..'Target']:Size(UNIT_WIDTH, UNIT_HEIGHT)
			_G[frame:GetName()..'Target'].db = db
		end
	end
	frame.Range = {insideAlpha = 1, outsideAlpha = E.db.unitframe.OORAlpha}

	--Health
	do
		local health = frame.Health
		health.Smooth = self.db.smoothbars
		
		--Colors
		health.colorSmooth = nil
		health.colorHealth = nil
		health.colorClass = nil
		health.colorReaction = nil
		if self.db['colors'].healthclass ~= true then
			if self.db['colors'].colorhealthbyvalue == true then
				health.colorSmooth = true
			else
				health.colorHealth = true
			end		
		else
			health.colorClass = true
			health.colorReaction = true
		end	
		
		--Position
		health:ClearAllPoints()
		health:Point("TOPRIGHT", frame, "TOPRIGHT", -BORDER, -BORDER)
		health:Point("BOTTOMLEFT", frame, "BOTTOMLEFT", BORDER, BORDER)
	end
	
	--Name
	do
		local name = frame.Name
		name:Point('CENTER', frame.Health, 'CENTER')	
		if UF.db.colors.healthclass then
			frame:Tag(name, '[name:medium]')
		else
			frame:Tag(name, '[namecolor][name:medium]')
		end		
	end	
	
	frame:UpdateAllElements("ElvUI_UpdateAllElements")
end

UF['headerstoload']['attention'] = {nil, 'ELVUI_UNITTARGET'}