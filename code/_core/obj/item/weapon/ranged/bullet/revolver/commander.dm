/obj/item/weapon/ranged/bullet/revolver/commander
	name = "\improper .44 Commander Autorevolver"
	desc = "Semi-automatic!"
	desc_extended = "A revolver that uses a blowback recoil system to recock the hammer. Was initially made in small numbers for gun collectors and shooting enthusiasts, but has since become commonplace everywhere."
	icon = 'icons/obj/item/weapons/ranged/revolver/44.dmi'
	icon_state = "inventory"
	value = 1200

	company_type = "Solarian"

	tier = 3

	shoot_delay = 2

	automatic = FALSE

	bullet_count_max = 6

	shoot_sounds = list('sound/weapons/revolver_heavy/shoot.ogg')

	size = SIZE_2
	weight = 9

	bullet_length_min = 10
	bullet_length_best = 29
	bullet_length_max = 30

	bullet_diameter_min = 10
	bullet_diameter_best = 10.9
	bullet_diameter_max = 11

	heat_max = 0.06

	attachment_whitelist = list(
		/obj/item/attachment/barrel/charger = TRUE, /obj/item/attachment/barrel/charger/advanced = TRUE,
		/obj/item/attachment/barrel/compensator = TRUE,
		/obj/item/attachment/barrel/extended = TRUE,
		/obj/item/attachment/barrel/gyro = TRUE,
		/obj/item/attachment/barrel/laser_charger = FALSE,
		/obj/item/attachment/barrel/suppressor = FALSE,
		/obj/item/attachment/barrel_mod/reinforced_barrel = TRUE,
		/obj/item/attachment/stock_mod/reinforced_stock = TRUE,

		/obj/item/attachment/sight/laser_sight = TRUE,
		/obj/item/attachment/sight/quickfire_adapter = TRUE,
		/obj/item/attachment/sight/red_dot = TRUE,
		/obj/item/attachment/sight/scope = TRUE,
		/obj/item/attachment/sight/scope/large = TRUE,
		/obj/item/attachment/sight/targeting_computer = TRUE,



		/obj/item/attachment/undermount/angled_grip = TRUE,
		/obj/item/attachment/undermount/bipod = TRUE,
		/obj/item/attachment/undermount/burst_adapter = FALSE,
		/obj/item/attachment/undermount/vertical_grip = TRUE
	)

	attachment_barrel_offset_x = 32 - 16
	attachment_barrel_offset_y = 19 - 16

	attachment_sight_offset_x = 9 - 16
	attachment_sight_offset_y = 19 - 16

	attachment_undermount_offset_x = 28 - 16
	attachment_undermount_offset_y = 15 - 16



	inaccuracy_modifier = 0.5
	movement_inaccuracy_modifier = 0.5
	movement_spread_base = 0.08

/obj/item/weapon/ranged/bullet/revolver/commander/get_static_spread()
	return 0

/obj/item/weapon/ranged/bullet/revolver/commander/get_skill_spread(var/mob/living/L)
	return max(0,0.01 - (0.01 * L.get_skill_power(SKILL_RANGED)))