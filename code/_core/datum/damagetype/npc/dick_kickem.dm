/damagetype/npc/dick_kickem
	attack_verbs = list("dick kick")

	impact_sounds = list(
		'sound/weapons/fists/cqc/crashing_wave_kick.ogg',
	)

	hit_effect = /obj/effect/temp/impact/combat/punch

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		PAIN = 60*0.2,
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		PAIN = 0,
	)

	attribute_stats = list(
		ATTRIBUTE_STRENGTH = 60*0.4
	)

	attribute_damage = list(
		ATTRIBUTE_STRENGTH = PAIN
	)

	skill_stats = list(
		SKILL_UNARMED = 60*0.2
	)

	skill_damage = list(
		SKILL_UNARMED = PAIN
	)

	attack_delay = 14*0.5
	attack_delay_max = 14

/damagetype/npc/dick_kickem/post_on_hit(var/atom/attacker,var/atom/victim,var/atom/weapon,var/atom/hit_object,var/atom/blamed,var/total_damage_dealt=0)

	if(is_living(victim))
		var/list/offsets = get_directional_offsets(attacker,victim)
		var/mob/living/L = victim
		if(get_dist(attacker,victim) <= 0)
			L.add_status_effect(STUN,20,20,source = attacker)
		else
			L.throw_self(attacker,null,16,16,offsets[1]*12,offsets[2]*12,lifetime=5)

	if(is_living(attacker))
		var/mob/living/L = attacker
		L.add_status_effect(STUN,20,20)

	return ..()