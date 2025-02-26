/obj/hud/button/vendor

	name = "vending button"
	icon = 'icons/hud/vendor.dmi'
	icon_state = "vendor_base"
	screen_loc = "CENTER,CENTER"

	flags_hud = FLAG_HUD_SPECIAL

	user_colors = TRUE

	maptext = "ITEM NAME HERE"

	var/obj/item/associated_item
	var/obj/structure/interactive/vending/associated_vendor
	var/associated_cost = 1

	mouse_opacity = 1

	has_quick_function = FALSE

/obj/hud/button/vendor/get_examine_list(var/mob/caller)
	if(!associated_item)
		return ..()
	return associated_item.get_examine_list(caller)

/obj/hud/button/vendor/get_examine_details_list(var/mob/caller)
	if(!associated_item)
		return ..()
	return associated_item.get_examine_details_list(caller)

/obj/hud/button/vendor/Destroy()
	associated_item = null
	return ..()

/obj/hud/button/vendor/update_overlays()

	. = ..()

	var/num_to_text = num2text(associated_cost)
	var/the_length = length(num_to_text)

	var/icon/I2 = ICON_INVISIBLE

	if(associated_vendor.accepts_item)
		var/icon/I3 = new/icon('icons/hud/numbers.dmi',"[associated_vendor.accepts_item.type]")
		I3.Shift(EAST,1)
		I2.Blend(I3,ICON_OVERLAY)

	else if(!(associated_vendor && associated_vendor.is_free))
		var/icon/I3 = new/icon('icons/hud/numbers.dmi',"T")
		I3.Shift(EAST,1)
		I2.Blend(I3,ICON_OVERLAY)

	var/x_pos_mod = 13

	if(associated_vendor && associated_vendor.is_free && associated_vendor.free_text)
		var/icon/I4 = new/icon('icons/hud/numbers.dmi',associated_vendor.free_text)
		I4.Shift(EAST,x_pos_mod)
		I4.Shift(SOUTH,2)
		I2.Blend(I4,ICON_OVERLAY)
	else
		for(var/i=1,i<=the_length,i++)
			var/letter = copytext(num_to_text,i,i+1)
			var/icon/I4 = new/icon('icons/hud/numbers.dmi',letter)
			if(letter == ".")
				x_pos_mod -= 1
			I4.Shift(EAST,x_pos_mod)
			I4.Shift(SOUTH,2)
			I2.Blend(I4,ICON_OVERLAY)
			if(letter == ".")
				x_pos_mod += 3
			else
				x_pos_mod += 4

	var/image/I4 = new/image(I2)
	I4.pixel_y = -4
	I4.pixel_x = 35
	add_overlay(I4)

	var/image/IM = new/image(associated_item.icon,associated_item.icon_state)
	IM.appearance = associated_item.appearance
	IM.pixel_x = 0
	IM.pixel_y = 4
	IM.pixel_z = 0
	IM.plane = PLANE_HUD_OBJ
	add_overlay(IM)


/obj/hud/button/vendor/update_sprite()

	. = ..()

	name = associated_item.vendor_name ? associated_item.vendor_name : associated_item.name
	desc_extended = associated_item.desc_extended

	tooltip_text = get_tooltip_text()

	maptext = name
	maptext_width = 96*2
	maptext_x = 2
	maptext_y = 2


/obj/hud/button/vendor/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	. = ..()

	if(!associated_item)
		log_error("Warning: Vendor button [src.get_debug_name()] did not have an associated_item!")
		update_owner(null)
		return


	if(.)
		var/obj/item/I = associated_vendor.purchase_item(caller,params,associated_item,associated_cost)

		if(I && !I.qdeleting)
			if(I.can_transfer_stacks_to(object))
				var/stacks_transfered = I.transfer_amount_to(object)
				if(stacks_transfered)
					caller.to_chat(span("notice","You restock \the [object.name] with [stacks_transfered] stacks."))
				else
					caller.to_chat(span("warning","You can't restock \the [src.name], it's full!"))

			if(!I.qdeleting && is_advanced(caller))
				var/mob/living/advanced/A = caller
				if(A.movement_flags & MOVEMENT_RUNNING)
					I.quick_equip(A)
				else
					A.put_in_hands(I)


/obj/hud/button/close_vendor
	name = "close vendor"
	icon_state = "close_inventory"
	screen_loc = "CENTER,CENTER"

	essential = TRUE

	flags_hud = FLAG_HUD_SPECIAL

	has_quick_function = FALSE

/obj/hud/button/close_vendor/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	. = ..()

	if(. && is_player(caller))
		var/mob/living/advanced/player/P = caller
		P.set_structure_unactive()

