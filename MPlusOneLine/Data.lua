local _, addon = ...

addon.dungeons = {
  { name = "蛇牙祭坛", instanceNames = { "Altar of Fangs", "蛇牙祭坛" }, segments = {
    { trash = { name = "Rav'i 前关键小怪", tip = "先集火仪式酋长和不稳定图腾；原始蛇的穿刺嘶嘶必打断，双牙掠夺者前方别站人。", source = "icy-altar-of-fangs" }, boss = { name = "Rav'i", tip = "贪食时开自保并吃掉地上的残渣水坑；别让水坑堆着拖到下一轮。", source = "icy-altar-of-fangs" } },
    { trash = { name = "The Writhing Coil 前关键小怪", tip = "高阶进化者的群体注毒必打断、进化读条用控场断；放血者靠近前先控住，响尾虫读条前开自保。", source = "icy-altar-of-fangs" }, boss = { name = "The Writhing Coil", tip = "已核验机制：毒性弹幕需连续打断三次；躲开钻地冲锋及其后的毒液前方。", source = "icy-altar-of-fangs" } },
    { trash = { name = "Zul'jan 前关键小怪", tip = "活体毒液死亡前开自保；乌拉泰克选民的群体注毒必打断，并躲开毒性光束前方。", source = "icy-altar-of-fangs" }, boss = { name = "Zul'jan", tip = "獠牙仪式时四人分别吃光束，别让光束撞到首领；提前分开找最近一条线。", source = "icy-altar-of-fangs" } },
  } },
  { name = "谋杀街", instanceNames = { "Murder Row", "谋杀街" }, segments = {
    { trash = { name = "Kystia Manaheart 前关键小怪", tip = "先集火受贿队长；邪能飞弹必打断、魅魔诱惑用控场打断，巨型邪能龙的腐蚀唾液立刻驱散。", source = "icy-murder-row" }, boss = { name = "Kystia Manaheart", tip = "先把 Nibbles 打到 20%再爆发本体；躲邪能喷射和邪能新星，幻象出现立刻打断或控住。", source = "icy-murder-row" } },
    { trash = { name = "Zaen Bladesorrow 前关键小怪", tip = "事件中先踢出跺地闹事者、清洁工及时扫绿液；仓库工事故范围躲开，先杀强化工人的监工。", source = "icy-murder-row" }, boss = { name = "Zaen Bladesorrow", tip = "已核验机制：整排谋杀时躲进货桶；用火弹清理易爆桶，避免场地被邪能货物占满。", source = "icy-murder-row" } },
    { trash = { name = "Xathuux the Annihilator 前关键小怪", tip = "小鬼邪火爆发必打断；先杀旋风的希瓦拉惩罚者，邪能唤魔师吸血必断并躲邪火轰炸。", source = "icy-murder-row" }, boss = { name = "Xathuux the Annihilator", tip = "已核验机制：斧头点名靠近首领以便顺劈并尽快击杀；大地狱碾压前开自保，避开火焰脚印。", source = "icy-murder-row" } },
    { trash = { name = "Lithiel Cinderfury 前关键小怪", tip = "邪犬的恐惧嚎叫与术士的混沌箭优先打断；地狱火跳砸先散开，召唤小鬼时立刻集火。", source = "icy-murder-row" }, boss = { name = "Lithiel Cinderfury", tip = "混沌箭必打断；邪犬出现先集火，古尔丹之手时用击退或眩晕阻止小鬼读条。", source = "icy-murder-row" } },
  } },
  { name = "纳洛拉克巢穴", instanceNames = { "Den of Nalorakk", "纳洛拉克巢穴" }, segments = {
    { trash = { name = "The Hoardmonger 前关键小怪", tip = "大地低语者的治疗之风必打断；饥饿之灵开全队伤害时开自保并先杀饥饿图腾，腐烂补给别踩。", source = "icy-den-of-nalorakk" }, boss = { name = "The Hoardmonger", tip = "已核验机制：躲开大地震击前方；腐败补给时分散吃满蘑菇，别让其爆炸。", source = "icy-den-of-nalorakk" } },
    { trash = { name = "Sentinel of Winter 前关键小怪", tip = "决心化身定身后先打断根须再躲粉碎；冰川亡魂的冰涌立刻驱散，寒霜粉碎者的寒霜咆哮必打断。", source = "icy-den-of-nalorakk" }, boss = { name = "Sentinel of Winter", tip = "已核验机制：躲龙卷；打断碎片怪读条并安排人吃碎冰，利用雪堆应对击退。", source = "icy-den-of-nalorakk" } },
    { trash = { name = "Nalorakk 前关键小怪", tip = "风缚秘术师的奥术闪电必打断；优先打岩浆图腾，毒矛地面躲开，驯兽师激怒后被盯的人立刻拉开。", source = "icy-den-of-nalorakk" }, boss = { name = "Nalorakk", tip = "已核验机制：锤击放角落；神怒时拦住熊影，强攻时躲到首领护盾后。", source = "icy-den-of-nalorakk" } },
  } },
  { name = "盲谷", instanceNames = { "The Blinding Vale", "盲谷" }, segments = {
    { trash = { name = "Lightblossom Trinity 前关键小怪", tip = "辐光播种者的光箭齐射必打断并优先击杀，别让它低血唤醒藤鞭；光噬藤鞭的授粉同样必断。", source = "icy-blinding-vale" }, boss = { name = "Lightblossom Trinity", tip = "已核验机制：吃掉光花、躲肥沃壤土并打断 Kezkitt 的光箭；首领尽量叠放。", source = "icy-blinding-vale" } },
    { trash = { name = "Ikuzz the Light Hunter 前关键小怪", tip = "伊库兹前没有需额外收录的关键小怪；清完上一段后直接进首领，别绕路误拉额外怪群。", source = "icy-blinding-vale" }, boss = { name = "Ikuzz the Light Hunter", tip = "已核验机制：50%狂乱留治疗大招，重点覆盖荆棘召唤咆哮的持续团队伤害。", source = "icy-blinding-vale" } },
    { trash = { name = "Lightwarden Ruia 前关键小怪", tip = "明光棘喉的日光吐息躲前方；羽翼花瓣鸟的迷乱尖啸必打断，棘刺迅猛龙跳劈横移躲开。", source = "icy-blinding-vale" }, boss = { name = "Lightwarden Ruia", tip = "月枭与熊形态切换时持续移动躲技能；40%后连发加快，提前开自保并留治疗大招。", source = "icy-blinding-vale" } },
    { trash = { name = "Ziekket 前关键小怪", tip = "土豆蟾母孵化前先杀幼体并驱散毒喷；巨型九头蛇点名光颚射线开自保，子弹种子地面躲开。", source = "icy-blinding-vale" }, boss = { name = "Ziekket", tip = "已核验机制：迅速击杀并打断光花；被聚焦光束点名时扫过已死藤鞭尸体，阻止复活。", source = "icy-blinding-vale" } },
  } },
  { name = "虚痕竞技场", instanceNames = { "Voidscar Arena", "虚痕竞技场" }, segments = {
    { trash = { name = "Taz'Rah 前关键小怪", tip = "走右路先拿法术风暴者的精通证明；雷暴期间开自保并立刻集火三颗球，保护龟开壳时把其他怪拉离护盾。", source = "icy-voidscar-arena" }, boss = { name = "Taz'Rah", tip = "已核验机制：冲刺点名靠近集中放裂隙；黑花阶段全员躲球，坦克沿墙转场留空间。", source = "icy-voidscar-arena" } },
    { trash = { name = "Atroxus 前关键小怪", tip = "噬体尖啸必打断；残暴监督的护盾一出立刻集火，锤风点名持续跑开，守望收割者天击集合分摊。", source = "icy-voidscar-arena" }, boss = { name = "Atroxus", tip = "躲毒池和毒息前方；每次咆哮后立刻集火毒爬藤，别让它存活持续压血。", source = "icy-voidscar-arena" } },
    { trash = { name = "Charonus 前关键小怪", tip = "吞噬蛮兵恐惧咆哮前开自保；它要吞怪时先集火被吞目标，别让它回血。", source = "icy-voidscar-arena" }, boss = { name = "Charonus", tip = "奇点出现先靠近星体不被吸入；重力球点名立刻进星体清球，其余人彼此分散躲虚空瀑布。", source = "icy-voidscar-arena" } },
  } },
  { name = "王者之眠", instanceNames = { "King's Rest", "王者之眠" }, segments = {
    { trash = { name = "The Golden Serpent 前关键小怪", tip = "复生妖术师的妖术齐射必打断；祖尔爪牙开暗影束缚时用控场或驱散处理，暗影勇士地面躲开。", source = "icy-kings-rest" }, boss = { name = "The Golden Serpent", tip = "吐金点名靠近放在场边；金像出现立刻击杀，绝不能让它碰到首领。", source = "icy-kings-rest" } },
    { trash = { name = "Mchimba the Embalmer 前关键小怪", tip = "挑战房里先躲剑刃风暴和喷发猛击；灵魂束缚、灵魂箭与邪恶修补必打断，被封棺立刻按主动按钮求救。", source = "icy-kings-rest" }, boss = { name = "Mchimba the Embalmer", tip = "抽取体液时开自保并自疗；燃烧地面点名远离队友，被封棺立刻按主动按钮求救。", source = "icy-kings-rest" } },
    { trash = { name = "The Council of Tribes 前关键小怪", tip = "先打带群体减伤的灵魂祭司；旋风斧横移躲开，暗影箭齐射和治疗之潮必打断。", source = "icy-kings-rest" }, boss = { name = "The Council of Tribes", tip = "旋斧出现先离开路径；冲桶点名全队集合分摊，爆炸图腾一出现立刻集火并打断毒爆。", source = "icy-kings-rest" } },
    { trash = { name = "Dazar, The First King 前关键小怪", tip = "祖尔之影的黑暗水池立刻分摊；黑暗启示点名远离队友，别把爆炸带进人群。", source = "icy-kings-rest" }, boss = { name = "Dazar, The First King", tip = "镀金毁灭前开自保；彼此拉开躲空中猛击，打断死亡咆哮并横移躲穿刺矛。", source = "icy-kings-rest" } },
  } },
  { name = "塞塔里斯神庙", instanceNames = { "Temple of Sethraliss", "塞塔里斯神庙" }, segments = {
    { trash = { name = "Adderis and Aspix 前关键小怪", tip = "带治疗之潮的小怪读条必打断；电能射击和落雷地面横移躲开，别与坦克同站吃近战范围。", source = "wowhead-temple-of-sethraliss" }, boss = { name = "Adderis and Aspix", tip = "只打没有风暴祝福、没有 99% 减伤的一只；祝福切换后立刻换目标。", source = "wowhead-temple-of-sethraliss" } },
    { trash = { name = "Merektha 前关键小怪", tip = "带电鳞片读条必打断或驱散后再打；蛇骑士毒息前方躲开，别站在吐息路径。", source = "wowhead-temple-of-sethraliss" }, boss = { name = "Merektha", tip = "钻地后先击杀孵出的蛇；毒蛇吐息可打断，持续躲喷吐和风暴。", source = "wowhead-temple-of-sethraliss" } },
    { trash = { name = "Galvazzt 前关键小怪", tip = "先杀火花引导者以关闭电球迷宫；过迷宫时等电球留出缺口再走，别硬穿电墙。", source = "wowhead-temple-of-sethraliss" }, boss = { name = "Galvazzt", tip = "闪电尖塔连线时站到首领和尖塔之间截线；别在光束里久站，轮流接线减伤。", source = "wowhead-temple-of-sethraliss" } },
    { trash = { name = "Avatar of Sethraliss 前关键小怪", tip = "启动双电球后，优先打断神庙扰乱者的精华扰乱；电球守望者靠近就控住或集火，别让它拖走电球。", source = "wowhead-temple-of-sethraliss" }, boss = { name = "Avatar of Sethraliss", tip = "先杀持续污染化身的精华亵渎者；净化守卫后让化身吸收生命力并持续治疗化身。", source = "wowhead-temple-of-sethraliss" } },
  } },
  { name = "红玉新生法池", instanceNames = { "Ruby Life Pools", "红玉新生法池" }, segments = {
    { trash = { name = "Melidrussa Chillworn 前关键小怪", tip = "先击杀门前必经的迷你首领；原始巨兽挖掘冲击横移躲开，寒冰织法者的冰箭与冰盾优先打断。", source = "wowhead-ruby-life-pools" }, boss = { name = "Melidrussa Chillworn", tip = "已核验机制：躲冰雹、及时打断碎冰并在护盾阶段优先破盾。", source = "wowhead-ruby-life-pools" } },
    { trash = { name = "Kokia Blazehoof 前关键小怪", tip = "火元素副官单独拉开处理；烈焰巨口增伤层数上升时开减伤，别把额外小怪叠进副官。", source = "wowhead-ruby-life-pools" }, boss = { name = "Kokia Blazehoof", tip = "已核验机制：点名时靠近放火元素，优先处理生成的火焰目标。", source = "wowhead-ruby-life-pools" } },
    { trash = { name = "Kyrakka and Erkhart Stormvein 前关键小怪", tip = "尾王路没有需额外收录的关键打断；清理沿路怪后直接进首领，别为凑数量额外误拉。", source = "wowhead-ruby-life-pools" }, boss = { name = "Kyrakka and Erkhart Stormvein", tip = "优先处理落地的龙；点名分散放好地面技能，持续移动避开后续范围。", source = "wowhead-ruby-life-pools" } },
  } },
}

addon.raid = {
  name = "毒液深渊",
  instanceNames = { "The Venomous Abyss", "毒液深渊" },
  difficulties = { [17] = "LFR", [14] = "Normal", [15] = "Heroic", [16] = "Mythic" },
}

addon.raidBosses = {
  { name = "Nek'zali the Soulcoiler", source = "wowhead-nekzali-community", tips = { LFR = "已核验共通机制：远离盘魂之井，别让小怪进井；转阶段优先打断苏醒回响的连接。", Normal = "已核验共通机制：远离盘魂之井，别让小怪进井；转阶段优先打断苏醒回响的连接。", Heroic = "已核验共通机制：远离盘魂之井，别让小怪进井；转阶段优先打断苏醒回响的连接。", Mythic = "已核验共通机制：远离盘魂之井，别让小怪进井；转阶段优先打断苏醒回响的连接。" } },
  { name = "Entombed Sentinels", source = "icy-entombed-sentinels", tips = { LFR = "双首领全程拉开并均分两队；血量始终压平，换边前等自己的毒层消退。", Normal = "双首领全程拉开并均分两队；血量始终压平，换边前等自己的毒层消退。", Heroic = "双首领全程拉开并均分两队；血量始终压平，换边前等自己的毒层消退。", Mythic = "双首领全程拉开并均分两队；血量始终压平，换边前等自己的毒层消退。" } },
  { name = "The Lost Explorers", source = "icy-lost-explorers", tips = { LFR = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。", Normal = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。", Heroic = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。", Mythic = "共通机制：不要三首领全叠；打断冰火读条，按团队分配处理鱼与大招。" } },
  { name = "Vashnik the Malignant", source = "wowhead-vashnik-community", tips = { LFR = "控制喷泉强化别反复叠同一毒系；活体毒液到中间前优先击杀。", Normal = "控制喷泉强化别反复叠同一毒系；活体毒液到中间前优先击杀。", Heroic = "控制喷泉强化别反复叠同一毒系；活体毒液到中间前优先击杀。", Mythic = "控制喷泉强化别反复叠同一毒系；活体毒液到中间前优先击杀。" } },
  { name = "Sszorak", source = "icy-sszorak", tips = { LFR = "把撕裂前方转向人群外；撕咬时分组站入分摊，毒囊放边缘，转场沿毒囊回中间。", Normal = "把撕裂前方转向人群外；撕咬时分组站入分摊，毒囊放边缘，转场沿毒囊回中间。", Heroic = "把撕裂前方转向人群外；撕咬时分组站入分摊，毒囊放边缘，转场沿毒囊回中间。", Mythic = "把撕裂前方转向人群外；撕咬时分组站入分摊，毒囊放边缘，转场沿毒囊回中间。" } },
  { name = "The Twin Fangs", source = "wowhead-twin-fangs-community", tips = { LFR = "已核验共通机制：盯永恒毒液层数，盛宴分摊清层；小怪优先击杀，石破必须安排人承受。", Normal = "已核验共通机制：盯永恒毒液层数，盛宴分摊清层；小怪优先击杀，石破必须安排人承受。", Heroic = "已核验共通机制：盯永恒毒液层数，盛宴分摊清层；小怪优先击杀，石破必须安排人承受。", Mythic = "已核验共通机制：盯永恒毒液层数，盛宴分摊清层；小怪优先击杀，石破必须安排人承受。" } },
  { name = "The Coiled Altar", source = "wowhead-coiled-altar", tips = { LFR = "依序处理祖尔金、玛拉克雷斯；灵魂绑定后两者同步击杀，毒液和恐惧点名立即离开人群。", Normal = "依序处理祖尔金、玛拉克雷斯；灵魂绑定后两者同步击杀，毒液和恐惧点名立即离开人群。", Heroic = "依序处理祖尔金、玛拉克雷斯；灵魂绑定后两者同步击杀，毒液和恐惧点名立即离开人群。", Mythic = "依序处理祖尔金、玛拉克雷斯；灵魂绑定后两者同步击杀，毒液和恐惧点名立即离开人群。" } },
  { name = "Ula'tek", source = "wowhead-ulatek", tips = { LFR = "已核验共通机制：别让毒液触碰幼体孵化；优先处理卵与小怪，幽魂盘绕按指定点分摊。", Normal = "已核验共通机制：别让毒液触碰幼体孵化；优先处理卵与小怪，幽魂盘绕按指定点分摊。", Heroic = "已核验共通机制：别让毒液触碰幼体孵化；优先处理卵与小怪，幽魂盘绕按指定点分摊。", Mythic = "已核验共通机制：别让毒液触碰幼体孵化；优先处理卵与小怪，幽魂盘绕按指定点分摊。" } },
}
