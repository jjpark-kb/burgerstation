/obj/item/analyzer
	name = "analyzer"
	var/next_scan = 0
	weight = 3
	has_quick_function = TRUE //use analyzers from the belt slots
	rarity = RARITY_COMMON

/obj/item/analyzer/quick(var/mob/caller,var/atom/object,location,params)

	if(!is_living(caller))
		return FALSE

	return click_on_object(caller, object, location, null, params)


/obj/item/analyzer/proc/on_scan(var/mob/caller,var/atom/target,location,control,params)
	return TRUE


/obj/item/analyzer/proc/can_be_scanned(var/mob/caller,var/atom/target)
	return TRUE

/obj/item/analyzer/proc/can_scan(var/mob/caller,var/atom/target)
	if(next_scan >= world.time)
		caller.to_chat(span("warning","\The [src.name] is recharging, please wait!"))
		return FALSE
	return TRUE

/obj/item/analyzer/click_on_object(var/mob/caller as mob,var/atom/object,location,control,params)

	if(can_be_scanned(caller,object))
		INTERACT_CHECK
		INTERACT_DELAY(10)
		if(can_scan(caller,object))
			caller.visible_message(span("notice","\The [caller.name] scans \the [object.name]."),span("notice","You scan \the [object.name]."))
			on_scan(caller,object,location,control,params)
		return TRUE

	return ..()

