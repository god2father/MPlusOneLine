#!/usr/bin/env sh
set -eu

addon_dir="MPlusOneLine"
sources_file="SOURCES.md"

test -f "$addon_dir/MPlusOneLine.toc"
rg -q '^## Interface: 120100$' "$addon_dir/MPlusOneLine.toc"
test -f "$addon_dir/Data.lua"
test -f "$addon_dir/Core.lua"
test "$(rg -c 'name = ' "$addon_dir/Data.lua")" = "17"
test "$(rg -c 'tip = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'source = ' "$addon_dir/Data.lua")" = "16"
test "$(rg -c 'raidBosses' "$addon_dir/Data.lua")" = "1"
test "$(rg -c 'LFR = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'Normal = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'Heroic = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'Mythic = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -o '(LFR|Normal|Heroic|Mythic) = \"[^\"]+\"' "$addon_dir/Data.lua" | wc -l | tr -d ' ')" = "32"
! rg -q '(LFR|Normal|Heroic|Mythic) = ""' "$addon_dir/Data.lua"
rg -q '永恒毒液' "$addon_dir/Data.lua"
rg -q '通用安全提醒：先按团队标记站位' "$addon_dir/Data.lua"
rg -q '^Data.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q '^Core.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q 'SLASH_MPLUSONELINE1 = "/mplusoneline"' "$addon_dir/Core.lua"
rg -q 'SLASH_MPLUSONELINE2 = "/mplo"' "$addon_dir/Core.lua"
! rg -q 'SLASH_MPLUSONELINE[0-9]* = "/mplus"' "$addon_dir/Core.lua"
rg -q 'SendChatMessage' "$addon_dir/Core.lua"
rg -q 'MPlusOneLineDB' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_HOME' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_INSTANCE' "$addon_dir/Core.lua"
rg -q 'GetInstanceInfo' "$addon_dir/Core.lua"
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
rg -q '社区检索结论（未采用）' "$sources_file"
rg -q '社区经验、非官方' "$sources_file"
rg -q 'GetBuildInfo' README.md
rg -q '120100' README.md

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
icy-nekzali
icy-entombed-sentinels
icy-lost-explorers
icy-vashnik
icy-sszorak
method-twin-fangs
method-index-coiled-altar
method-index-ulatek
EOF

echo "Addon static checks passed"
