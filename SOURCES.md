# 攻略来源与适用范围

访问日期：2026-08-22。

## 正式服 API 与 TOC 兼容性

[Warcraft Wiki 的当前 TOC 格式说明](https://warcraft.wiki.gg/wiki/.toc)列出 Mainline/《午夜》12.1.0 的 `## Interface: 120100`；[GetInstanceInfo 文档](https://warcraft.wiki.gg/wiki/API_GetInstanceInfo)确认该 API 返回实例名称、类型与难度 ID，12.0.7 仅在末尾新增返回值。插件据此使用前三个返回值，并监听正式服通用的区域/难度/实例更新事件。此为源码接口核验，不等同于本机游戏内实测。

## 赛季副本池（官方）

《午夜》S2 的副本池以暴雪 [The Shadows Deepen: Midnight Season 2 Begins](https://worldofwarcraft.blizzard.com/en-us/news/24294369/the-shadows-deepen-midnight-season-2-begins-19-august) 为准：蛇牙祭坛、谋杀街、纳洛拉克巢穴、盲谷、虚痕竞技场、王者之眠、塞塔里斯神庙、红玉新生法池。该公告用于确认赛季与副本名单；它不提供逐本打法。

## 一句话攻略（第三方专业资料）

以下文本由公开攻略自行中文归纳，不复制原文。所有副本均应随热修与数值调整复核；插件不在游戏内联网。

### 蛇牙祭坛

<!-- source-id: icy-altar-of-fangs -->
[Icy Veins：Altar of Fangs Dungeon Guide](https://www.icy-veins.com/wow/altar-of-fangs-dungeon-guide)（2026-08-22 访问；2026-08 S2 更新）：用于核验关键打断、盘蛇全员断法与尾王吃线/毒层处理。

### 谋杀街

<!-- source-id: icy-murder-row -->
[Icy Veins：Murder Row Dungeon Guide](https://www.icy-veins.com/wow/murder-row-dungeon-guide)（2026-08-22 访问；2026-08 S2 更新）：用于核验邪能飞弹、心停毒、货桶掩护与易爆桶处理。

### 纳洛拉克巢穴

<!-- source-id: icy-den-of-nalorakk -->
[Icy Veins：Den of Nalorakk Dungeon Guide](https://www.icy-veins.com/wow/den-of-nalorakk-dungeon-guide)（2026-08-22 访问；2026-08 S2 更新）：用于核验治疗之风、蘑菇分摊、锤击摆位与熊影阻拦。

### 盲谷

<!-- source-id: icy-blinding-vale -->
[Icy Veins：The Blinding Vale Dungeon Guide](https://www.icy-veins.com/wow/blinding-vale-dungeon-guide)（2026-08-22 访问；2026-08 S2 更新）：用于核验光箭齐射打断、唤醒怪群风险与 50% 治疗压力。

### 虚痕竞技场

<!-- source-id: icy-voidscar-arena -->
[Icy Veins：Voidscar Arena Dungeon Guide](https://www.icy-veins.com/wow/voidscar-arena-dungeon-guide)（2026-08-22 访问；2026-08 S2 更新）：用于核验右路增益、点名地板管理与黑花躲球。

### 王者之眠

<!-- source-id: icy-kings-rest -->
[Icy Veins：King's Rest Dungeon Guide](https://www.icy-veins.com/wow/kings-rest-dungeon-guide)（2026-08-22 访问；2026-08 S2 更新）：用于核验暗影束缚的控制/驱散优先级；当前版本的完整打断表可再参照该页。

### 塞塔里斯神庙

<!-- source-id: wowhead-temple-of-sethraliss -->
[Wowhead：Temple of Sethraliss Dungeon Overview](https://www.wowhead.com/de/guide/midnight/temple-of-sethraliss-dungeon-overview-mythic-plus)（2026-08-22 访问；12.1/S2 概览）：用于核验双首领的风暴祝福与护盾切换。该页明确标注当前 M+ 速查仍在补充，因此本插件只保留这个已核验重点，不沿用旧版本路线或完整打法。

### 红玉新生法池

<!-- source-id: wowhead-ruby-life-pools -->
[Wowhead：Ruby Life Pools Dungeon Overview](https://www.wowhead.com/guide/midnight/ruby-life-pools-dungeon-overview-mythic-plus)（2026-08-22 访问；12.1/S2 概览）：用于核验一王冰雹/碎冰/破盾、二王火元素与尾王优先处理落地龙。

## 团队副本：毒液深渊（官方范围）

暴雪 [Curse of Ula'tek WoWCast 公告](https://worldofwarcraft.blizzard.com/en-us/news/24280285)确认《毒液深渊》为《午夜》S2 的 8 首领团本；[赛季公告](https://worldofwarcraft.blizzard.com/en-us/news/24294369/the-shadows-deepen-midnight-season-2-begins-19-august)确认团队查找器、普通、英雄与史诗开放。下列每首领页用于归纳四个支持难度：随机团队只保留共同核心机制；普通/英雄/史诗按页面的难度章节补充差异，非原文转载。

严格审计说明：8 位首领名称与四种可用难度由上述官方/当前团本总览逐条核验。提示分为三类：**已核验共通机制**（专业攻略与当前游戏资料可相互印证）、**社区交叉验证经验**（仅在近期多源一致时采用；本次没有采用任何一项）和**通用安全提醒**（资料不足时的非空、无机制断言提示）。下列文本不会把“伤害更高/目标更多”写成机制差异；若没有可独立核验的难度差异，四个难度会故意显示相同的共通机制或安全提醒。

### 毒液深渊：奈克扎利，缚魂者

<!-- source-id: icy-nekzali -->
[Icy Veins：毒液深渊总览](https://www.icy-veins.com/wow/venomous-abyss-raid-guide)（2026-08-22 访问；S2 当前总览）：明确其为两阶段、以小怪管理为主的战斗；四难度只保留这一共通点。

### 毒液深渊：墓葬哨兵

<!-- source-id: icy-entombed-sentinels -->
[Icy Veins：Entombed Sentinels Raid Guide](https://www.icy-veins.com/wow/entombed-sentinels-raid-guide)（2026-08-22 访问；含普通/英雄/史诗章节）：用于双首领分组与控血；随机团队没有独立可靠差异资料，四难度只显示共通机制。

### 毒液深渊：失落的探险家

<!-- source-id: icy-lost-explorers -->
[Icy Veins：Lost Explorers Raid Guide](https://www.icy-veins.com/wow/lost-explorers-raid-guide)（2026-08-22 访问；含普通/英雄/史诗章节）：用于三首领不全叠、冰火打断和喂鱼；四难度只显示这些共通机制。

### 毒液深渊：瓦什尼克，恶性者

<!-- source-id: icy-vashnik -->
[Icy Veins：毒液深渊总览](https://www.icy-veins.com/wow/venomous-abyss-raid-guide)（2026-08-22 访问；S2 当前总览）：用于首领摆位决定强化池顺序；四难度未宣称未核验差异。

### 毒液深渊：斯佐拉克

<!-- source-id: icy-sszorak -->
[Icy Veins：Sszorak Raid Guide](https://www.icy-veins.com/wow/sszorak-raid-guide)（2026-08-22 访问；含普通/英雄/史诗章节）：用于前方、分摊、毒囊与转场；随机团队没有独立可靠差异资料，四难度只显示共通机制。

### 毒液深渊：双牙

<!-- source-id: method-twin-fangs -->
[Method：The Twin Fangs Heroic Boss Guide](https://www.method.gg/guides/the-venomous-abyss/the-twin-fangs-heroic)（2026-08-22 访问；2026-08-14 更新；专业攻略）：核验永恒毒液叠层、优先处理三只蛇形小怪及石破必须有人承受。该页为英雄难度；插件对其余难度只复用同一条已核验的共通机制，不声称额外差异。

补充交叉核验：[Warcraft Wiki：The Twin Fangs](https://warcraft.wiki.gg/wiki/The_Twin_Fangs)（2026-08-22 访问；当前冒险指南资料）同样列出 Eternal Venom、Venomous Emergence 小怪与 Stone Breaker 的承受要求。

### 毒液深渊：盘绕祭坛

<!-- source-id: method-index-coiled-altar -->
[Method：Midnight Raid Boss Guides](https://www.method.gg/guides)（2026-08-22 访问；当前索引）列出盘绕祭坛的 S2 攻略入口，但本轮无法从可访问内容取得足以交叉验证的具体机制；四难度均显示**通用安全提醒**，不把它当作首领机制说明。

### 毒液深渊：乌拉泰克

<!-- source-id: method-index-ulatek -->
[Method：Midnight Raid Boss Guides](https://www.method.gg/guides)（2026-08-22 访问；当前索引）列出乌拉泰克的 S2 攻略入口，但本轮无法从可访问内容取得足以交叉验证的具体机制；四难度均显示**通用安全提醒**，不把它当作首领机制说明。

#### 社区检索结论（未采用）

- [r/wow：Raidstrats.gg 团本英雄难度攻略发布帖](https://www.reddit.com/r/wow/comments/1v6436d/raidstratsgg_the_venomus_abyss_hc_guides_now/)（2026-08-22 访问；帖文约 4 天前；**社区经验、非官方**）：发帖者称内容基于 PTR 与 Consequence 公会测试，列出了盘绕祭坛链接，但同时说明乌拉泰克仍在制作。它仅能作为“有社区攻略”的线索，不能单独证明实时服机制，因此未写入任何具体提示。

本轮没有找到两个独立、近期且相互一致的社区实战结论来补足盘绕祭坛或乌拉泰克，因此没有采用“社区交叉验证经验”。后续若有当前正式服的公开专业攻略或多源一致的实战资料，再单独复核。
