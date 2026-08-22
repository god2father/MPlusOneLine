local addonName, addon = ...

local FRAME_NAME = "MPlusOneLineFrame"
local FRAME_WIDTH = 520
local FRAME_HEIGHT = 500

function addon:Print(message)
  DEFAULT_CHAT_FRAME:AddMessage("|cff8b5cf6MPlusOneLine|r: " .. message)
end

function addon:GetChatType()
  if IsInGroup(LE_PARTY_CATEGORY_HOME) then
    return "PARTY"
  end

  if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
    return "INSTANCE_CHAT"
  end

  return nil
end

function addon:SendTip(dungeon)
  if not dungeon or not dungeon.name or not dungeon.tip then
    self:Print("暂未收录该副本攻略。")
    return
  end

  local chatType = self:GetChatType()
  if not chatType then
    self:Print("不在队伍或副本队伍中，无法发送攻略。")
    return
  end

  SendChatMessage("【" .. dungeon.name .. "】" .. dungeon.tip, chatType)
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

local function createDungeonRow(parent, dungeon, index)
  local row = CreateFrame("Frame", nil, parent, "BackdropTemplate")
  row:SetSize(FRAME_WIDTH - 32, 48)
  row:SetPoint("TOPLEFT", parent, "TOPLEFT", 16, -58 - ((index - 1) * 53))
  row:SetBackdrop({ bgFile = "Interface/Buttons/WHITE8x8" })
  row:SetBackdropColor(0.12, 0.15, 0.22, 0.95)

  local name = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
  name:SetPoint("TOPLEFT", 10, -7)
  name:SetText(dungeon.name)
  name:SetTextColor(0.96, 0.78, 0.34)

  local tip = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  tip:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -3)
  tip:SetPoint("RIGHT", row, "RIGHT", -112, 0)
  tip:SetJustifyH("LEFT")
  tip:SetWordWrap(false)
  tip:SetText(dungeon.tip)

  local sendButton = CreateFrame("Button", nil, row, "UIPanelButtonTemplate")
  sendButton:SetSize(96, 24)
  sendButton:SetPoint("RIGHT", -8, 0)
  sendButton:SetText("发送攻略")
  sendButton:SetScript("OnClick", function()
    addon:SendTip(dungeon)
  end)

  return row
end

function addon:CreateFrame()
  if self.frame then
    return self.frame
  end

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
  title:SetText("大秘境一句话攻略")

  local subtitle = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
  subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -4)
  subtitle:SetText("优先发送到队伍；无队伍时发送到副本频道")
  subtitle:SetTextColor(0.65, 0.68, 0.75)

  local closeButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
  closeButton:SetPoint("TOPRIGHT", -4, -4)

  for index, dungeon in ipairs(self.dungeons or {}) do
    createDungeonRow(frame, dungeon, index)
  end

  self:RestoreFramePosition(frame)
  table.insert(UISpecialFrames, FRAME_NAME)
  self.frame = frame
  return frame
end

function addon:ToggleFrame()
  local frame = self:CreateFrame()
  frame:SetShown(not frame:IsShown())
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(_, event, loadedAddonName)
  if event ~= "ADDON_LOADED" or loadedAddonName ~= addonName then
    return
  end

  MPlusOneLineDB = MPlusOneLineDB or {}
  SLASH_MPLUSONELINE1 = "/mplus"
  SlashCmdList.MPLUSONELINE = function()
    addon:ToggleFrame()
  end
end)
