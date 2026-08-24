local addonName, addon = ...

local FRAME_NAME = "MPlusOneLineFrame"
local LAUNCHER_NAME = "MPlusOneLineLauncher"
local FRAME_WIDTH = 590
local FRAME_HEIGHT = 580

function addon:Print(message)
  DEFAULT_CHAT_FRAME:AddMessage("|cff8b5cf6MPlusOneLine|r: " .. message)
end

function addon:GetChatType()
  if IsInGroup(LE_PARTY_CATEGORY_HOME) then return "PARTY" end
  if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then return "INSTANCE_CHAT" end
  return nil
end

function addon:SendTip(groupName, entry)
  if not entry or not entry.name or not entry.tip or entry.tip == "" then
    self:Print("暂未收录该首领攻略。")
    return
  end

  local chatType = self:GetChatType()
  if not chatType then
    self:Print("不在队伍或副本队伍中，无法发送攻略。")
    return
  end

  SendChatMessage("【" .. groupName .. " · " .. entry.name .. "】" .. entry.tip, chatType)
end

function addon:SaveFramePosition(frame)
  local point, _, relativePoint, x, y = frame:GetPoint()
  MPlusOneLineDB.point = point
  MPlusOneLineDB.relativePoint = relativePoint
  MPlusOneLineDB.x = x
  MPlusOneLineDB.y = y
end

function addon:RestoreFramePosition(frame)
  local db = MPlusOneLineDB
  frame:ClearAllPoints()
  frame:SetPoint(db.point or "CENTER", UIParent, db.relativePoint or "CENTER", db.x or 0, db.y or 0)
end

function addon:SaveLauncherPosition(button)
  local point, _, relativePoint, x, y = button:GetPoint()
  MPlusOneLineDB.launcherPoint = point
  MPlusOneLineDB.launcherRelativePoint = relativePoint
  MPlusOneLineDB.launcherX = x
  MPlusOneLineDB.launcherY = y
end

function addon:RestoreLauncherPosition(button)
  local db = MPlusOneLineDB
  button:ClearAllPoints()
  button:SetPoint(
    db.launcherPoint or "CENTER",
    UIParent,
    db.launcherRelativePoint or "CENTER",
    db.launcherX or 260,
    db.launcherY or -150
  )
end

function addon:CreateLauncher()
  if self.launcher then return self.launcher end

  local button = CreateFrame("Button", LAUNCHER_NAME, UIParent)
  button:SetSize(34, 34)
  button:SetFrameStrata("MEDIUM")
  button:SetMovable(true)
  button:EnableMouse(true)
  button:RegisterForDrag("LeftButton")
  button:SetClampedToScreen(true)

  local icon = button:CreateTexture(nil, "ARTWORK")
  icon:SetAllPoints()
  icon:SetTexture("Interface\\AddOns\\MPlusOneLine\\assets\\cat-button.tga")
  local mask = button:CreateMaskTexture()
  mask:SetTexture("Interface\\CHARACTERFRAME\\TempPortraitAlphaMask", "CLAMPTOBLACKADDITIVE", "CLAMPTOBLACKADDITIVE")
  mask:SetAllPoints(icon)
  icon:AddMaskTexture(mask)

  local highlight = button:CreateTexture(nil, "HIGHLIGHT")
  highlight:SetAllPoints(icon)
  highlight:SetTexture("Interface\\CHARACTERFRAME\\TempPortraitAlphaMask")
  highlight:SetVertexColor(1, 0.82, 0.25, 0.35)

  button:SetScript("OnClick", function()
    addon:ToggleFrame()
  end)
  button:SetScript("OnDragStart", function(self)
    if InCombatLockdown() then
      addon:Print("战斗中不能移动攻略按钮。")
      return
    end
    self.isMoving = true
    self:StartMoving()
  end)
  button:SetScript("OnDragStop", function(self)
    if not self.isMoving then return end
    self:StopMovingOrSizing()
    self.isMoving = nil
    addon:SaveLauncherPosition(self)
  end)
  button:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    GameTooltip:SetText("MPlusOneLine 攻略")
    GameTooltip:AddLine("左键打开/关闭攻略，拖动移动", 0.8, 0.8, 0.8)
    GameTooltip:Show()
  end)
  button:SetScript("OnLeave", function()
    GameTooltip:Hide()
  end)

  button.icon = icon
  self:RestoreLauncherPosition(button)
  self.launcher = button
  return button
end

local function createSection(parent, title, y)
  local label = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  label:SetPoint("TOPLEFT", 4, y)
  label:SetText(title)
  label:SetTextColor(0.96, 0.78, 0.34)
  return label, y - 24
end

local function createTipRow(parent, groupName, entry, y, entryType)
  local row = CreateFrame("Frame", nil, parent, "BackdropTemplate")
  row:SetSize(FRAME_WIDTH - 52, 60)
  row:SetPoint("TOPLEFT", 4, y)
  row:SetBackdrop({ bgFile = "Interface/Buttons/WHITE8x8" })
  if entryType == "trash" then
    row:SetBackdropColor(0.09, 0.18, 0.18, 0.95)
  else
    row:SetBackdropColor(0.12, 0.15, 0.22, 0.95)
  end

  local name = row:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  name:SetPoint("TOPLEFT", 10, -7)
  name:SetPoint("RIGHT", row, "RIGHT", -112, 0)
  name:SetJustifyH("LEFT")
  name:SetText((entryType == "trash" and "关键小怪 · " or "首领 · ") .. entry.name)
  if entryType == "trash" then
    name:SetTextColor(0.45, 0.88, 0.72)
  else
    name:SetTextColor(0.96, 0.78, 0.34)
  end

  local tip = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  tip:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -3)
  tip:SetPoint("RIGHT", row, "RIGHT", -112, 0)
  tip:SetJustifyH("LEFT")
  tip:SetJustifyV("TOP")
  tip:SetWordWrap(true)
  tip:SetText(entry.tip)

  local sendButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
  sendButton:SetSize(96, 24)
  sendButton:SetPoint("RIGHT", -8, 0)
  sendButton:SetText("发送")
  sendButton:SetScript("OnClick", function()
    addon:SendTip(groupName, entry)
  end)

  return row, y - 66
end

local function createSegment(parent, index, bossName, y)
  local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  label:SetPoint("TOPLEFT", 8, y)
  label:SetText("第" .. index .. "段 · 前置小怪 → " .. bossName)
  label:SetTextColor(0.65, 0.72, 0.88)
  return label, y - 21
end

function addon:BuildRows(content)
  local dungeonRows, raidRows = {}, {}
  local dungeonY = -4
  for _, dungeon in ipairs(self.dungeons or {}) do
    local section
    section, dungeonY = createSection(content, dungeon.name, dungeonY)
    table.insert(dungeonRows, section)
    for index, segment in ipairs(dungeon.segments or {}) do
      local segmentLabel, trashRow, bossRow
      segmentLabel, dungeonY = createSegment(content, index, segment.boss.name, dungeonY)
      table.insert(dungeonRows, segmentLabel)
      trashRow, dungeonY = createTipRow(content, dungeon.name, segment.trash, dungeonY, "trash")
      table.insert(dungeonRows, trashRow)
      bossRow, dungeonY = createTipRow(content, dungeon.name, segment.boss, dungeonY, "boss")
      table.insert(dungeonRows, bossRow)
      dungeonY = dungeonY - 5
    end
    dungeonY = dungeonY - 5
  end

  local raidY = -4
  for _, boss in ipairs(self.raidBosses or {}) do
    local row
    row, raidY = createTipRow(content, self.raid.name, boss, raidY, "boss")
    row:Hide()
    table.insert(raidRows, row)
  end

  content:SetHeight(math.max(-dungeonY + 6, -raidY + 6, 1))
  return dungeonRows, raidRows
end

function addon:GetSupportedInstance()
  local instanceName, instanceType, difficultyID = GetInstanceInfo()
  if instanceType == "party" then
    for _, dungeon in ipairs(self.dungeons or {}) do
      for _, name in ipairs(dungeon.instanceNames or {}) do
        if instanceName == name then return "dungeon", dungeon, difficultyID end
      end
    end
  elseif instanceType == "raid" and self.raid then
    for _, name in ipairs(self.raid.instanceNames) do
      if instanceName == name then
        return "raid", self.raid, difficultyID
      end
    end
  end

  return nil
end

function addon:RefreshRaidContext()
  local instanceType, instance, difficultyID = self:GetSupportedInstance()
  local raid = self.raid
  local recognized = instanceType == "raid"

  local difficulty = recognized and raid.difficulties[difficultyID] or nil
  for _, row in ipairs(self.frame.dungeonRows) do row:SetShown(not recognized or difficulty == nil) end
  for _, row in ipairs(self.frame.raidRows) do row:SetShown(difficulty ~= nil) end

  if recognized and difficulty then
    self.frame.title:SetText(raid.name .. " · " .. ({ LFR = "团队查找器", Normal = "普通", Heroic = "英雄", Mythic = "史诗" })[difficulty])
    self.frame.subtitle:SetText("当前团本已自动识别：滚动预览全部首领，逐条点击发送")
    for index, boss in ipairs(self.raidBosses) do
      self.frame.raidRows[index].tip:SetText(boss.tips[difficulty])
    end
  elseif recognized then
    self.frame.title:SetText(raid.name)
    self.frame.subtitle:SetText("当前团队难度暂不支持，已安全隐藏团本攻略。")
  else
    self.frame.title:SetText("大秘境首领一句话攻略")
    self.frame.subtitle:SetText("按首领段预览：关键小怪与首领均可逐条发送")
  end
end

function addon:ShowFrame()
  local frame = self:CreateFrame()
  frame:Show()
  self:RefreshRaidContext()
end

function addon:AutoOpenSupportedInstance()
  local instanceType, instance = self:GetSupportedInstance()
  if not instanceType then
    self.lastAutoOpenedInstance = nil
    return
  end

  local token = instanceType .. ":" .. instance.name
  if self.lastAutoOpenedInstance == token then return end
  self.lastAutoOpenedInstance = token
  self:ShowFrame()
end

function addon:CreateFrame()
  if self.frame then return self.frame end

  local frame = CreateFrame("Frame", FRAME_NAME, UIParent, "BackdropTemplate")
  frame:SetSize(FRAME_WIDTH, FRAME_HEIGHT)
  frame:SetFrameStrata("DIALOG")
  frame:SetBackdrop({
    bgFile = "Interface/Buttons/WHITE8x8",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    edgeSize = 14,
    insets = { left = 3, right = 3, top = 3, bottom = 3 },
  })
  frame:SetBackdropColor(0.04, 0.05, 0.08, 0.97)
  frame:SetBackdropBorderColor(0.55, 0.36, 0.8, 1)
  frame:SetMovable(true)
  frame:EnableMouse(true)
  frame:RegisterForDrag("LeftButton")
  frame:SetClampedToScreen(true)
  frame:SetScript("OnDragStart", frame.StartMoving)
  frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    addon:SaveFramePosition(self)
  end)

  local title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
  title:SetPoint("TOPLEFT", 16, -16)
  title:SetText("大秘境首领一句话攻略")

  local subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
  subtitle:SetText("按首领段预览：关键小怪与首领均可逐条发送")
  subtitle:SetTextColor(0.65, 0.68, 0.75)

  local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
  closeButton:SetPoint("TOPRIGHT", -4, -4)

  local scroll = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
  scroll:SetPoint("TOPLEFT", 14, -58)
  scroll:SetPoint("BOTTOMRIGHT", -32, 14)
  local content = CreateFrame("Frame", nil, scroll)
  content:SetWidth(FRAME_WIDTH - 52)
  scroll:SetScrollChild(content)

  frame.title = title
  frame.subtitle = subtitle
  frame.dungeonRows, frame.raidRows = self:BuildRows(content)
  self:RestoreFramePosition(frame)
  table.insert(UISpecialFrames, FRAME_NAME)
  self.frame = frame
  self:RefreshRaidContext()
  frame:Hide()
  return frame
end

function addon:ToggleFrame()
  local frame = self:CreateFrame()
  frame:SetShown(not frame:IsShown())
  if frame:IsShown() then self:RefreshRaidContext() end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")
eventFrame:RegisterEvent("UPDATE_INSTANCE_INFO")
eventFrame:SetScript("OnEvent", function(_, event, loadedAddonName)
  if event ~= "ADDON_LOADED" then
    if addon.frame then addon:RefreshRaidContext() end
    addon:AutoOpenSupportedInstance()
    return
  end

  if loadedAddonName ~= addonName then return end

  MPlusOneLineDB = MPlusOneLineDB or {}
  SLASH_MPLUSONELINE1 = "/mplusoneline"
  SLASH_MPLUSONELINE2 = "/mplo"
  SlashCmdList.MPLUSONELINE = function()
    addon:ToggleFrame()
  end
  addon:CreateLauncher()
end)
