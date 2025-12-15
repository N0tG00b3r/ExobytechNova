/// Outfit Datum + Init
/datum/outfit/job/uplifted_catgirl
	name = "Icemoon Dweller (Uplifted)"

	id = /obj/item/card/id
	id_trim = /datum/id_trim/job/assistant
	jobtype = /datum/job/primitive_catgirl_uplifted
	box = /obj/item/storage/box/survival
	
	head = /obj/item/clothing/head/primitive_catgirl_ferroniere
	mask = /obj/item/clothing/mask/neck_gaiter/primitive_catgirl_gaiter
	uniform = /obj/item/clothing/under/misc/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/primitive_catgirl_boots
	gloves = /obj/item/clothing/gloves/fingerless/primitive_catgirl_armwraps
	suit = /obj/item/clothing/suit/jacket/primitive_catgirl_coat
	neck = /obj/item/clothing/neck/scarf/primitive_catgirl_scarf
	ears = /obj/item/radio/headset
	l_pocket = /obj/item/modular_computer/pda/ceti
	r_pocket = /obj/item/flashlight/lantern

	back = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/forging/reagent_weapon/axe/fake_copper = 1,
		/obj/item/ore_sensor = 1,
	)
	belt = /obj/item/storage/belt/mining/primitive
	belt_contents = list(
		/obj/item/pickaxe/mini = 1,
		/obj/item/storage/bag/ore = 1,
		/obj/item/flashlight/flare = 1,
	)

/// Ghost Role Spawner
/obj/effect/mob_spawn/ghost_role/human/primitive_catgirl_uplifted
	name = "stabilized bluespace gate"
	desc = "A stabilized bluespace transport gateway leading to... somewhere icemoon-smelling?"
	prompt_name = "an Assistant (as uplifted icemoon dweller)"
	icon = 'icons/obj/anomaly.dmi'
	icon_state = "portal"
	mob_species = /datum/species/human/felinid/primitive
	outfit = /datum/outfit/job/uplifted_catgirl
	density = FALSE
	you_are_text = "You are an uplifted icemoon dweller."
	flavour_text = "Previously, an icemoon was your home. \
		It was the home of your ancestors, and their ancestors, and the ones before them. \
		At some point in your past, however, you (willingly or otherwise) escaped the confines \
		of the moon of your spawning, and have since been educated in the ways of a once strange \
		new world. Now, the station's crew consider you one of their own. (OOC: This variant of the \
		Icewalker / Icemoon Dweller / Primitive Demihuman role can speak and understand both \
		Sol Common, Terran English, and Spacer in addition to Ættmál and Siik'tajr.)"
	spawner_job_path = /datum/job/primitive_catgirl_uplifted
	interaction_flags_mouse_drop = NEED_DEXTERITY

	/// The team the spawner will assign players to and use to keep track of people that have already used the spawner
	var/datum/team/primitive_catgirls_uplifted/team

	restricted_species = list(/datum/species/human/felinid/primitive)
	quirks_enabled = TRUE
	allow_custom_character = GHOSTROLE_TAKE_PREFS_APPEARANCE
	loadout_enabled = TRUE
	uses = 12
	deletes_on_zero_uses_left = FALSE

/obj/effect/mob_spawn/ghost_role/human/primitive_catgirl_uplifted/Initialize(mapload)
	. = ..()
	team = new /datum/team/primitive_catgirls_uplifted()

	important_text = "You are not an antagonist, ahelp before antagonizing station crew. \
		You will need to consult the Head of Personnel to get a job."

/obj/effect/mob_spawn/ghost_role/human/primitive_catgirl_uplifted/Destroy()
	team = null
	return ..()

/obj/effect/mob_spawn/ghost_role/human/primitive_catgirl_uplifted/allow_spawn(mob/user, silent = FALSE)
	if(!(user.ckey in team.players_spawned)) // One spawn per person
		return TRUE
	if(!silent)
		to_chat(user, span_warning("It'd be weird if there were multiple of you in that cave, wouldn't it? ...wait a minute."))
	return FALSE

/// This stuff (USED TO BE) put on equip because it turns out /special sometimes just don't get called because Nova
/// ...and then allowing loadouts and preferences caused equip to no longer get called.
/// We need to make sure that the character is fully created BEFORE we apply all our adjustments, so that's why create is used here
/obj/effect/mob_spawn/ghost_role/human/primitive_catgirl_uplifted/create(mob/mob_possessor, newname, apply_prefs)
	var/mob/living/spawned_mob = ..() // make sure character is fully created, get its reference or whatev

	if(ishuman(spawned_mob))
		var/mob/living/carbon/human/spawned_human = spawned_mob

		// Uplifted: Kitty with a wage, what they buying?
		var/datum/bank_account/bank_account = new(spawned_human.real_name, src)
		bank_account.payday(STARTING_PAYCHECKS, TRUE)
		bank_account.replaceable = FALSE
		spawned_human.add_mob_memory(/datum/memory/key/account, remembered_id = bank_account.account_id)
	
		var/obj/item/card/id/ID = spawned_human.wear_id
		if(ID) // sanity check
			ID.registered_name = spawned_human.real_name
			ID.update_label()
			ID.registered_account = bank_account
			bank_account.bank_cards += ID

		// Uplifted: Grant extra languages and set Sol Common as the default language.
		spawned_human.grant_language(/datum/language/common, source = LANGUAGE_MIND)
		spawned_human.grant_language(/datum/language/spacer, source = LANGUAGE_MIND)
		spawned_human.grant_language(/datum/language/solfed, source = LANGUAGE_MIND)
		spawned_human.set_active_language(/datum/language/common)
	
		// Apply antag role (not part of uplift)
		spawned_human.mind.add_antag_datum(/datum/antagonist/primitive_catgirl_uplifted, team)
		team.players_spawned += (spawned_human.ckey)

/obj/effect/mob_spawn/ghost_role/human/primitive_catgirl_uplifted/mouse_drop_receive(mob/living/carbon/human/target, mob/user, params)
	if(!istype(target))
		return
	if(!isprimitivedemihuman(target) || target.buckled)
		return

	to_chat(user, span_danger("This isn't a sleeping hole. This is... a SUPER hole. \
		Actually no, wait, it's just that bluespace thing you were taught about. \
		Regardless, kin cannot be put back to sleep here."))

/datum/job/primitive_catgirl_uplifted
	title = "Uplifted Icewalker"
	faction = FACTION_STATION
	exp_granted_type = EXP_TYPE_CREW
	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CIV
	supervisors = SUPERVISOR_HOP

	family_heirlooms = list(
		/obj/item/screwdriver/ashwalker, /obj/item/wirecutters/ashwalker, /obj/item/secateurs/ashwalker, /obj/item/crowbar/ashwalker,

		/obj/item/scalpel/ashwalker, /obj/item/cautery/ashwalker, /obj/item/surgicaldrill/ashwalker, /obj/item/retractor/ashwalker,
		/obj/item/hemostat/ashwalker, /obj/item/bonesetter/ashwalker,

		/obj/item/forging/hammer/primitive, /obj/item/forging/tongs/primitive, /obj/item/forging/billow/primitive
	)

	mail_goodies = list(
		/obj/effect/spawner/random/exotic/snow_gear = 30,
		/obj/effect/spawner/random/vendor_meal_sides/yangyu = 23,
		/obj/item/food/butterbiscuit = 16,
		/obj/item/food/grown/icepepper = 3,

		/obj/item/stack/sheet/hairlesshide{amount = 5} = 26,
		/obj/item/stack/sheet/mineral/wood{amount = 5} = 22,
		/obj/item/stack/sheet/bone{amount = 5} = 22,
		/obj/item/stack/stone{amount = 5} = 22,
		/obj/item/stack/sheet/cobolterium/three = 20,
		/obj/item/stack/sheet/copporcitite/three = 20,
		/obj/item/stack/sheet/leather/five = 18,
		/obj/item/smelling_salts = 8,
		/obj/item/xenoarch/useless_relic = 6,

		/obj/item/secateurs/ashwalker = 3,
		/obj/item/crowbar/ashwalker = 3,
		/obj/item/screwdriver/ashwalker = 2,
		/obj/item/wirecutters/ashwalker = 2,
		/obj/item/forging/hammer/primitive = 1,
		/obj/item/forging/tongs/primitive = 1,
		/obj/item/forging/billow/primitive = 1,

		/obj/item/stack/spacecash/c100 = 5,
	)

	allow_bureaucratic_error = FALSE
	random_spawns_possible = FALSE
	job_flags = JOB_ANNOUNCE_ARRIVAL|JOB_CREW_MANIFEST|JOB_CREW_MEMBER|JOB_CANNOT_OPEN_SLOTS|JOB_ASSIGN_QUIRKS|JOB_LATEJOIN_ONLY

/// Antag and team datums
/datum/team/primitive_catgirls_uplifted
	name = "Uplifted Icewalkers"
	member_name = "Uplifted Icemoon Dweller"
	show_roundend_report = FALSE

/datum/team/primitive_catgirls_uplifted/roundend_report()
	var/list/report = list()

	report += span_header("An Ice Walker Tribe was integrated into the crew...</span><br>")
	if(length(members))
		report += "The [member_name]s were:"
		report += printplayerlist(members)
	else
		report += "<b>But none of its members ever arrived on station!</b>"

	return "<div class='panel redborder'>[report.Join("<br>")]</div>"

/// Antagonist datum
/datum/antagonist/primitive_catgirl_uplifted
	name = "\improper Uplifted Icewalker"
	pref_flag = ROLE_LAVALAND // If you're ashwalker banned you should also not be playing this, other way around as well
	show_in_antagpanel = FALSE
	show_to_ghosts = TRUE
	antagpanel_category = "Uplifted Icewalkers"
	antag_flags = ANTAG_FAKE | ANTAG_SKIP_GLOBAL_LIST
	show_in_roundend = FALSE

	/// Tracks the antag datum's 'team' for showing in the ghost orbit menu
	var/datum/team/primitive_catgirls_uplifted/feline_team

	antag_recipes = list(
		/datum/crafting_recipe/anointing_oil,
		/datum/crafting_recipe/black_pelt_bed,
		/datum/crafting_recipe/boneaxe,
		/datum/crafting_recipe/bonedagger,
		/datum/crafting_recipe/bonespear,
		/datum/crafting_recipe/frozen_breath,
		/datum/crafting_recipe/handcrafted_hearthkin_armor,
		/datum/crafting_recipe/hearthkin_ship_fragment_inactive,
		/datum/crafting_recipe/runic_greataxe,
		/datum/crafting_recipe/runic_greatsword,
		/datum/crafting_recipe/runic_spear,
		/datum/crafting_recipe/skeleton_key,
		/datum/crafting_recipe/white_pelt_bed,
	)

/datum/antagonist/primitive_catgirl_uplifted/Destroy()
	feline_team = null
	return ..()

/datum/antagonist/primitive_catgirl_uplifted/create_team(datum/team/team)
	if(team)
		feline_team = team
		objectives |= feline_team.objectives
	else
		feline_team = new

/datum/antagonist/primitive_catgirl_uplifted/get_team()
	return feline_team
