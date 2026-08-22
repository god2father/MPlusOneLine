#!/usr/bin/env sh
set -eu

addon_dir="MPlusOneLine"

test -f "$addon_dir/MPlusOneLine.toc"
test -f "$addon_dir/Data.lua"
test -f "$addon_dir/Core.lua"
test "$(rg -c 'name = ' "$addon_dir/Data.lua")" = "8"
test "$(rg -c 'tip = ' "$addon_dir/Data.lua")" = "8"
rg -q '^Data.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q '^Core.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q 'SLASH_MPLUSONELINE1 = "/mplus"' "$addon_dir/Core.lua"
rg -q 'SendChatMessage' "$addon_dir/Core.lua"
rg -q 'MPlusOneLineDB' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_HOME' "$addon_dir/Core.lua"
rg -q 'LE_PARTY_CATEGORY_INSTANCE' "$addon_dir/Core.lua"

echo "Addon static checks passed"
