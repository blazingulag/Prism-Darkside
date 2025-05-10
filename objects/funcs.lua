local orig_generate_UIBox_ability_table = Card.generate_UIBox_ability_table;
function Card:generate_UIBox_ability_table()
	local ret = orig_generate_UIBox_ability_table(self)

	local center_obj = self.config.center

	if center_obj and center_obj.discovered and ((center_obj.set and G.localization.descriptions[center_obj.set] 
	and G.localization.descriptions[center_obj.set][center_obj.key]
	and G.localization.descriptions[center_obj.set][center_obj.key].pridark_subtitle) or center_obj.pridark_subtitle) then

		if ret.name and ret.name ~= true then
			local text = ret.name
			ret.name = {{n=G.UIT.R, config={align = "cm"},nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes=text},
				{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.O, 
					config={
						object = DynaText({string = (center_obj.set 
						and G.localization.descriptions[center_obj.set] 
						and G.localization.descriptions[center_obj.set][center_obj.key].pridark_subtitle)
						or center_obj.pridark_subtitle, 
						colours = {G.C.WHITE},
						float = true,
						shadow = true,
						offset_y = 0.1,
						silent = true,
						spacing = 1,
						scale = 0.37
					})}}
				}}
			}}}
		end
	end
	return ret
end