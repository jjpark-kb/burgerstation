/obj/structure/interactive/lighting/fixture/floor
	name = "tube light"
	desc = "An electrical storm has been detected in proximity of the station. Please check all equipment for potential overloads."
	desc_extended = "Used to light up the area."

	icon = 'icons/obj/structure/light_floor.dmi'

	plane = PLANE_FLOOR_ATTACHMENT
	layer = 1000
	color = COLOR_LIGHT_BULB

	desired_light_power = 0.25
	desired_light_range = 7
	desired_light_color = null //Set in update_icon


/obj/structure/interactive/lighting/fixture/floor/strong
	desired_light_power = 0.4
	desired_light_range = 8

/obj/structure/interactive/lighting/fixture/floor/stronger
	desired_light_power = 0.5
	desired_light_range = 16

/obj/structure/interactive/lighting/fixture/floor/stronger/rcd/Finalize()
	. = ..()
	new /light_source(src)
	desired_light_color = color
	update_sprite()
	update_atom_light()
	update_icon()


/obj/structure/interactive/lighting/fixture/floor/color
	name = "colored light"
	color = "#FFFFFF"

	desired_light_power = 1
	desired_light_range = 3


/obj/structure/interactive/lighting/fixture/floor/color/turf/Initialize()

	if(loc)
		color = loc.color
		name = loc.color

	return ..()

/obj/structure/interactive/lighting/fixture/floor/syndicate
	color = "#FFBABA"
	color_frame = "#666666"
