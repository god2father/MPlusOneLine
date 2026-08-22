# MPlusOneLine

`MPlusOneLine` 是一个《魔兽世界》正式服插件：在游戏内展示当前赛季大秘境的一句话中文攻略，并支持一键发送给队友。

## 当前收录

- 蛇牙祭坛
- 谋杀街
- 纳洛拉克巢穴
- 盲谷
- 虚痕竞技场
- 王者之眠
- 塞塔里斯神庙
- 红玉新生法池

攻略完全内置，不会在游戏内联网或同步第三方内容。它适合开钥匙前快速统一重点，不替代详细路线、计时器或战斗提示插件。每条提示均为对公开攻略的中文短句归纳，不是原文转载；赛季副本池与逐本攻略来源见 [SOURCES.md](SOURCES.md)。

## 安装

将 [`MPlusOneLine`](MPlusOneLine) 文件夹复制到：

```text
World of Warcraft/_retail_/Interface/AddOns/
```

在角色选择界面启用插件。详细步骤见 [插件安装说明](MPlusOneLine/README.md)。

## 使用

输入 `/mplusoneline` 打开或关闭面板；短别名为 `/mplo`。插件不会注册 `/mplus`，避免与其他插件冲突。进入已收录的团队副本时，面板会自动显示当前难度下每个首领的一句话提示；每个卡片都可单独发送到队伍频道。

## 更新赛季数据

编辑 [`MPlusOneLine/Data.lua`](MPlusOneLine/Data.lua) 中的 `addon.dungeons`。界面和聊天逻辑不需要随副本池一起修改。

## 本地检查

```sh
sh tests/check_addon.sh
```

## 正式服 12.1.0 兼容性

本版本的 TOC 为 `## Interface: 120100`，对应当前《午夜》12.1.0 正式服。团本自动识别只使用正式服仍支持的 `GetInstanceInfo()` 以及 `PLAYER_ENTERING_WORLD`、`ZONE_CHANGED_NEW_AREA`、`PLAYER_DIFFICULTY_CHANGED`、`UPDATE_INSTANCE_INFO` 事件。

源码与接口版本已核验，但本机没有可启动的 `_retail_` 客户端，因此尚未进行游戏内加载测试。请在最新版正式服安装后执行以下最终验证：

1. 在聊天栏输入 `/dump (select(4, GetBuildInfo()))`，确认输出为 `120100`。
2. 输入 `/mplusoneline`，确认面板出现且没有 Lua 报错。
3. 进入/离开毒液深渊，并切换团队查找器、普通、英雄或史诗难度，确认面板会刷新为对应首领提示。
