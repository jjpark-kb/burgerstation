/loot/syndie
	loot_table = list(
		/obj/item/container/simple/beaker/flask/engraved = 50,
		/obj/item/tempering/quality/ranged = 70,
		/loot/misc/food = 40,
		/loot/misc/drink = 40,
		/loot/misc/baking = 20,
		/obj/item/container/healing/trauma_kit/advanced = 20,
		/obj/item/container/healing/burn_kit/advanced = 20,
		/obj/item/storage/pillbottle/dylovene_small = 20,
		/obj/item/storage/pillbottle/iron_small = 20,
		/obj/item/storage/kit/small/advanced/filled = 20,
		/obj/item/grenade/fuse/fragmentation = 40,
		/loot/scroll/lesser = 10,
		/obj/item/data_laptop = 5
	)
	loot_count = 4
/loot/syndie/vault //what spawns in syndie vaults. Should be good kush. Mayhaps a low chance at boss loot.
	loot_table = list(
		/loot/syndie/vault/sniper_20 = 5,
		/loot/scroll = 20,
		/obj/item/clothing/back/storage/backpack/bluespace = 1,
		/obj/item/clothing/back/storage/satchel/bluespace = 1,
		/obj/item/clothing/belt/holding = 1,
		/loot/misc/ingots = 10,
		/loot/misc/sheets = 10,
		/obj/item/weapon/ranged/energy/opticor = 1,
		/obj/item/weapon/ranged/bullet/revolver/grenade_launcher/multibarrel = 10,
		/obj/item/bullet_cartridge/rocket_70mm/nuclear = 20,
		/obj/item/bullet_cartridge/grenade_40mm/du = 20,
		/obj/item/coin/cursed = 20,
		/obj/item/magazine/minigun_46/du = 15,
		/obj/item/currency/telecrystals{amount=10} = 10,

	)
	loot_count = 6

/loot/syndie/vault/sniper_20

	loot_table_guaranteed = list(
		/obj/item/weapon/ranged/bullet/magazine/rifle/sniper_20
	)

	loot_table = list(
		/obj/item/magazine/sniper_20mm = 100
	)
	loot_count = 4
	chance_none = 20
