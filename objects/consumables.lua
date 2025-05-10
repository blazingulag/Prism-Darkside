SMODS.Atlas({
    key = 'pridarkconsumables',
    path = 'consumables.png',
    px = '71',
    py = '95'
})

SMODS.Consumable({
    key = 'spectral_fluorite',
    set = 'Spectral',
    atlas = 'pridarkconsumables',
    pos = {x=0, y=0},
    soul_pos = {x=1, y=0},
    discovered = false,
    cost = 4,
    hidden = true,
    soul_set = "Myth",
    can_use = function(self, card)
		return G.jokers.config.card_limit > #G.jokers.cards
	end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
			trigger = "after",
			delay = 0.4,
			func = function()
				play_sound("timpani")
                local old_pool = G.P_JOKER_RARITY_POOLS.pridark_prismatic
                local pool = {}
                for _, v in ipairs(old_pool) do
                    if not ((G.GAME.used_jokers[v.key] or G.GAME.used_jokers[v.key.."_inactive"]) and not next(find_joker("Showman"))) then
                        pool[#pool+1] = v.key
                        print(v.key)
                    end
                end
                local key = pseudorandom_element(pool, pseudoseed('fluo'))
                if not key then key = "j_pridark_opticus" end
				local card = create_card("Joker", G.jokers, nil, "pridark_prismatic", nil, nil, key.."_inactive", "fluorite")
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
    end
})
