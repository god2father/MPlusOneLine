#!/usr/bin/env sh
set -eu

addon_dir="MPlusOneLine"
sources_file="SOURCES.md"

test -f "$addon_dir/MPlusOneLine.toc"
rg -q '^## Interface: 120100$' "$addon_dir/MPlusOneLine.toc"
test -f "$addon_dir/Data.lua"
test -f "$addon_dir/Core.lua"
test "$(rg -o 'name = ' "$addon_dir/Data.lua" | wc -l | tr -d ' ')" = "73"
test "$(rg -F -c 'segments = {' "$addon_dir/Data.lua")" = "8"
test "$(rg -F -c 'instanceNames = {' "$addon_dir/Data.lua")" = "9"
test "$(rg -F -c 'trash = {' "$addon_dir/Data.lua")" = "28"
test "$(rg -F -c 'boss = {' "$addon_dir/Data.lua")" = "28"
test "$(rg -o 'tip = ' "$addon_dir/Data.lua" | wc -l | tr -d ' ')" = "56"
test "$(rg -o 'source = ' "$addon_dir/Data.lua" | wc -l | tr -d ' ')" = "64"
test "$(rg -o 'tip = \"[^\"]+\"' "$addon_dir/Data.lua" | wc -l | tr -d ' ')" = "56"
! rg -q 'tip = ""' "$addon_dir/Data.lua"
test "$(rg -c 'raidBosses' "$addon_dir/Data.lua")" = "1"
test "$(rg -c 'LFR = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'Normal = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'Heroic = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'Mythic = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -o '(LFR|Normal|Heroic|Mythic) = \"[^\"]+\"' "$addon_dir/Data.lua" | wc -l | tr -d ' ')" = "32"
! rg -q '(LFR|Normal|Heroic|Mythic) = ""' "$addon_dir/Data.lua"
! rg -q '标记|冒险指南|团队预警|参考攻略|听指挥|通用安全提醒' "$addon_dir/Data.lua"
rg -q '永恒毒液' "$addon_dir/Data.lua"
rg -q '盛宴分摊清层' "$addon_dir/Data.lua"
rg -q '灵魂绑定后两者同步击杀' "$addon_dir/Data.lua"
rg -q '别让毒液触碰幼体孵化' "$addon_dir/Data.lua"
rg -q '已核验' "$addon_dir/Data.lua"
rg -q '^Data.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q '^Core.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q 'SLASH_MPLUSONELINE1 = "/mplusoneline"' "$addon_dir/Core.lua"
rg -q 'SLASH_MPLUSONELINE2 = "/mplo"' "$addon_dir/Core.lua"
! rg -q 'SLASH_MPLUSONELINE[0-9]* = "/mplus"' "$addon_dir/Core.lua"
rg -q 'SendChatMessage' "$addon_dir/Core.lua"
rg -q 'BuildRows' "$addon_dir/Core.lua"
rg -q 'UIPanelScrollFrameTemplate' "$addon_dir/Core.lua"
rg -q 'createTipRow' "$addon_dir/Core.lua"
rg -q 'createSegment' "$addon_dir/Core.lua"
rg -F -q '关键小怪 · ' "$addon_dir/Core.lua"
rg -F -q '第" .. index .. "段 · 前置小怪 → "' "$addon_dir/Core.lua"
rg -F -q 'SetWordWrap(true)' "$addon_dir/Core.lua"
rg -q '按首领段预览' "$addon_dir/Core.lua"
rg -F -q 'addon:SendTip(groupName, entry)' "$addon_dir/Core.lua"
rg -q 'CreateLauncher' "$addon_dir/Core.lua"
rg -q 'SaveLauncherPosition' "$addon_dir/Core.lua"
rg -q 'RestoreLauncherPosition' "$addon_dir/Core.lua"
rg -q 'launcherPoint' "$addon_dir/Core.lua"
rg -q '战斗中不能移动攻略按钮' "$addon_dir/Core.lua"
test -f "$addon_dir/assets/cat-button.tga"
rg -F -q 'Interface\\AddOns\\MPlusOneLine\\assets\\cat-button.tga' "$addon_dir/Core.lua"
! rg -F -q 'Ability_Hunter_Pet_Cat' "$addon_dir/Core.lua"
! rg -F -q 'cat-button.png' "$addon_dir/Core.lua"
rg -F -q 'TempPortraitAlphaMask' "$addon_dir/Core.lua"
rg -F -q 'icon:AddMaskTexture(mask)' "$addon_dir/Core.lua"
rg -F -q '左键打开/关闭攻略，拖动移动' "$addon_dir/Core.lua"
rg -F -q 'addon:ToggleFrame()' "$addon_dir/Core.lua"
rg -q 'MPlusOneLineDB' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_HOME' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_INSTANCE' "$addon_dir/Core.lua"
rg -q 'GetInstanceInfo' "$addon_dir/Core.lua"
rg -q 'GetSupportedInstance' "$addon_dir/Core.lua"
rg -q 'AutoOpenSupportedInstance' "$addon_dir/Core.lua"
rg -q 'lastAutoOpenedInstance' "$addon_dir/Core.lua"
rg -F -q 'instanceType == "party"' "$addon_dir/Core.lua"
rg -F -q 'addon:AutoOpenSupportedInstance()' "$addon_dir/Core.lua"
rg -F -q 'frame:Hide()' "$addon_dir/Core.lua"
rg -q 'PLAYER_DIFFICULTY_CHANGED' "$addon_dir/Core.lua"
rg -q 'UPDATE_INSTANCE_INFO' "$addon_dir/Core.lua"
rg -q 'ZONE_CHANGED_NEW_AREA' "$addon_dir/Core.lua"
rg -q 'raidBosses' "$addon_dir/Core.lua"
test -f "$sources_file"
rg -q 'worldofwarcraft.blizzard.com' "$sources_file"
test "$(rg -c '^### ' "$sources_file")" = "16"
test "$(rg -c 'https://www\.' "$sources_file")" -ge "16"
test "$(rg -c '<!-- source-id:' "$sources_file")" = "16"
test "$(rg -c '^### 毒液深渊：' "$sources_file")" = "8"
rg -q 'Method：The Twin Fangs Heroic Boss Guide' "$sources_file"
rg -q '中文社区/视频补充审计' "$sources_file"
rg -q '抖音精选' "$sources_file"
rg -q 'Wowhead：The Coiled Altar' "$sources_file"
rg -F -q "Wowhead：Ula'tek" "$sources_file"
rg -q '社区经验、非官方' "$sources_file"
rg -q 'GetBuildInfo' README.md
rg -q '120100' README.md
rg -q '小猫图标' README.md

while IFS= read -r dungeon_name; do
  rg -F -q "$dungeon_name" "$sources_file"
done <<EOF
蛇牙祭坛
谋杀街
纳洛拉克巢穴
盲谷
虚痕竞技场
王者之眠
塞塔里斯神庙
红玉新生法池
EOF

while IFS= read -r source_id; do
  rg -F -q "<!-- source-id: $source_id -->" "$sources_file"
done <<EOF
icy-altar-of-fangs
icy-murder-row
icy-den-of-nalorakk
icy-blinding-vale
icy-voidscar-arena
icy-kings-rest
wowhead-temple-of-sethraliss
wowhead-ruby-life-pools
wowhead-nekzali-community
icy-entombed-sentinels
icy-lost-explorers
wowhead-vashnik-community
icy-sszorak
wowhead-twin-fangs-community
wowhead-coiled-altar
wowhead-ulatek
EOF

echo "Addon static checks passed"
