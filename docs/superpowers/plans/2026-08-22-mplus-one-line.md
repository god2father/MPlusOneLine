# MPlusOneLine Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 构建一个可安装到正式服的离线大秘境一句话攻略插件，并发布至新的公开 GitHub 仓库。

**Architecture:** `MPlusOneLine` 目录是可直接复制到 `Interface/AddOns` 的插件根目录。`Data.lua` 仅保存副本攻略，`Core.lua` 负责 SavedVariables、界面、命令和聊天频道回退；所有内容通过 TOC 按确定顺序加载。

**Tech Stack:** World of Warcraft Retail AddOn API、Lua、TOC、Markdown、Git、GitHub CLI。

---

## File structure

- `MPlusOneLine/MPlusOneLine.toc`：正式服加载清单与 SavedVariables 声明。
- `MPlusOneLine/Data.lua`：8 个副本的可维护离线攻略数据。
- `MPlusOneLine/Core.lua`：面板、`/mplus`、位置保存和聊天发送。
- `MPlusOneLine/README.md`：安装和使用说明。
- `README.md`：仓库总览及数据更新方式。
- `.gitignore`：忽略可视化讨论临时文件和 macOS 元数据。

### Task 1: 建立独立仓库与插件清单

**Files:**
- Create: `.gitignore`
- Create: `MPlusOneLine/MPlusOneLine.toc`

- [ ] **Step 1: 初始化当前目录为独立 Git 仓库**

Run: `git init -b main`

Expected: 输出 `Initialized empty Git repository`，且 `git rev-parse --show-toplevel` 输出 `/Users/congt/Documents/wow插件`。

- [ ] **Step 2: 创建忽略规则**

```gitignore
.DS_Store
.superpowers/
```

- [ ] **Step 3: 创建 TOC**

```toc
## Interface: 120100
## Title: MPlusOneLine
## Notes: 当前赛季大秘境一句话攻略
## Author: congt
## Version: 0.1.0
## SavedVariables: MPlusOneLineDB

Data.lua
Core.lua
```

- [ ] **Step 4: 检查 TOC 引用的文件将按顺序加载**

Run: `sed -n '1,80p' MPlusOneLine/MPlusOneLine.toc`

Expected: 显示 `Data.lua` 在 `Core.lua` 之前。

### Task 2: 添加可维护的一句话攻略数据

**Files:**
- Create: `MPlusOneLine/Data.lua`

- [ ] **Step 1: 写入数据模块**

```lua
local addonName, addon = ...

addon.dungeons = {
  { name = "蛇牙祭坛", tip = "小怪优先断毒雾并集火祭司；首领点名立刻分散，转阶段留爆发和保命。" },
  { name = "谋杀街", tip = "每波注意断视野，点名带离人群；二王留位移躲冲锋，尾王先处理召唤物。" },
  { name = "纳洛拉克巢穴", tip = "拉稳仇恨后再开爆发；地面技能及时横移，首领狂暴前预留减伤和治疗大招。" },
  { name = "盲谷", tip = "远程优先打断施法怪，转火别贪；迷雾阶段跟紧队伍，首领点名先保命再输出。" },
  { name = "虚痕竞技场", tip = "小怪分批处理并打断高伤读条；场地技能沿边走，首领连招时全队留位移和减伤。" },
  { name = "王者之眠", tip = "优先断巫医与图腾，拉怪别超出治疗距离；祖尔阶段分散站，点名后迅速离开人群。" },
  { name = "塞塔里斯神庙", tip = "蛇人读条必须轮流打断，沙尘技能横移躲开；净化阶段优先完成目标再转火。" },
  { name = "红玉新生法池", tip = "小龙阶段先处理高优先级法术；二王注意分散与驱散，尾王点名远离队友并留爆发。" },
}
```

- [ ] **Step 2: 检查副本数量与字段完整性**

Run: `rg -c 'name = ' MPlusOneLine/Data.lua && rg -n 'name =|tip =' MPlusOneLine/Data.lua`

Expected: 第一条命令输出 `8`；每条记录同时含有 `name` 和 `tip`。

### Task 3: 先写可脱离客户端校验的静态检查

**Files:**
- Create: `tests/check_addon.sh`

- [ ] **Step 1: 写入检查脚本**

```sh
#!/usr/bin/env sh
set -eu

addon_dir="MPlusOneLine"
test -f "$addon_dir/MPlusOneLine.toc"
test -f "$addon_dir/Data.lua"
test -f "$addon_dir/Core.lua"
test "$(rg -c 'name = ' "$addon_dir/Data.lua")" = "8"
rg -q '^Data.lua$' "$addon_dir/MPlusOneLine.toc"
rg -q '^Core.lua$' "$addon_dir/MPlusOneLine.toc"
echo "Addon static checks passed"
```

- [ ] **Step 2: 运行检查并确认尚未通过**

Run: `sh tests/check_addon.sh`

Expected: 因 `Core.lua` 尚不存在而失败。

### Task 4: 实现界面、命令、位置保存和聊天发送

**Files:**
- Create: `MPlusOneLine/Core.lua`
- Modify: `tests/check_addon.sh`

- [ ] **Step 1: 创建主模块**

实现以下确定接口：`addon:Print(message)` 使用默认聊天框提示；`addon:GetChatType()` 依次返回 `PARTY`、`INSTANCE_CHAT` 或 `nil`；`addon:SendTip(dungeon)` 调用 `SendChatMessage`；`addon:CreateFrame()` 创建可拖动面板，并为每条数据创建“发送攻略”按钮；`SLASH_MPLUSONELINE1 = "/mplus"` 切换面板显示。

```lua
local addonName, addon = ...

local function getChatType()
  if IsInGroup(LE_PARTY_CATEGORY_HOME) then return "PARTY" end
  if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then return "INSTANCE_CHAT" end
  return nil
end

function addon:SendTip(dungeon)
  local chatType = getChatType()
  if not chatType then
    self:Print("不在队伍或副本队伍中，无法发送攻略。")
    return
  end
  SendChatMessage("【" .. dungeon.name .. "】" .. dungeon.tip, chatType)
end
```

面板关闭时保存 `MPlusOneLineDB.point`、`relativePoint`、`x`、`y`；创建时读取并恢复这些值。缺少数据时按钮显示“暂未收录该副本攻略”，不调用 `SendChatMessage`。

- [ ] **Step 2: 扩展静态检查以覆盖功能锚点**

在 `tests/check_addon.sh` 的 `Core.lua` 文件存在检查之后加入：

```sh
rg -q 'SLASH_MPLUSONELINE1 = "/mplus"' "$addon_dir/Core.lua"
rg -q 'SendChatMessage' "$addon_dir/Core.lua"
rg -q 'MPlusOneLineDB' "$addon_dir/Core.lua"
rg -q 'INSTANCE_CHAT' "$addon_dir/Core.lua"
```

- [ ] **Step 3: 运行静态检查**

Run: `sh tests/check_addon.sh`

Expected: 输出 `Addon static checks passed`。

### Task 5: 补充玩家文档与发布准备

**Files:**
- Create: `MPlusOneLine/README.md`
- Create: `README.md`

- [ ] **Step 1: 编写插件安装说明**

`MPlusOneLine/README.md` 必须说明：将 `MPlusOneLine` 文件夹复制到 `World of Warcraft/_retail_/Interface/AddOns/`；角色选择界面启用插件；游戏中输入 `/mplus`；发送按钮按队伍、再副本频道的顺序选择。

- [ ] **Step 2: 编写仓库 README**

`README.md` 必须说明插件目标、当前 8 个副本、离线数据限制、安装路径、使用命令和赛季更新时修改 `MPlusOneLine/Data.lua`。

- [ ] **Step 3: 检查文档链接与文件清单**

Run: `rg -n '/mplus|Interface/AddOns|Data.lua' README.md MPlusOneLine/README.md && find MPlusOneLine -maxdepth 1 -type f | sort`

Expected: 两份文档均可找到使用或安装信息，插件目录含 TOC、Data.lua、Core.lua、README.md。

### Task 6: 校验、提交并发布公开仓库

**Files:**
- Modify: 所有上述新增文件，仅在校验发现问题时修复。

- [ ] **Step 1: 运行完整静态检查与 Lua 语法检查**

Run: `sh tests/check_addon.sh && (command -v luac >/dev/null && luac -p MPlusOneLine/Data.lua MPlusOneLine/Core.lua || true)`

Expected: 静态检查通过；若本机未安装 `luac`，命令不会将其误报为通过的 Lua 编译验证。

- [ ] **Step 2: 检查待提交范围**

Run: `git status --short`

Expected: 只列出本工作区的插件、文档、测试和 `.gitignore` 文件；不应列出 `.superpowers/`。

- [ ] **Step 3: 创建首个提交**

Run: `git add .gitignore README.md MPlusOneLine tests docs && git commit -m "feat: add mythic plus one-line guide addon"`

Expected: Git 输出一个包含插件、文档和检查脚本的提交。

- [ ] **Step 4: 创建并推送公开 GitHub 仓库**

Run: `gh repo create MPlusOneLine --public --source=. --remote=origin --push`

Expected: GitHub CLI 输出仓库 URL，`git remote -v` 显示 `origin`，且 `git status --short` 为空。
