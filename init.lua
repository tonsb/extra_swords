minetest.register_tool("extra_swords:wave_breaker", {
	description = "Wave Breaker",
	inventory_image = "extra_swords_wave_breaker.png",
  wield_scale = {x=3,y=3,z=3},
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=5,
		groupcaps={
			choppy={times={[1]=1.00, [2]=0.10, [3]=0.01}, uses=200, maxlevel=3},
		},
		damage_groups = {fleshy=16},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:wave_breaker",
        recipe = {
                {'default:steel_ingot','bucket:bucket_water','default:steel_ingot'},
                {'default:steel_ingot','default:stick',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:sand_sword", {
	description = "Sand Sword",
	inventory_image = "extra_swords_sand_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=3,
		groupcaps={
			crumbly={times={[1]=4.00, [2]=3.20, [3]=2.20}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:sand_sword",
        recipe = {
                {'','default:sandstone',''},
                {'','default:sandstone',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:coral_sword", {
	description = "Coral Sword",
	inventory_image = "coral_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:coral_sword",
        recipe = {
                {'','default:coral_orange',''},
                {'','default:coral_orange',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:lava_knife", {
	description = "Lava Knife",
	inventory_image = "lava_knife.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=14},
	},
	sound = {breaks = "default_tool_breaks"},
    
  on_use = function(itemstack, user, pointed_thing)
		local sound_pos = pointed_thing.above or user:get_pos()
		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
		)
		local player_name = user:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if minetest.is_protected(pointed_thing.under, player_name) then
				minetest.chat_send_player(player_name, "This area is protected")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointed_thing.under, user)
			elseif minetest.get_item_group(node_under, "flammable") >= 0
					and minetest.get_node(pointed_thing.above).name == "air" then
				minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then
			-- Wear tool
			local wdef = itemstack:get_definition()
			itemstack:add_wear(1000)
			-- Tool break sound
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
			end
			return itemstack
		end
end
})
minetest.register_craft({
        output = "extra_swords:lava_knife",
        recipe = {
                {'','',''},
                {'','','bucket:bucket_lava'},
                {'','default:obsidian_shard',''},
        }
})
minetest.register_tool("extra_swords:frosty_longsword", {
	description = "Frosty Longsword",
	inventory_image = "frosty_longsword.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=17},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:frosty_longsword",
        recipe = {
                {'','default:ice',''},
                {'','default:ice',''},
                {'','extra_swords:frosty_sword',''},
        }
})
minetest.register_tool("extra_swords:frosty_axe", {
	description = "Frosty Axe",
	inventory_image = "frosty_axe.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=3,
		groupcaps={
			choppy={times={[1]=1.00, [2]=0.10, [3]=0.01}, uses=200,
maxlevel=3},
		},
		damage_groups = {fleshy=13},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:frosty_axe",
        recipe = {
                {'default:ice','default:ice','default:ice'},
                {'default:ice','default:stick',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:frosty_mace", {
	description = "Frosty Mace",
	inventory_image = "frosty_mace.png",
	tool_capabilities = {
		full_punch_interval = 2.5,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=6.00, [2]=3.00, [3]=0.01}, uses=100,
maxlevel=1},
		},
		damage_groups = {fleshy=10},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:frosty_mace",
        recipe = {
                {'','default:ice','default:ice'},
                {'','default:stick','default:ice'},
                {'default:stick','',''},
        }
})
minetest.register_tool("extra_swords:coral_longsword", {
	description = "Coral Longsword",
	inventory_image = "coral_longsword.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=3.00, [2]=2.00, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=17},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:coral_longsword",
        recipe = {
                {'','default:coral_orange',''},
                {'','default:coral_orange',''},
                {'','extra_swords:coral_sword',''},
        }
})
minetest.register_tool("extra_swords:frosty_sword", {
	description = "Frosty Sword",
	inventory_image = "frosty_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=9},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:frosty_sword",
        recipe = {
                {'','default:ice',''},
                {'','default:ice',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:fire_sword", {
	description = "Fire Sword",
	inventory_image = "fire_sword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=18},
	},
	sound = {breaks = "default_tool_breaks"},
  
  on_use = function(itemstack, user, pointed_thing)
		local sound_pos = pointed_thing.above or user:get_pos()
		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
		)
		local player_name = user:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if minetest.is_protected(pointed_thing.under, player_name) then
				minetest.chat_send_player(player_name, "This area is protected")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointed_thing.under, user)
			elseif minetest.get_item_group(node_under, "flammable") >= 0
					and minetest.get_node(pointed_thing.above).name == "air" then
				minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then
			-- Wear tool
			local wdef = itemstack:get_definition()
			itemstack:add_wear(1000)
			-- Tool break sound
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
			end
			return itemstack
		end
end
})
minetest.register_craft({
        output = "extra_swords:fire_sword",
        recipe = {
                {'','fire:flint_and_steel',''},
                {'','fire:flint_and_steel',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:club", {
	description = "Club",
	inventory_image = "club.png",
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:club",
        recipe = {
                {'','default:tree',''},
                {'','default:tree',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:cactus_knife", {
	description = "Cactus Knife",
	inventory_image = "cactus_knife.png",
	tool_capabilities = {
		full_punch_interval = 0,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=80, maxlevel=3},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:cactus_knife",
        recipe = {
                {'','',''},
                {'','default:cactus',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:bone_sword", {
	description = "Bone Sword",
	inventory_image = "bone_sword.png",
	tool_capabilities = {
		full_punch_interval = 0,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:bone_sword",
        recipe = {
                {'','bones:bones',''},
                {'','bones:bones',''},
                {'','default:stick',''},
        }
})
minetest.register_tool("extra_swords:lava_saber", {
	description = "Lava Saber",
	inventory_image = "lava_saber.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=50, maxlevel=3},
		},
		damage_groups = {fleshy=20},
	},
	sound = {breaks = "default_tool_breaks"},
    
  on_use = function(itemstack, user, pointed_thing)
		local sound_pos = pointed_thing.above or user:get_pos()
		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
		)
		local player_name = user:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if minetest.is_protected(pointed_thing.under, player_name) then
				minetest.chat_send_player(player_name, "This area is protected")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointed_thing.under, user)
			elseif minetest.get_item_group(node_under, "flammable") >= 0
					and minetest.get_node(pointed_thing.above).name == "air" then
				minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then
			-- Wear tool
			local wdef = itemstack:get_definition()
			itemstack:add_wear(1000)
			-- Tool break sound
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
			end
			return itemstack
		end
end
})
minetest.register_craft({
        output = "extra_swords:lava_saber",
        recipe = {
                {'','default:steel_ingot',''},
                {'','default:steel_ingot',''},
                {'','bucket:bucket_lava',''},
        }
})
minetest.register_tool("extra_swords:magma_sword", {
	description = "Magma Sword",
	inventory_image = "magma_sword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=23},
	},
	sound = {breaks = "default_tool_breaks"},
    
  on_use = function(itemstack, user, pointed_thing)
		local sound_pos = pointed_thing.above or user:get_pos()
		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = sound_pos, gain = 0.5, max_hear_distance = 8}
		)
		local player_name = user:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if not nodedef then
				return
			end
			if minetest.is_protected(pointed_thing.under, player_name) then
				minetest.chat_send_player(player_name, "This area is protected")
				return
			end
			if nodedef.on_ignite then
				nodedef.on_ignite(pointed_thing.under, user)
			elseif minetest.get_item_group(node_under, "flammable") >= 0
					and minetest.get_node(pointed_thing.above).name == "air" then
				minetest.set_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(player_name)) then
			-- Wear tool
			local wdef = itemstack:get_definition()
			itemstack:add_wear(1000)
			-- Tool break sound
			if itemstack:get_count() == 0 and wdef.sound and wdef.sound.breaks then
				minetest.sound_play(wdef.sound.breaks, {pos = sound_pos, gain = 0.5})
			end
			return itemstack
		end
end
})
minetest.register_craft({
        output = "extra_swords:magma_sword",
        recipe = {
                {'','','default:cobble'},
                {'','default:cobble',''},
                {'bucket:bucket_lava','',''},
        }
})
minetest.register_tool("extra_swords:diamond_longsword", {
	description = "Diamond Longsword",
	inventory_image = "diamond_longsword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=25},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:diamond_longsword",
        recipe = {
                {'','default:diamond',''},
                {'','default:diamond',''},
                {'','default:sword_diamond',''},
        }
})
minetest.register_tool("extra_swords:diamond_spear", {
	description = "Diamond Spear",
	inventory_image = "diamond_spear.png",
	tool_capabilities = {
		full_punch_interval = 3,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=150, maxlevel=3},
		},
		damage_groups = {fleshy=30},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:diamond_spear",
        recipe = {
                {'','','default:diamond'},
                {'','default:stick',''},
                {'default:stick','',''},
        }
})
minetest.register_tool("extra_swords:obsidian_sword", {
	description = "Obsidian Sword",
	inventory_image = "obsidian_sword.png",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=3,
		groupcaps={
			oddly_breakable_by_hand={times={[1]=2.00, [2]=1.20, [3]=0.20}, uses=500, maxlevel=3},
		},
		damage_groups = {fleshy=18},
	},
	sound = {breaks = "default_tool_breaks"},
})
minetest.register_craft({
        output = "extra_swords:obsidian_sword",
        recipe = {
                {'','','default:obsidian'},
                {'','default:obsidian',''},
                {'bucket:bucket_lava','',''},
        }
})