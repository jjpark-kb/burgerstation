SUBSYSTEM_DEF(ai)
	name = "AI Subsystem"
	desc = "Controls the AI of mobs."
	priority = SS_ORDER_FIRST

	var/list/active_ai_by_z = list()
	var/list/inactive_ai_by_z = list()

	var/list/tracked_avoidance_by_z = list()

	use_time_dialation = FALSE

	tick_rate = AI_TICK

	tick_usage_max = 95

/subsystem/ai/unclog(var/mob/caller)

	for(var/z in active_ai_by_z)
		for(var/k in active_ai_by_z[z])
			var/ai/AI = k
			if(AI.owner)
				qdel(AI.owner)
			else
				qdel(AI)
	broadcast_to_clients(span("danger","Deleted all non-boss mobs and AIs."))

	return ..()

/subsystem/ai/on_life()

	for(var/z in active_ai_by_z)
		for(var/k in active_ai_by_z[z])
			var/ai/AI = k
			if(!AI)
				continue
			if(AI.qdeleting)
				log_error("WARNING: AI of type [AI.type] was dqeleting!")
				active_ai_by_z[z] -= k
				continue
			if(!AI.owner)
				log_error("WARNING: AI of type [AI.type] didn't have an owner!")
				qdel(AI)
				continue
			var/should_life = AI.should_life()
			if(should_life == null)
				log_error("WARNING: AI of type [AI.type] in [AI.owner.get_debug_name()] likely hit a runtime and was deleted, along with its owner.")
				qdel(AI.owner)
				continue
			if(!should_life)
				continue
			if(AI.on_life(tick_rate) == null)
				log_error("WARNING: AI of type [AI.type] in [AI.owner.get_debug_name()] likely hit a runtime and was deleted, along with its owner.")
				qdel(AI.owner)
				continue
			CHECK_TICK_SAFE(tick_usage_max,FPS_SERVER)

	return TRUE