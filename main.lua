G.PRISMDARKSIDE = {}
G.PRISMDARKSIDE.C = {}
G.PRISMDARKSIDE.C.PRISMATIC = {0,0,0,1}
G.PRISMDARKSIDE.C.PRISMATIC_HUE = 0
G.PRISMDARKSIDE.C.PRISMATIC_SLOW = {0,0,0,1}
G.PRISMDARKSIDE.C.PRISMATIC_SLOW_HUE = 0

SMODS.Atlas({
    key = 'modicon',
    path = 'modicon.png',
    px = '34',
    py = '34'
})

SMODS.Rarity({
    key = "prismatic",
    badge_colour = G.PRISMDARKSIDE.C.PRISMATIC
})

SMODS.load_file('objects/funcs.lua')()
SMODS.load_file('objects/jokers.lua')()
SMODS.load_file('objects/editions.lua')()
SMODS.load_file('objects/consumables.lua')()

local function hsv(h, s, v)
    if s <= 0 then return v,v,v end
    h = h*6
    local c = v*s
    local x = (1-math.abs((h%2)-1))*c
    local m,r,g,b = (v-c), 0, 0, 0
    if h < 1 then
        r, g, b = c, x, 0
    elseif h < 2 then
        r, g, b = x, c, 0
    elseif h < 3 then
        r, g, b = 0, c, x
    elseif h < 4 then
        r, g, b = 0, x, c
    elseif h < 5 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end
    return r+m, g+m, b+m
end

local orig_game_update = Game.update
function Game:update(dt)
	orig_game_update(self, dt)
    local r, g, b = hsv(self.PRISMDARKSIDE.C.PRISMATIC_HUE / 360, .5, 1)
    local r2, g2, b2 = hsv(self.PRISMDARKSIDE.C.PRISMATIC_SLOW_HUE / 360, .5, 1)

    self.PRISMDARKSIDE.C.PRISMATIC[1] = r
    self.PRISMDARKSIDE.C.PRISMATIC[3] = g
    self.PRISMDARKSIDE.C.PRISMATIC[2] = b

    self.PRISMDARKSIDE.C.PRISMATIC_SLOW[1] = r2
    self.PRISMDARKSIDE.C.PRISMATIC_SLOW[3] = g2
    self.PRISMDARKSIDE.C.PRISMATIC_SLOW[2] = b2

    self.PRISMDARKSIDE.C.PRISMATIC_HUE = (self.PRISMDARKSIDE.C.PRISMATIC_HUE + 0.5) % 360
    self.PRISMDARKSIDE.C.PRISMATIC_SLOW_HUE = (self.PRISMDARKSIDE.C.PRISMATIC_SLOW_HUE + 0.25) % 360

    if G.ARGS.LOC_COLOURS then 
        G.ARGS.LOC_COLOURS.prismatic = self.PRISMDARKSIDE.C.PRISMATIC 
        G.ARGS.LOC_COLOURS.prismatic_slow = self.PRISMDARKSIDE.C.PRISMATIC_SLOW
    end
end

--Change main menu (yes this is taken from cryptid, shut up)
local orig_main_menu = Game.main_menu
Game.main_menu = function(change_context)
    local ret = orig_main_menu(change_context)
    local newcard = Card(
        G.title_top.T.x,
        G.title_top.T.y,
        G.CARD_W * 1.32,
        G.CARD_H * 1.32,
        G.P_CARDS.empty,
        G.P_CENTERS.j_pridark_opticus,
        { bypass_discovery_center = true }
    )
    G.title_top.T.w = G.title_top.T.w * 1.7675
    G.title_top.T.x = G.title_top.T.x - 0.8
    G.title_top:emplace(newcard)

    newcard.no_ui = true
    newcard.states.visible = false

    G.SPLASH_BACK:define_draw_steps({
        {
            shader = "splash",
            send = {
                { name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                { name = "vort_speed", val = 0.4 },
                { name = "colour_1", ref_table = G.PRISMDARKSIDE.C, ref_value = "PRISMATIC_SLOW" },
                { name = "colour_2", ref_table = G.C, ref_value = "DARK_EDITION" },
            },
        },
    })

    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0,
        blockable = false,
        blocking = false,
        func = function()
            if change_context == "splash" then
                newcard.states.visible = true
                newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
            else
                newcard.states.visible = true
                newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
            end
            return true
        end,
    }))

    return ret
end
