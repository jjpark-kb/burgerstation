/obj/item/organ/hair
	name = "hair"
	id = BODY_HAIR_HEAD
	desc = "Yes. This is hair."
	icon_state = "none"
	worn_layer = LAYER_MOB_HAIR_HEAD

	attach_flag = BODY_HEAD

	enable_wounds = FALSE

	can_be_broken = FALSE

	enable_skin = FALSE

/obj/item/organ/hair/initialize_blends()
	. = ..()
	add_blend("hair_head", desired_color = "#FFFFFF", desired_blend = ICON_OVERLAY, desired_icon = 'icons/mob/living/advanced/hair/human_hair_head.dmi', desired_icon_state = "hair_b", desired_type = ICON_BLEND_OVERLAY, desired_should_save = TRUE, desired_layer = FLOAT_LAYER)

/obj/item/organ/hair/unattach_from_parent(var/turf/T,var/do_delete=FALSE)
	do_delete = TRUE
	. = ..()

/obj/item/organ/beard
	name = "facial hair"
	id = BODY_HAIR_FACE
	desc = "Yes, this is your facial hair."
	icon_state = "none"
	worn_layer = LAYER_MOB_HAIR_FACE

	attach_flag = BODY_HEAD

	enable_wounds = FALSE

	can_be_broken = FALSE

	enable_skin = FALSE

/obj/item/organ/beard/initialize_blends()
	. = ..()
	add_blend("hair_face", desired_color = "#FFFFFF", desired_blend = ICON_OVERLAY, desired_icon = 'icons/mob/living/advanced/hair/human_hair_face.dmi', desired_icon_state = "none", desired_type = ICON_BLEND_OVERLAY, desired_should_save = TRUE, desired_layer = FLOAT_LAYER)


/obj/item/organ/beard/unattach_from_parent(var/turf/T,var/do_delete=FALSE)
	do_delete = TRUE
	. = ..()