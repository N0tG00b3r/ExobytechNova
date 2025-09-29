/// Marele Maestru's cultists. Glory to Peace.
/mob/living/basic/trooper/marcultist
	name = "Heretic Peacekeeper"
	desc = "Laturcae! Alatabae! Ectonae!"
	faction = list(FACTION_HERETIC)
	corpse = /obj/effect/mob_spawn/corpse/human/marcultist
	mob_spawner = /obj/effect/mob_spawn/corpse/human/marcultist
	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 0
	var/projectile_deflect_chance = 0

/mob/living/basic/trooper/syndicate/melee/bullet_act(obj/projectile/projectile)
	if(prob(projectile_deflect_chance))
		visible_message(span_danger("[src] blocks [projectile] with its shield!"))
		return BULLET_ACT_BLOCK
	return ..()

/mob/living/basic/trooper/marcultist/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_SPACEWALK, INNATE_TRAIT)

/// Ranged Enemies Setup
/mob/living/basic/trooper/marcultist/ranged
	corpse = /obj/effect/gibspawner/human
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged
	r_hand = /obj/item/gun/ballistic/automatic/pistol
	/// Type of bullet we use
	var/casingtype = /obj/item/ammo_casing/c9mm
	/// Type of bullet we use (projectile ver.)
	var/projectiletype
	/// Sound to play when firing weapon
	var/projectilesound = 'sound/items/weapons/gun/pistol/shot.ogg'
	/// number of burst shots
	var/burst_shots
	/// Time between taking shots
	var/ranged_cooldown = 1 SECONDS

/mob/living/basic/trooper/marcultist/ranged/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = casingtype,\
		projectile_type = projectiletype,\
		projectile_sound = projectilesound,\
		cooldown_time = ranged_cooldown,\
		burst_shots = burst_shots,\
	)
	if (ranged_cooldown <= 1 SECONDS)
		AddComponent(/datum/component/ranged_mob_full_auto)

/// Actually interesting ranged enemies
/mob/living/basic/trooper/marcultist/ranged/plaspistol
	casingtype = null
	projectiletype = /obj/projectile/beam/laser/plasma_glob/pulse
	projectilesound = 'modular_nova/modules/modular_weapons/sounds/laser_firing/incinerate.ogg'
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	burst_shots = 3
	ranged_cooldown = 3 SECONDS
	r_hand = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower
	maxHealth = 150
	health = 150

/mob/living/basic/trooper/marcultist/ranged/pulserifle
	casingtype = null
	projectiletype = /obj/projectile/beam/pulse
	projectilesound = 'modular_nova/modules/modular_weapons/sounds/pulse_shoot.ogg'
	ai_controller = /datum/ai_controller/basic_controller/trooper/ranged/burst
	burst_shots = 3
	ranged_cooldown = 2 SECONDS
	r_hand = /obj/item/gun/ballistic/automatic/pulse_rifle
	maxHealth = 175
	health = 175

/mob/living/basic/trooper/marcultist/ranged/pulsesniper
	casingtype = null
	projectiletype = /obj/projectile/beam/pulse/heavy
	projectilesound = 'modular_nova/modules/modular_weapons/sounds/pulse_shoot.ogg'
	ranged_cooldown = 4 SECONDS
	r_hand = /obj/item/gun/ballistic/rifle/pulse_sniper
	maxHealth = 140
	health = 140