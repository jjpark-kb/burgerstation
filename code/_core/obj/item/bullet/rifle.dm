/obj/item/bullet_cartridge/rifle_308
	name = "\improper .308 rifle bullet"
	desc = "The ol' reliable."
	desc_extended = "For rifles that require .308."
	icon = 'icons/obj/item/bullet/762.dmi'


	bullet_diameter = 7.62
	bullet_length = 51
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_308

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY

	size = 0.04
	value = 1.2

	inaccuracy_modifier = 0.75

/obj/item/bullet_cartridge/rifle_308/surplus
	name = "\improper surplus .308 rifle cartridge"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_308/surplus
	jam_chance = 1
	value = 0

/obj/item/bullet_cartridge/rifle_308/ap
	name = "\improper AP .308 rifle bullet"
	desc_extended = "For rifles that require .308. This one has a steel tip."
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/762_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/rifle_308/ap

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY

	size = 0.04
	value = 2.4

	penetrations = 1

/obj/item/bullet_cartridge/rifle_308/du
	name = "\improper DU .308 rifle bullet"
	desc_extended = "For rifles that require .308. This one has a DU tip."
	rarity = RARITY_UNCOMMON
	value_burgerbux = 1
	damage_type_bullet = /damagetype/ranged/bullet/rifle_308/du
	value = 4.8
	penetrations = 2
/obj/item/bullet_cartridge/rifle_308/nato/du
	name = "\improper DU 7.62mm rifle bullet"
	desc = "The choice for Marksmen and Machinegunners. This one has a DU tip."
	desc_extended = "For rifles that require 7.62mm"
	rarity = RARITY_UNCOMMON
	value_burgerbux = 1
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/du
	value = 2.2
	penetrations = 2

/obj/item/bullet_cartridge/rifle_308/nato
	name = "\improper 7.62mm rifle bullet"
	desc = "The choice for Marksmen and Machinegunners."
	desc_extended = "For rifles that require 7.62mm"
	icon = 'icons/obj/item/bullet/762.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm
	value = 1.1

/obj/item/bullet_cartridge/rifle_308/nato/surplus
	name = "\improper surplus .308 rifle cartridge"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/surplus
	jam_chance = 1
	value = 0

/obj/item/bullet_cartridge/rifle_308/nato/premium
	name = "\improper premium 7.62mm rifle bullet"
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/premium
	value = 5

/obj/item/bullet_cartridge/rifle_308/nato/ap
	name = "\improper AP 7.62mm rifle bullet"
	rarity = RARITY_UNCOMMON
	desc_extended = "For rifles that require 7.62mm. This one has a steel tip."
	icon = 'icons/obj/item/bullet/762_ap.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/ap
	value = 2.2

/obj/item/bullet_cartridge/rifle_308/short
	name = "\improper 7.62x39mmR Soviet rifle bullet"
	desc = "Kalashnikov's Magnum Opus."
	desc_extended = "For soviet rifles that require 7.62x39mm"
	icon = 'icons/obj/item/bullet/762_short.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/short

	bullet_diameter = 7.62
	bullet_length = 39

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY*0.9

	value = 1.3

/obj/item/bullet_cartridge/rifle_308/short/surplus
	name = "\improper surplus 7.62x39mmR Soviet rifle cartridge"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/short/surplus
	jam_chance = 1
	value = 0

/obj/item/bullet_cartridge/rifle_308/long
	name = "\improper 7.62x54mmR Soviet rifle bullet"
	desc = "Killed more Fascists than any competing round!"
	desc_extended = "For rifles that require 7.62mmx54mmR"
	icon = 'icons/obj/item/bullet/762.dmi'
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/long

	bullet_length = 54

	value = 1.4

/obj/item/bullet_cartridge/rifle_308/long/surplus
	name = "\improper surplus 7.62x54mmR Soviet rifle cartridge"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_762mm/long/surplus
	jam_chance = 1
	value = 0

/obj/item/bullet_cartridge/rifle_223
	name = "\improper .223 rifle bullet"
	desc = "The round of choice for soldier cosplayers."
	desc_extended = "For rifles and machineguns that requre .223."
	icon = 'icons/obj/item/bullet/223.dmi'

	bullet_diameter = 5.56
	bullet_length = 45
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_223

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	size = 0.03
	value = 1.1

/obj/item/bullet_cartridge/rifle_223/surplus
	name = "\improper surplus .223 rifle cartridge"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_223/surplus
	jam_chance = 1
	value = 0

/obj/item/bullet_cartridge/rifle_223/ap
	name = "\improper .223 AP rifle bullet"
	rarity = RARITY_UNCOMMON
	desc_extended = "For rifles and machineguns that requre .223. This one has an armor piercing tip."
	icon = 'icons/obj/item/bullet/223_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/rifle_223/ap

	size = 0.03
	value = 2.2

	penetrations = 1

/obj/item/bullet_cartridge/rifle_223/du
	name = "\improper .223 DU rifle bullet"
	desc_extended = "For rifles that require .223. This one has a depleted uranium tip."
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/rifle_223/du
	projectile_speed = BULLET_SPEED_RIFLE_HEAVY
	value = 4.4
	penetrations = 2


/obj/item/bullet_cartridge/rifle_223/nato
	name = "\improper 5.56mm rifle bullet"
	desc = "The poodle shooter's favorite."
	desc_extended = "For rifles and machineguns that requre 5,56mm."
	rarity = RARITY_COMMON

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	value = 0.9

/obj/item/bullet_cartridge/rifle_223/nato/surplus
	name = "\improper surplus 5.56mm rifle bullet"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/surplus
	jam_chance = 1
	value = 0


/obj/item/bullet_cartridge/rifle_223/nato/premium
	name = "\improper premium 5.56mm rifle bullet"
	rarity = RARITY_RARE
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/premium
	value = 3

/obj/item/bullet_cartridge/rifle_223/nato/caseless
	name = "\improper 5.56mm caseless rifle bullet"
	desc = "The poodle shooter's favorite. Now in caseless!"
	desc_extended = "For rifles and machineguns that requre 5,56mm. This doesn't leave a case."
	rarity = RARITY_UNCOMMON

	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	value = 1

	caseless = TRUE

/obj/item/bullet_cartridge/rifle_223/caseless/surplus
	name = "\improper surplus 5.56mm rifle bullet"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/surplus
	jam_chance = 1
	value = 0



/obj/item/bullet_cartridge/rifle_223/nato/ap
	name = "\improper 5.56mm AP rifle bullet"
	rarity = RARITY_UNCOMMON
	desc_extended = "For rifles and machineguns that requre 5,56mm. This one has an armor piercing tip."
	icon = 'icons/obj/item/bullet/223_ap.dmi'

	damage_type_bullet = /damagetype/ranged/bullet/rifle_556mm/ap

	size = 0.03
	value = 2.2





/obj/item/bullet_cartridge/rifle_545mm
	name = "\improper 5.45mm rifle bullet"
	desc = "Smaller than 7.62x39, but boy does it leave a nasty wound!"
	desc_extended = "For rifles and machineguns that require 5.45mm."
	icon = 'icons/obj/item/bullet/223.dmi'

	bullet_diameter = 5.45
	bullet_length = 39
	bullet_color = COLOR_BULLET


	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_545mm

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	value = 1

/obj/item/bullet_cartridge/rifle_545mm/surplus
	name = "\improper surplus 5.45mm rifle bullet"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_545mm/surplus
	jam_chance = 1
	value = 0

/obj/item/bullet_cartridge/rifle_545mm/ap
	name = "\improper 5.45mm AP rifle bullet"
	desc = "Smaller than 7.62x39, but boy does it leave a nasty wound! Now comes with a shiny tombac-plated jacket!"
	desc_extended = "For rifles and machineguns that require 5,45mm. This one has an armor piercing tip."
	rarity = RARITY_UNCOMMON
	icon = 'icons/obj/item/bullet/223_ap.dmi'

	bullet_diameter = 5.45
	bullet_length = 39
	bullet_color = COLOR_BULLET


	amount_max = 5
	amount_max_icon = 5

	projectile = /obj/projectile/bullet/firearm/rifle
	damage_type_bullet = /damagetype/ranged/bullet/rifle_545mm/ap

	projectile_speed = BULLET_SPEED_RIFLE_LIGHT

	value = 2.2

	penetrations = 1

/obj/item/bullet_cartridge/rifle_939mm
	name = "\improper 9x39mm subsonic rifle bullet"
	desc = "Be vewy, vewy quiet."
	desc_extended = "For rifles that require 9x39mm."
	icon = 'icons/obj/item/bullet/223.dmi'

	bullet_diameter = 9
	bullet_length = 39
	bullet_color = COLOR_BULLET

	amount_max = 5
	amount_max_icon = 5
	bullet_color = COLOR_BULLET

	projectile = /obj/projectile/bullet/firearm/pistol/stealth
	damage_type_bullet = /damagetype/ranged/bullet/rifle_939mm

	projectile_speed = BULLET_SPEED_RIFLE_HEAVY

	size = 0.04

	value = 1.8

	inaccuracy_modifier = 0.75

/obj/item/bullet_cartridge/rifle_939mm/surplus
	name = "\improper surplus 9x39mm subsonic rifle rifle bullet"
	damage_type_bullet = /damagetype/ranged/bullet/rifle_939mm/surplus
	jam_chance = 1
	value = 0
