/mob/living/advanced/npc/unique/pirate_captain
	name = "Captain Condom"
	boss_icon_state = "captain"
	desc = "The one and only."
	desc = "The infamous Captain Condom. They lead a skeleton crew of murderous skeletons called the murderboners. Given their high status, they seem to be immune from everything, including Space Law and Stuns."
	species = "skeleton"
	sex = MALE
	gender = MALE
	boss_music = /track/skeletons
	boss = TRUE
	ai = /ai/advanced/skeleton

	health_base = 6000

	fatigue_mul = 0

	loyalty_tag = "Skeleton"
	iff_tag = "Skeleton"

	status_immune = list(
		STUN = TRUE,
		SLEEP = TRUE,
		PARALYZE = TRUE,
		STAMCRIT = TRUE,
		STAGGER = TRUE,
		CONFUSED = TRUE,
		DISARM = TRUE,
		GRAB = TRUE,
		PAINCRIT = TRUE
	)

	var/next_revive = 0

	soul_size = SOUL_SIZE_RARE

	blood_type = null

	level = 70

	loadout = /loadout/pirate/captain

/mob/living/advanced/npc/unique/pirate_captain/on_life_slow()

	. = ..()

	if(. && ai && ai.active && next_revive <= world.time)

		var/list/possible_targets = list()

		for(var/mob/living/advanced/L in view(VIEW_RANGE,src))
			if(!L.dead)
				continue
			if(L.loyalty_tag != src.loyalty_tag)
				continue
			possible_targets += src

		if(length(possible_targets))
			var/mob/living/advanced/A = pick(possible_targets)

			src.shoot_projectile(
				src,
				A,
				null,
				null,
				/obj/projectile/magic/rift/revive,
				/damagetype/ranged/magic/fireball,
				16,
				16,
				0,
				TILE_SIZE*0.25,
				1,
				"#FFFFFF",
				0,
				1,
				null,
				src.loyalty_tag
			)

			next_revive = world.time + SECONDS_TO_DECISECONDS(5)

/mob/living/advanced/npc/unique/pirate_mate
	name = "HOS COOL"
	desc = "THE FUCKING COOLEST."
	desc_extended = "Captain Condom's second in command, but we all know he's the one in charge."
	species = "skeleton"
	sex = MALE
	gender = MALE

	health_base = 1000

	loyalty_tag = "Skeleton"
	iff_tag = "Skeleton"
	ai = /ai/advanced/skeleton

	level = 60

	blood_type = null

	loadout = /loadout/pirate/mate

	status_immune = list(
		STUN = TRUE,
		SLEEP = TRUE,
		PARALYZE = TRUE,
		STAMCRIT = TRUE,
		STAGGER = TRUE,
		CONFUSED = TRUE,
		DISARM = TRUE,
		GRAB = TRUE,
		PAINCRIT = TRUE
	)

/mob/living/advanced/npc/pirate_crew
	name = "skeleton crew"
	desc = "RATTLE ME BONES."
	desc = "A skeleton pirate belonging to Captain Condom's crew of pirates."
	species = "skeleton"
	sex = MALE
	gender = MALE
	loadout = /loadout/pirate/crew


	loyalty_tag = "Skeleton"
	iff_tag = "Skeleton"
	ai = /ai/advanced/skeleton

	level = 18

	blood_type = null


/mob/living/advanced/npc/pirate_crew/ranged
	name = "skeleton crew marksman"
	loadout = /loadout/pirate/crew/ranged

	level = 24

/mob/living/advanced/npc/pirate_crew/magic
	name = "skeleton crew mage"
	loadout = /loadout/pirate/crew/magic

	level = 32

/mob/living/advanced/npc/pirate_crew/melee
	name = "skeleton crew brawler"
	loadout = /loadout/pirate/crew/melee

	level = 24


/mob/living/advanced/npc/pirate_crew/ninja
	name = "skeleton crew ninja"
	loadout = /loadout/pirate/crew/ninja

	level = 32