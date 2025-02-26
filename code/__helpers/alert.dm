#define within_range(point_A,point_B,range) (point_A.z == point_B.z && get_dist(point_A,point_B) <= range)

/proc/create_alert_process(var/list/list_to_use,var/range = VIEW_RANGE,var/atom/epicenter,var/atom/alert_source,var/alert_level = ALERT_LEVEL_NOISE,var/visual=FALSE)

	if(!epicenter)
		CRASH("No epicenter provided for create_alert_process()!")

	for(var/k in list_to_use)
		var/ai/AI = k
		if(!AI || AI.qdeleting || !AI.owner || AI.owner.qdeleting || AI.owner.dead || AI.objective_attack)
			continue
		if(!within_range(AI.owner,epicenter,VIEW_RANGE+ZOOM_RANGE))
			continue
		if(visual && !is_facing_cheap(AI.owner,epicenter))
			continue
		if(alert_source && !AI.is_enemy(alert_source,FALSE))
			continue
		CALLBACK("alert_level_change_\ref[AI]",CEILING(AI.reaction_time,1),AI,/ai/proc/set_alert_level,alert_level,FALSE,epicenter,alert_source)

/proc/create_alert(var/range = VIEW_RANGE,var/turf/epicenter,var/atom/alert_source,var/alert_level = ALERT_LEVEL_NOISE,var/visual=FALSE)

	if(!epicenter)
		CRASH("create_alert() had no epicenter!")

	if(epicenter.z == 0)
		CRASH("create_alert() had a non-turf as an epicenter!")

	var/z = "[epicenter.z]"

	create_alert_process(SSbossai.inactive_ai_by_z[z],range,epicenter,alert_source,alert_level,visual)
	create_alert_process(SSai.inactive_ai_by_z[z],range,epicenter,alert_source,alert_level,visual)
	create_alert_process(SSbossai.active_ai_by_z[z],range,epicenter,alert_source,alert_level,visual)
	create_alert_process(SSai.active_ai_by_z[z],range,epicenter,alert_source,alert_level,visual)

	return TRUE