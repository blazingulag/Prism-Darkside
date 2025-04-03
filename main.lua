G.PRISMDARKSIDE = {}
G.PRISMDARKSIDE.C = {}
G.PRISMDARKSIDE.C.PRISMATIC = {0,0,0,1}
G.PRISMDARKSIDE.C.PRISMATIC_HUE = 0

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

SMODS.load_file('objects/jokers.lua')()
SMODS.load_file('objects/editions.lua')()

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
	if G.ARGS.LOC_COLOURS then
        
		local r, g, b = hsv(self.PRISMDARKSIDE.C.PRISMATIC_HUE / 360, .5, 1)

		self.PRISMDARKSIDE.C.PRISMATIC[1] = r
		self.PRISMDARKSIDE.C.PRISMATIC[3] = g
		self.PRISMDARKSIDE.C.PRISMATIC[2] = b

		self.PRISMDARKSIDE.C.PRISMATIC_HUE = (self.PRISMDARKSIDE.C.PRISMATIC_HUE + 0.5) % 360
		G.ARGS.LOC_COLOURS.PRISMATIC = self.PRISMDARKSIDE.C.PRISMATIC
	end
end
