# 攻略来源与适用范围

访问日期：2026-08-22。

## 正式服 API 与 TOC 兼容性

[Warcraft Wiki 的当前 TOC 格式说明](https://warcraft.wiki.gg/wiki/.toc)列出 Mainline/《午夜》12.1.0 的 `## Interface: 120100`；[GetInstanceInfo 文档](https://warcraft.wiki.gg/wiki/API_GetInstanceInfo)确认该 API 返回实例名称、类型与难度 ID，12.0.7 仅在末尾新增返回值。插件据此使用前三个返回值，并监听正式服通用的区域/难度/实例更新事件。此为源码接口核验，不等同于本机游戏内实测。

## 赛季副本池（官方）

《午夜》S2 的副本池以暴雪 [The Shadows Deepen: Midnight Season 2 Begins](https://worldofwarcraft.blizzard.com/en-us/news/24294369/the-shadows-deepen-midnight-season-2-begins-19-august) 为准：蛇牙祭坛、谋杀街、纳洛拉克巢穴、盲谷、虚痕竞技场、王者之眠、塞塔里斯神庙、红玉新生法池。该公告用于确认赛季与副本名单；它不提供逐本打法。

## 一句话攻略（第三方专业资料）

以下文本由公开攻略自行中文归纳，不复制原文。所有副本均应随热修与数值调整复核；插件不在游戏内联网。

大秘境审计说明：面板按推进顺序显示连续的“首领段”——进入本段后的关键小怪提示，紧接该段首领提示。每个副本页均会列出值得处理的前置小怪；插件只收录确会造成团灭、治疗压力或路线阻塞的读条、前方、护盾、图腾、点名与事件，不罗列普通怪。28 条小怪提示与 28 条首领提示均继承下方对应副本的 `source-id`；文本为中文压缩归纳，能各自单独发送，不复制攻略原文。

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

补充：[Wowhead：First Look at New Temple of Sethraliss in Mythic+ Season 2](https://www.wowhead.com/news/first-look-at-new-temple-of-sethraliss-in-mythic-season-2-382156)（2026-08-22 访问；12.1/S2 改版说明）：用于核验火花引导者会关闭电球迷宫，以及电球守望者/神庙扰乱者的精华扰乱事件。其余沿用机制仅在与现行概览一致时保留为短提示。

### 红玉新生法池

<!-- source-id: wowhead-ruby-life-pools -->
[Wowhead：Ruby Life Pools Dungeon Overview](https://www.wowhead.com/guide/midnight/ruby-life-pools-dungeon-overview-mythic-plus)（2026-08-22 访问；12.1/S2 概览）：用于核验一王冰雹/碎冰/破盾、二王火元素与尾王优先处理落地龙。

补充：[Wowhead：First Look at New Ruby Life Pools in Mythic+ Season 2](https://www.wowhead.com/news/first-look-at-new-ruby-life-pools-in-mythic-season-2-382213)（2026-08-22 访问；12.1/S2 改版说明）：用于核验一王门前有必经迷你首领、二王前火元素副官调整，以及尾王路不再有额外关键打断清单。

## 团队副本：毒液深渊（官方范围）

暴雪 [Curse of Ula'tek WoWCast 公告](https://worldofwarcraft.blizzard.com/en-us/news/24280285)确认《毒液深渊》为《午夜》S2 的 8 首领团本；[赛季公告](https://worldofwarcraft.blizzard.com/en-us/news/24294369/the-shadows-deepen-midnight-season-2-begins-19-august)确认团队查找器、普通、英雄与史诗开放。下列每首领页用于归纳四个支持难度：随机团队只保留共同核心机制；普通/英雄/史诗按页面的难度章节补充差异，非原文转载。

严格审计说明：8 位首领名称与四种可用难度由上述官方/当前团本总览逐条核验。提示优先采用**已核验共通机制**；中文社区/视频只能作为与专业攻略一致时的实战佐证，不能单独确立机制。下列文本不会把“伤害更高/目标更多”写成机制差异；若没有可独立核验的难度差异，四个难度会故意显示相同的已核验共通动作。

### 毒液深渊：奈克扎利，缚魂者

<!-- source-id: wowhead-nekzali-community -->
[Wowhead：Nek'zali Boss Guide](https://www.wowhead.com/guide/midnight/raids/venomous-abyss-nekzali-the-soulcoiler-boss-strategy-abilities)（2026-08-22 访问；12.1 当前首领页）：用于盘魂之井、小怪进井与苏醒回响连接的操作提示。下方中文视频仅作当前实战佐证。

### 毒液深渊：墓葬哨兵

<!-- source-id: icy-entombed-sentinels -->
[Icy Veins：Entombed Sentinels Raid Guide](https://www.icy-veins.com/wow/entombed-sentinels-raid-guide)（2026-08-22 访问；含普通/英雄/史诗章节）：用于双首领分组与控血；随机团队没有独立可靠差异资料，四难度只显示共通机制。

### 毒液深渊：失落的探险家

<!-- source-id: icy-lost-explorers -->
[Icy Veins：Lost Explorers Raid Guide](https://www.icy-veins.com/wow/lost-explorers-raid-guide)（2026-08-22 访问；含普通/英雄/史诗章节）：用于三首领不全叠、冰火打断和喂鱼；四难度只显示这些共通机制。

### 毒液深渊：瓦什尼克，恶性者

<!-- source-id: wowhead-vashnik-community -->
[Wowhead：Vashnik Boss Guide](https://www.wowhead.com/guide/midnight/raids/venomous-abyss-vashnik-the-malignant-boss-strategy-abilities)（2026-08-22 访问；12.1 当前首领页）：用于三座喷泉强化、活体毒液与中间爆炸的操作提示。下方中文视频仅作当前实战佐证。

### 毒液深渊：斯佐拉克

<!-- source-id: icy-sszorak -->
[Icy Veins：Sszorak Raid Guide](https://www.icy-veins.com/wow/sszorak-raid-guide)（2026-08-22 访问；含普通/英雄/史诗章节）：用于前方、分摊、毒囊与转场；随机团队没有独立可靠差异资料，四难度只显示共通机制。

### 毒液深渊：双牙

<!-- source-id: wowhead-twin-fangs-community -->
[Wowhead：The Twin Fangs Boss Guide](https://www.wowhead.com/guide/midnight/raids/venomous-abyss-twin-fangs-boss-strategy-abilities)（2026-08-22 访问；12.1 当前首领页）：用于永恒毒液层数、饕餮盛宴清层、蛇形小怪与石破承受。该页与 Method 英雄攻略及下方中文视频均一致；四难度只复用已核验的共通动作，不声称额外差异。

补充交叉核验：[Method：The Twin Fangs Heroic Boss Guide](https://www.method.gg/guides/the-venomous-abyss/the-twin-fangs-heroic)（2026-08-22 访问；2026-08-14 更新；专业攻略）同样说明永恒毒液、盛宴分摊与小怪处理。

补充交叉核验：[Warcraft Wiki：The Twin Fangs](https://warcraft.wiki.gg/wiki/The_Twin_Fangs)（2026-08-22 访问；当前冒险指南资料）同样列出 Eternal Venom、Venomous Emergence 小怪与 Stone Breaker 的承受要求。

### 毒液深渊：盘绕祭坛

<!-- source-id: wowhead-coiled-altar -->
[Wowhead：The Coiled Altar Boss Guide](https://www.wowhead.com/guide/midnight/raids/venomous-abyss-coiled-altar-boss-strategy-abilities)（2026-08-22 访问；12.1 当前首领页）：用于祖尔金→玛拉克雷斯的三阶段顺序、灵魂绑定后同步击杀，以及毒液/恐惧目标处理。

### 毒液深渊：乌拉泰克

<!-- source-id: wowhead-ulatek -->
[Wowhead：Ula'tek Boss Guide](https://www.wowhead.com/de/guide/midnight/raids/venomous-abyss-ulatek-boss-strategy-abilities)（2026-08-22 访问；12.1 当前首领页）：用于毒液孵化、卵与小怪优先级、幽魂盘绕分摊；只采用该页明确列出的共通动作。

#### 中文社区/视频补充审计

- [抖音精选：烈毒之渊 1–7 号实战攻略集合](https://jingxuan.douyin.com/m/video/7622494298583420195)（2026-08-22 访问；约 8 天前；**社区经验、非官方**）：可见奈克扎利、瓦什尼克、斯佐拉克和双牙等当前视频条目。双牙的毒层管理/转场规避与 Wowhead、Method 一致，因此仅作为中文实战表达的佐证；其余未能从页面获得可逐条交叉的细节，不单独写入数据。
- NGA 与其他中文论坛检索未找到可公开访问、能与当前专业页逐条交叉的《毒液深渊》实战帖，因此没有把单帖传闻写入插件。
- 大秘境中文社区/视频检索同样未找到可公开访问、能与当前专业页逐条交叉采用的首领段小怪短攻略；56 条大秘境动作均来自上文列出的当前 Icy Veins/Wowhead 首领或小怪章节，而非论坛传闻。

社区资料仅辅助审计，不是本插件机制结论的唯一来源。后续如出现可公开访问、近期且多源一致的中文实战资料，再单独复核难度差异。
