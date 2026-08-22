#!/usr/bin/env sh
set -eu

addon_dir="MPlusOneLine"
sources_file="SOURCES.md"

test -f "$addon_dir/MPlusOneLine.toc"
test -f "$addon_dir/Data.lua"
test -f "$addon_dir/Core.lua"
test "$(rg -c 'name = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'tip = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'source = ' "$addon_dir/Data.lua")" = "8"
rg -q '^Data.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q '^Core.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q 'SLASH_MPLUSONELINE1 = "/mplus"' "$addon_dir/Core.lua"
rg -q 'SendChatMessage' "$addon_dir/Core.lua"
rg -q 'MPlusOneLineDB' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_HOME' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_INSTANCE' "$addon_dir/Core.lua"
test -f "$sources_file"
rg -q 'worldofwarcraft.blizzard.com' "$sources_file"
test "$(rg -c '^### ' "$sources_file")" = "8"
test "$(rg -c 'https://www\.' "$sources_file")" -ge "8"
test "$(rg -c '<!-- source-id:' "$sources_file")" = "8"

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
EOF

echo "Addon static checks passed"
