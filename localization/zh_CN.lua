return {
    descriptions = {
        Joker = {
            j_pridark_surprise_test = {
                name = "突击测验",
                text = {"点数为{C:attention}X{}的牌在打出并计分时",
                    "给予{X:red,C:white}X#1#{}倍率",
                    "{C:attention}X{}为方程{C:attention}#2#",
                    "的任意实数解",
                    "{s:0.8}方程式每回合都会变动",
                },
            },
            j_pridark_time_loop = {
                name = "时间循环",
                text = {"在{C:attention}Boss盲注{}被击败后",
                    "底注{C:chips}#1#{}"
                },
                unlock={
                    "发掘出",
                    "{C:prismatic}棱镜",
                    "真正的{C:prismatic}力量{}",
                },
            },
            j_pridark_time_loop_inactive = {
                name = "时间循环",
                text = {"击败{C:attention}#1#{}个{C:attention}Boss盲注{}",
                    "来让此牌{C:prismatic}觉醒",
                    "{C:inactive}(当前为{C:attention}#2#{C:inactive}/#1#)"
                },
            },
            j_pridark_karl = {
                name = "卡尔·马克思",
                text = {"全世界的{C:attention}小丑们{}，{C:red}联合起来！",
                    "{C:inactive}(所有小丑统一售价和稀有度)"
                },
                unlock= {
                    "{E:1,s:1.3}?????",
                }
            },
            j_pridark_opticus = {
                name = "神秘学家",
                text = {"当某个{C:attention}花色{}的打出的牌计分时",
                    "{C:attention}所有{}的{C:red}不同{}的{C:attention}花色{}的牌",
                    "永久获得{X:red,C:white}X#1#{}倍率",
                },
                unlock={
                    "发掘出",
                    "{C:prismatic}棱镜",
                    "真正的{C:prismatic}力量{}",
                },
            },
            j_pridark_opticus_inactive = {
                name = "神秘学家",
                text = {"打出{C:attention}#1#{}手",
                    "包含{C:attention}4{}种花色的牌",
                    "来让此牌{C:prismatic}觉醒",
                    "{C:inactive}(当前为{C:attention}#2#{C:inactive}/#1#)"
                },
            },
            j_pridark_ultipizza = {
                name = "无限披萨制",
                text = {"本赛局中你每吃掉一张{C:attention}披萨{}",
                    "这张小丑牌获得{X:dark_edition,C:white}^#1#{}倍率",
                    "当选择{C:attention}盲注{}时",
                    "创建一张{C:dark_edition}负片{C:attention}披萨",
                    "{C:inactive}(当前为{X:dark_edition,C:white}^#2#{C:inactive}倍率)",
                },
            },
            j_pridark_ultipizza_inactive = {
                name = "无限披萨制",
                text = {"打出{C:attention}#1#次{C:attention}不同{}花色的同花",
                    "来让此牌{C:prismatic}觉醒",
                    "{C:inactive}(当前为{C:attention}#2#{C:inactive}/#1#)"
                },
            },
        },
        Spectral = {
            c_pridark_spectral_fluorite = {
                name = "萤石",
                text = {"创建一张随机的{C:red}休眠{}的",
                    "{C:prismatic}棱镜体{}小丑",
                    "{C:inactive}(必须有空间)"
                },
            },
        },
        Edition = {
            e_pridark_trans = {
              name = "超越",
              text = {
                "{X:dark_edition,C:white}^#1#{}倍率"
                }
            }
        },
    },
    misc = {
        dictionary = {
            k_loop = "循环！",
            k_pridark_prismatic = "棱镜体",
            k_comrade = "同志",
            k_awaken = "已觉醒！",
        },
        labels = {
            pridark_trans = "超越",
            pridark_prismatic = "棱镜体"
        }
    }
}

