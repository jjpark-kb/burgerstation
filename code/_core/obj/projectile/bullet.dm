/obj/projectile/bullet/
	name = "bullet"
	impact_effect_turf = /obj/effect/temp/impact/bullet
	collision_bullet_flags = FLAG_COLLISION_BULLET_SOLID

	muzzleflash_effect = /obj/effect/temp/muzzleflash/
	alpha = 255

/obj/projectile/bullet/update_icon()
	. = ..()
	color = bullet_color

/obj/projectile/bullet/bolt
	name = "crossbow bolt"
	icon = 'icons/obj/projectiles/bolt.dmi'
	icon_state = "bolt"
	muzzleflash_effect = null

/obj/projectile/bullet/arrow
	name = "arrow"
	icon = 'icons/obj/projectiles/arrow.dmi'
	icon_state = "normal"
	muzzleflash_effect = null

/obj/projectile/bullet/arrow/ashen
	name = "arrow"
	icon = 'icons/obj/projectiles/arrow.dmi'
	icon_state = "ashen"

/obj/projectile/bullet/arrow/hardlight
	name = "arrow"
	icon = 'icons/obj/projectiles/arrow.dmi'
	icon_state = "hardlight"

/obj/projectile/bullet/tungsten
	name = "tungsten bolt"
	icon = 'icons/obj/projectiles/bolt.dmi'
	icon_state = "tungsten"

/obj/projectile/bullet/syringe
	name = "launched syringe"
	icon = 'icons/obj/projectiles/bolt.dmi'
	icon_state = "syringe"
	var/reagent_to_add = /reagent/medicine/omnizine
	var/volume_to_add = 15

/obj/projectile/bullet/syringe/Initialize()
	. = ..()
	var/reagent/R = REAGENT(reagent_to_add)
	hostile = R.lethal

/obj/projectile/bullet/syringe/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)

	. = ..()

	if(. && is_living(hit_atom))
		var/mob/living/L = hit_atom
		if(L.reagents)
			L.reagents.add_reagent(reagent_to_add,volume_to_add,caller=owner)
		return TRUE


/obj/projectile/bullet/HE_40M

	icon = 'icons/obj/projectiles/explosive.dmi'
	icon_state = "HE"
	hit_target_turf = TRUE

/obj/projectile/bullet/HE_40M/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()
	if(.)
		explode(old_loc,4,owner,weapon,iff_tag,multiplier = 1.5)
/obj/projectile/bullet/HV_40M
	icon = 'icons/obj/projectiles/explosive.dmi'
	icon_state = "HV"

/obj/projectile/bullet/HV_40M/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()
	if(.)
		explode(old_loc,2,owner,weapon,iff_tag)

/obj/projectile/bullet/DU_40M
	icon = 'icons/obj/projectiles/explosive.dmi'
	icon_state = "DU"

/obj/projectile/bullet/DU_40M/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()
	if(.)
		explode(old_loc,6,owner,weapon,iff_tag,multiplier = 1.5)

/obj/projectile/bullet/RUBBER_40M
	icon = 'icons/obj/projectiles/explosive.dmi'
	icon_state = "RUBBER"

/obj/projectile/bullet/RUBBER_40M/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()

/obj/projectile/bullet/rocket_he

	icon = 'icons/obj/projectiles/rocket.dmi'
	icon_state = "rocket_he"
	hit_target_turf = TRUE

/obj/projectile/bullet/rocket_he/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()
	if(. && old_loc)
		explode(old_loc,6,owner,weapon,iff_tag,multiplier = 5)

/obj/projectile/bullet/rocket_nuclear

	icon = 'icons/obj/projectiles/rocket.dmi'
	icon_state = "rocket_nuke"
	hit_target_turf = TRUE

/obj/projectile/bullet/rocket_nuclear/on_projectile_hit(var/atom/hit_atom)
	. = ..()
	if(.)
		explode(get_turf(hit_atom),10,owner,weapon,iff_tag)

/obj/projectile/bullet/rocket_ap

	icon = 'icons/obj/projectiles/rocket.dmi'
	icon_state = "rocket_ap"

/obj/projectile/bullet/rocket_ap/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()
	if(. && old_loc)
		explode(old_loc,3,owner,weapon,iff_tag)

/obj/projectile/bullet/rocket_wp

	icon = 'icons/obj/projectiles/rocket.dmi'
	icon_state = "rocket_wp"

/obj/projectile/bullet/rocket_wp/update_projectile(var/tick_rate=1)
	. = ..()
	if(.)
		vel_x *= 0.99
		vel_y *= 0.99
		alpha = clamp(alpha-5,0,255)

		if(abs(vel_x) <= 1	&& abs(vel_y) <= 1)
			on_projectile_hit(current_loc)
			return FALSE

/obj/projectile/bullet/rocket_wp/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()
	if(. && old_loc)
		explode(old_loc,3,owner,weapon,iff_tag,multiplier = 2)

/obj/projectile/bullet/rocket_wp/on_enter_tile(var/turf/old_loc,var/turf/new_loc)
	. = ..()
	var/obj/effect/temp/hazard/flamethrowerfire = locate() in new_loc

	if(!flamethrowerfire)
		new /obj/effect/temp/hazard/flamethrowerfire(new_loc,SECONDS_TO_DECISECONDS(30),owner)

/obj/projectile/bullet/gyrojet
	name = "gyrojet"
	icon = 'icons/obj/projectiles/rocket.dmi'
	icon_state = "gyrojet"

/obj/projectile/bullet/gyrojet/on_projectile_hit(var/atom/hit_atom,var/turf/old_loc,var/turf/new_loc)
	. = ..()
	if(. && old_loc)
		explode(old_loc,3,owner,weapon,iff_tag)


/obj/projectile/bullet/gyrojet/update_projectile(var/tick_rate=1)

	. = ..()

	if(.)

		var/vel_x_change = vel_x * 0.05
		var/vel_y_change = vel_y * 0.05

		if(prob(50))
			vel_x += clamp(vel_y_change * rand(-1,1),-(TILE_SIZE-1),TILE_SIZE-1)

		if(prob(50))
			vel_y += clamp(vel_x_change * rand(-1,1),-(TILE_SIZE-1),TILE_SIZE-1)

		if(abs(vel_x) <= 1	&& abs(vel_y) <= 1)
			on_projectile_hit(current_loc)
			return FALSE

/obj/projectile/bullet/Fiendish
	name = "bullet"
	icon = 'icons/obj/projectiles/laser.dmi'
	icon_state = "ion"


/obj/projectile/bullet/flintlock
	name = "bullet"
	icon = 'icons/obj/projectiles/flintlock.dmi'
	icon_state = "iron"