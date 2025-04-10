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
				local card = create_card("Joker", G.jokers, nil, "pridark_prismatic", nil, nil, nil, "fluorite")
                print(card.config.center.key)
                if G.P_CENTERS[card.label.."_inactive"] then card:set_ability(G.P_CENTERS[card.label.."_inactive"]) end
				card:add_to_deck()
				G.jokers:emplace(card)
				card:juice_up(0.3, 0.5)
				return true
			end,
		}))
		delay(0.6)
    end
})
