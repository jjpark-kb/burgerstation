/obj/structure/interactive/construction/frame
	name = "frame"
	desc = "A metal frame."
	desc_extended = "Could make a lattice with some rods, or a girder with some sheets."
	icon_state = "frame"

	health_base = 25

/obj/structure/interactive/construction/frame/proc/can_construct_girder(var/mob/caller,var/obj/item/material/sheet/S)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(S)

	if(!istype(src.loc,/turf/simulated/floor/plating/))
		caller.to_chat(span("warning","You need to build plating before you can build a girder!"))
		return FALSE
	if(S.amount < 1)
		caller.to_chat(span("warning","You need a sheet in order to build a frame!"))
		return FALSE
	if(S.material_id != material_id)
		caller.to_chat(span("warning","You don't have the correct material for this!"))
		return FALSE
	return TRUE

/obj/structure/interactive/construction/frame/on_destruction(var/mob/caller,var/damage = FALSE)
	create_destruction(get_turf(src),list(/obj/item/material/rod/ = 1),material_id)
	. = ..()
	qdel(src)

/obj/structure/interactive/construction/frame/proc/construct_girder(var/mob/caller,var/obj/item/material/sheet/S)
	var/obj/structure/interactive/construction/girder/G = new(src.loc)
	G.material_id = S.material_id
	G.color = S.color
	INITIALIZE(G)
	GENERATE(G)
	caller?.to_chat(span("notice","You place \the [G.name]."))
	S.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/frame/proc/can_construct_lattice(var/mob/caller,var/obj/item/material/rod/R)

	INTERACT_CHECK_NO_DELAY(src)
	INTERACT_CHECK_NO_DELAY(R)

	if(R.amount < 1)
		caller.to_chat(span("warning","You need a rod in order to build a frame!"))
		return FALSE
	if(R.material_id != material_id)
		caller.to_chat(span("warning","You don't have the correct material for this!"))
		return FALSE
	return TRUE

/obj/structure/interactive/construction/frame/proc/construct_lattice(var/mob/caller,var/obj/item/material/rod/R)
	var/obj/structure/interactive/construction/lattice/L = new(src.loc)
	L.material_id = R.material_id
	L.color = R.color
	INITIALIZE(L)
	GENERATE(L)
	FINALIZE(L)
	caller?.to_chat(span("notice","You place \the [L.name]."))
	R.add_item_count(-1)
	qdel(src)
	return TRUE

/obj/structure/interactive/construction/frame/clicked_on_by_object(var/mob/caller,var/atom/object,location,control,params)

	if(is_item(object))
		var/obj/item/I = object
		if(I.flags_tool & FLAG_TOOL_WIRECUTTER)
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			src.on_destruction(caller)
			return TRUE
		if(istype(object,/obj/item/material/rod/))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			PROGRESS_BAR(caller,src,SECONDS_TO_DECISECONDS(1),.proc/construct_lattice,caller,object)
			PROGRESS_BAR_CONDITIONS(caller,src,.proc/can_construct_lattice,caller,object)
			return TRUE
		if(istype(object,/obj/item/material/sheet/))
			INTERACT_CHECK
			INTERACT_CHECK_OBJECT
			INTERACT_DELAY(10)
			PROGRESS_BAR(caller,src,SECONDS_TO_DECISECONDS(1),.proc/construct_girder,caller,object)
			PROGRESS_BAR_CONDITIONS(caller,src,.proc/can_construct_girder,caller,object)
			return TRUE

	return ..()
