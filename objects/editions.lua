SMODS.Shader {
    key = 'trans',
    path = 'trans.fs'
}
SMODS.Sound {
    key = 'trans',
    path = 'trans.ogg'
}

SMODS.Edition {
    key = 'trans',
    shader = 'trans',
    sound = {
        sound = 'pridark_trans',
        per = 1,
        vol = 0.7
    },
    discovered = true,
    weight = 3,
    in_shop = true,
    extra_cost = 5,
	config = {
        e_mult = 1.12
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (card.edition or {}).e_mult or self.config.e_mult
            }
        }
    end,
	calculate = function(self, card, context)
		if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
			return {
				emult = card.edition.e_mult
			}
		end
	end
}