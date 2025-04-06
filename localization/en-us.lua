return {
    descriptions = {
        Joker = {
            j_pridark_surprise_test = {
                name = "Surprise Test",
                text = {"Palyed cards with rank {C:attention}X{}",
                    "give {X:red,C:white}X#1#{} Mult when scored,",
                    "where {C:attention}X{} is any valid solution",
                    "of: {C:attention}#2#",
                    "{s:0.8}Polynomial changes every round",
                },
            },
            j_pridark_time_loop = {
                name = "Time Loop",
                text = {"{C:chips}#1#{} Ante after {C:attention}Boss Blind{}",
                    "is defeated"
                },
                unlock={
                    "Discover the",
                    "true {C:prismatic}Power{} of",
                    "the {C:prismatic}Prism",
                },
            },
            j_pridark_karl = {
                name = "Karl",
                text = {"All {C:attention}Jokers{} are {C:red}Equal",
                    "{C:inactive}(Same rarity and cost)"
                },
                unlock= {
                    "{E:1,s:1.3}?????",
                }
            },
            j_pridark_opticus = {
                name = "Opticus",
                text = {"{C:attention}All{} cards permanently",
                    "gain {X:red,C:white}X#1#{} Mult when a",
                    "card with a {C:red}different{}",
                    "{C:attention}Suit{} is scored"
                },
                unlock={
                    "Discover the",
                    "true {C:prismatic}Power{} of",
                    "the {C:prismatic}Prism",
                },
            },
            j_pridark_opticus_inactive = {
                name = "Opticus",
                text = {"Play {C:attention}#1#{} hands",
                    "containing {C:attention}4{} suits",
                    "to {C:prismatic}Awaken",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)"
                },
            },
        },
        Spectral = {
            c_pridark_spectral_fluorite = {
                name = "Fluorite",
                text = {"Creates a {C:red}dormant",
                    "{C:prismatic}Prismatic{} Joker",
                    "{C:inactive}(Must have room)"
                },
            },
        },
        Edition = {
            e_pridark_trans = {
              name = "Trans",
              text = {
                "{X:dark_edition,C:white}^#1#{} Mult"
                }
            }
        },
    },
    misc = {
        dictionary = {
            k_loop = "Loop!",
            k_pridark_prismatic = "Prismatic",
            k_comrade = "Comrade",
            k_awaken = "Awakened!",
        },
        labels = {
            pridark_trans = "Trans",
            pridark_prismatic = "Prismatic"
        }
    }
}

