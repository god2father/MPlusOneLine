local _, addon = ...

addon.dungeons = {
  { name = "蛇牙祭坛", tip = "小怪优先打断穿刺嘶鸣；盘蛇全员打断死亡哀鸣，尾王预分配吃线并用流血清仪式毒层。", source = "icy-altar-of-fangs" },
  { name = "谋杀街", tip = "打断邪能飞弹并及时驱散心停毒；扎恩的整排谋杀躲进货桶，用火弹清除易爆桶。", source = "icy-murder-row" },
  { name = "纳洛拉克巢穴", tip = "治疗之风必须打断、首领蘑菇全员分摊；纳洛拉克把锤击放角落，神怒时拦住熊影。", source = "icy-den-of-nalorakk" },
  { name = "盲谷", tip = "优先断光辉播种者的光箭齐射，低血时别让它唤醒未激活怪群；50%狂乱留治疗大招。", source = "icy-blinding-vale" },
  { name = "虚痕竞技场", tip = "推荐走右路拿副本增益；塔兹拉点名时靠近集中地板，黑花阶段全员躲球。", source = "icy-voidscar-arena" },
  { name = "王者之眠", tip = "轮流断妖术齐射、灵魂束缚与邪恶治疗；小怪暗影束缚可控可驱，别贴近吃恐惧。", source = "icy-kings-rest" },
  { name = "塞塔里斯神庙", tip = "双首领有风暴祝福时按护盾切换集火目标；其余机制先看当前冒险指南，速查内容仍在补充。", source = "wowhead-temple-of-sethraliss" },
  { name = "红玉新生法池", tip = "一王躲冰雹、及时打断碎冰并破盾；二王点名靠近放火元素，尾王优先处理落地的龙。", source = "wowhead-ruby-life-pools" },
}

addon.raid = {
  name = "毒液深渊",
  instanceNames = { "The Venomous Abyss", "毒液深渊" },
  difficulties = { [17] = "LFR", [14] = "Normal", [15] = "Heroic", [16] = "Mythic" },
}

addon.raidBosses = {
  { name = "Nek'zali the Soulcoiler", source = "icy-nekzali", tips = { LFR = "共通机制：两阶段优先处理小怪；其余细节以团队标记与冒险指南为准。", Normal = "共通机制：两阶段优先处理小怪；其余细节以团队标记与冒险指南为准。", Heroic = "共通机制：两阶段优先处理小怪；其余细节以团队标记与冒险指南为准。", Mythic = "共通机制：两阶段优先处理小怪；其余细节以团队标记与冒险指南为准。" } },
  { name = "Entombed Sentinels", source = "icy-entombed-sentinels", tips = { LFR = "共通机制：双首领分开、团队均分两边并平衡血量；避免无必要跨场。", Normal = "共通机制：双首领分开、团队均分两边并平衡血量；避免无必要跨场。", Heroic = "共通机制：双首领分开、团队均分两边并平衡血量；避免无必要跨场。", Mythic = "共通机制：双首领分开、团队均分两边并平衡血量；避免无必要跨场。" } },
  { name = "The Lost Explorers", source = "icy-lost-explorers", tips = { LFR = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。", Normal = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。", Heroic = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。", Mythic = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。" } },
  { name = "Vashnik the Malignant", source = "icy-vashnik", tips = { LFR = "共通机制：按团队标记摆放首领，以决定强化池处理顺序；未核验差异不在此提示。", Normal = "共通机制：按团队标记摆放首领，以决定强化池处理顺序；未核验差异不在此提示。", Heroic = "共通机制：按团队标记摆放首领，以决定强化池处理顺序；未核验差异不在此提示。", Mythic = "共通机制：按团队标记摆放首领，以决定强化池处理顺序；未核验差异不在此提示。" } },
  { name = "Sszorak", source = "icy-sszorak", tips = { LFR = "共通机制：撕裂前方朝外、撕咬按分组分摊；毒囊放标记点并在转场用其回中间。", Normal = "共通机制：撕裂前方朝外、撕咬按分组分摊；毒囊放标记点并在转场用其回中间。", Heroic = "共通机制：撕裂前方朝外、撕咬按分组分摊；毒囊放标记点并在转场用其回中间。", Mythic = "共通机制：撕裂前方朝外、撕咬按分组分摊；毒囊放标记点并在转场用其回中间。" } },
  { name = "The Twin Fangs", source = "icy-twin-fangs", tips = { LFR = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。", Normal = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。", Heroic = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。", Mythic = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。" } },
  { name = "The Coiled Altar", source = "icy-coiled-altar", tips = { LFR = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。", Normal = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。", Heroic = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。", Mythic = "当前仅确认首领与难度范围；请以团队标记和游戏内冒险指南为准。" } },
  { name = "Ula'tek", source = "icy-ulatek", tips = { LFR = "当前仅确认最终首领与难度范围；请以团队标记和游戏内冒险指南为准。", Normal = "当前仅确认最终首领与难度范围；请以团队标记和游戏内冒险指南为准。", Heroic = "当前仅确认最终首领与难度范围；请以团队标记和游戏内冒险指南为准。", Mythic = "当前仅确认最终首领与难度范围；请以团队标记和游戏内冒险指南为准。" } },
}
