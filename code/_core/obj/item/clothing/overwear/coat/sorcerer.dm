/obj/item/clothing/overwear/coat/sorcerer
	name = "sorcerer's cloak"
	icon = 'icons/obj/item/clothing/suit/sorcerer_cloak.dmi'

	desc = "A sorcerer's cloak. Frequently dyed to show one's proficiency in a specific magical art."
	desc_extended = "Sorcerers commonly dye their garments based on the primary house of magic they were a part of during their schooling. The quality and upkeep of a sorcerer's robes are of high priority to a sorcerer. Those who neglect upkeep quickly find themselves with the ire of their peers."

	protected_limbs = list(BODY_TORSO,BODY_GROIN,BODY_ARM_LEFT,BODY_ARM_RIGHT)

	hidden_organs = list(
		BODY_TORSO = TRUE
	)

	armor = /armor/cloth/arcane/bonus

	size = SIZE_3

	value = 1200

	dyeable = TRUE

	additional_clothing = list(
		/obj/item/clothing/head/hat/sorcerer_hood,
		/obj/item/clothing/neck/sorcerer
	)

	mob_values_add = list(
		SKILL_MAGIC_DEFENSIVE = 3,
		SKILL_MAGIC_OFFENSIVE = 3,
		SKILL_MAGIC_SUMMONING = 3,
		SKILL_MAGIC_ENCHANTING = 3
	)

	rarity = RARITY_RARE