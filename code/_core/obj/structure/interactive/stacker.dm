/obj/structure/interactive/stacker
	name = "stacker"
	desc = "Stacks things."
	desc_extended = "Stacks things and attempts to stack them to their maximum item count size."
	icon = 'icons/obj/structure/stacking.dmi'
	icon_state = "stacker"

	pixel_y = 2

	bullet_block_chance = 50

	density = TRUE

	desired_light_power = 0.25
	desired_light_range = 2
	desired_light_color = "#0000FF"

/obj/structure/interactive/stacker/Crossed(atom/movable/O)
	stack(O)
	return ..()

/obj/structure/interactive/stacker/proc/stack(var/atom/movable/O)

	if(!is_item(O))
		return FALSE

	var/obj/item/I = O
	if(I.amount_max <= 1)
		return FALSE
	if(I.amount >= I.amount_max)
		return FALSE

	I.drop_item(src)

	for(var/obj/item/E in contents) //E for existing
		if(I.can_transfer_stacks_to(E))
			I.transfer_amount_to(E)
			if(E.amount == E.amount_max)
				E.drop_item(src.loc)
			break

	return TRUE

/obj/structure/interactive/stacker/clicked_on_by_object(mob/caller, atom/object, location, control, params)
	if(istype(object,/obj/item))
		var/obj/item/T = object
		if(T.flags_tool & FLAG_TOOL_WRENCH)
			if(anchored)
				caller.to_chat(span("notice","You un-anchor the stacker."))
				anchored = FALSE
			else
				caller.to_chat(span("notice","You anchor the stacker."))
				anchored = TRUE
	else
		for(var/obj/item/T in contents)
			T.drop_item(get_turf(caller))
		caller.to_chat(span("notice","You empty the stacker."))
	. = ..()
