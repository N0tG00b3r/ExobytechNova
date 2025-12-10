/// ------------------------------------------------------------------------------------------ ///
/// PHOENIX COLLECTIVE IDENTIFICATON CARDS
/// ------------------------------------------------------------------------------------------ ///

/obj/item/card/id/advanced/black/phoenix
	name = "phoenix collective ID card"
	desc = "An ID card issued by the Phoenix Collective, because for some reason the rest of the galaxy hasn't bothered putting DNA locks on doors."
	trim = /datum/id_trim/phoenixcollective
	wildcard_slots = WILDCARD_LIMIT_GREY

/obj/item/card/id/advanced/black/phoenix/engie
	trim = /datum/id_trim/phoenixcollective/engie

/obj/item/card/id/advanced/black/phoenix/ert
	name = "phoenix collective responder ID"
	desc = "An ID card issued by the Phoenix Collective, because for some reason the rest of the galaxy hasn't bothered putting DNA locks on doors. This one is for use by Emergency Response Teams."
	trim = /datum/id_trim/phoenixcollective/ert
	wildcard_slots = WILDCARD_LIMIT_CENTCOM

/obj/item/card/id/advanced/black/phoenix/ert/cmdr
	name = "phoenix collective ERT-CMDR ID"
	trim = /datum/id_trim/phoenixcollective/ert/cmdr

/obj/item/card/id/advanced/black/phoenix/ert/cmdr/elite
	name = "phoenix collective elite ERT-CMDR ID"
	trim = /datum/id_trim/phoenixcollective/ert/cmdr/hvy

/obj/item/card/id/advanced/black/phoenix/ert/sec
	name = "phoenix collective ERT-SEC ID"
	trim = /datum/id_trim/phoenixcollective/ert/sec

/obj/item/card/id/advanced/black/phoenix/ert/sec/elite
	name = "phoenix collective elite ERT-SEC ID"
	trim = /datum/id_trim/phoenixcollective/ert/sec/hvy

/obj/item/card/id/advanced/black/phoenix/ert/med
	name = "phoenix collective ERT-MED ID"
	trim = /datum/id_trim/phoenixcollective/ert/med

/obj/item/card/id/advanced/black/phoenix/ert/eng
	name = "phoenix collective ERT-ENG ID"
	trim = /datum/id_trim/phoenixcollective/ert/eng

/obj/item/card/id/advanced/black/phoenix/centcom
	name = "phoenix collective centcom ID"
	desc = "An ID card issued by the Phoenix Collective, because for some reason the rest of the galaxy hasn't bothered putting DNA locks on doors. This one is for Central Command officials and representatives."
	trim = /datum/id_trim/phoenixcollective/official
	wildcard_slots = WILDCARD_LIMIT_CENTCOM

/obj/item/card/id/advanced/black/phoenix/centcom/secops
	name = "phoenix collective secops ID"
	desc = "An ID card issued by the Phoenix Collective, because for some reason the rest of the galaxy hasn't bothered putting DNA locks on doors. This one is for Sector Operations officials and representatives."
	trim = /datum/id_trim/phoenixcollective/official/secops
	wildcard_slots = WILDCARD_LIMIT_CENTCOM

/// ------------------------------------------------------------------------------------------ ///
/// PHOENIX IMPERIAL PERSONNEL OUTFITS
/// ------------------------------------------------------------------------------------------ ///

/// ASSISTANT DEFAULT OUTFIT
/datum/outfit/phoenix
	name = "Phoenix Collective Imperial"

	id = /obj/item/card/id/advanced/black/phoenix
	belt = /obj/item/modular_computer/pda/assistant
	uniform = /obj/item/clothing/under/misc/nova/utility
	shoes = /obj/item/clothing/shoes/jackboots/peacekeeper
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack/industrial/frontier_colonist
	box = /obj/item/storage/box/survival
	ears = /obj/item/radio/headset/phoenix
	l_pocket = /obj/item/gun/energy/disabler

	/// Additional radio encryption key, defaults to null
	var/additional_radio

/// ASSISTANT PLASMAMAN OUTFIT
/datum/outfit/phoenix/pm
	name = "Phoenix Collective Imperial (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security/nova
	uniform = /obj/item/clothing/under/plasmaman/black
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/explorer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/// AUTOMATIC MINDSHIELD IMPLANTING
/datum/outfit/phoenix/post_equip(mob/living/carbon/human/phoenixguy, visuals_only = FALSE)
	if(visuals_only)
		return
	var/obj/item/implant/mindshield/mindshield = new /obj/item/implant/mindshield(phoenixguy)
	mindshield.implant(phoenixguy, null, silent = TRUE)

	var/obj/item/card/id/ID = phoenixguy.wear_id
	ID.registered_name = phoenixguy.real_name
	ID.update_label()

	var/obj/item/radio/headset/R = phoenixguy.ears
	if(R && additional_radio) // null check
		R.keyslot2 = new additional_radio()
		R.recalculateChannels()

/// ENGINEERING OUTFIT
/datum/outfit/phoenix/engineer
	name = "Phoenix Collective Engineer"

	id = /obj/item/card/id/advanced/black/phoenix/engie
	belt = /obj/item/storage/belt/utility/full/powertools
	suit = /obj/item/clothing/suit/armor/vest/marine/engineer
	head = /obj/item/clothing/head/utility/hardhat/welding
	uniform = /obj/item/clothing/under/rank/engineering/engineer/nova/utility
	shoes = /obj/item/clothing/shoes/jackboots/peacekeeper
	gloves = /obj/item/clothing/gloves/chief_engineer/expeditionary_corps
	back = /obj/item/storage/backpack/industrial/frontier_colonist
	box = /obj/item/storage/box/survival/engineer
	backpack_contents = list(
		/obj/item/modular_computer/pda/engineering = 1,
		/obj/item/multitool = 1,
	)

	skillchips = list(/obj/item/skillchip/job/engineer)
	additional_radio = /obj/item/encryptionkey/headset_eng

/// ENGINEERING PLASMAMAN OUTFIT
/datum/outfit/phoenix/engineer/pm
	name = "Phoenix Collective Engineer (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security/nova
	uniform = /obj/item/clothing/under/plasmaman/black
	gloves = /obj/item/clothing/gloves/color/plasmaman/engineer
	mask = /obj/item/clothing/mask/gas/atmos/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/// ------------------------------------------------------------------------------------------ ///
/// EMERGENCY RESPONSE TEAMS
/// ------------------------------------------------------------------------------------------ ///

/datum/outfit/phoenix/ert
	name = "Phoenix ERT Base (DO NOT EQUIP)"
	id = /obj/item/card/id/advanced/black/phoenix/ert

	/// Whether or not this outfit should give x-ray eyes, defaults to false
	var/pcert_give_xray = FALSE
	/// Same as above, but for x-ray ears (wall penetrating ears)
	var/pcert_give_xears = FALSE
	/// Whether or not this outfit should give the Qani-Laaca Sensory Computer implant, defaults to false
	var/pcert_give_qani = FALSE
	/// What HUD implant this outfit should give, defaults to none
	/// 0 = do not use, 1 = medical, 2 = security, 3 = diagnostic
	var/pcert_cyber_hud = 0
	/// A list of genetic mutations we want to give this ERT outfit; default null
	var/list/pcert_gene_mods

/datum/outfit/phoenix/ert/post_equip(mob/living/carbon/human/phoenixguy, visuals_only = FALSE)
	if(visuals_only)
		return
	. = ..()

	if(phoenixguy.get_quirk(/datum/quirk/body_purist)) // we respect the choice of the collective's members
		return

	var/obj/item/organ/cyberimp/chest/nutriment/plus/nutri = new /obj/item/organ/cyberimp/chest/nutriment/plus()
	nutri.Insert(phoenixguy)

	if (pcert_give_xray)
		var/obj/item/organ/eyes/robotic/xray/xreyes = new /obj/item/organ/eyes/robotic/xray()
		xreyes.Insert(phoenixguy)
	if (pcert_give_xears)
		var/obj/item/organ/ears/cybernetic/xray/xrears = new /obj/item/organ/ears/cybernetic/xray()
		xrears.Insert(phoenixguy)
	if (pcert_give_qani)
		var/obj/item/organ/cyberimp/sensory_enhancer/qlaca = new /obj/item/organ/cyberimp/sensory_enhancer()
		qlaca.Insert(phoenixguy)

	if(pcert_cyber_hud > 0)
		var/obj/item/organ/cyberimp/cyberhud
		switch(pcert_cyber_hud)
			if(1)
				cyberhud = new /obj/item/organ/cyberimp/eyes/hud/medical()
			if(2)
				cyberhud = new /obj/item/organ/cyberimp/eyes/hud/security()
			if(3)
				cyberhud = new /obj/item/organ/cyberimp/eyes/hud/diagnostic()

		if(cyberhud) // sanity check
			cyberhud.Insert(phoenixguy)
		else
			CRASH("phoenix ERT outfit could not find cyberhud with ID [pcert_cyber_hud] what the fuck are you doing, ABORTING")

	if(pcert_gene_mods) // AKA: "pissing off exobytech simulator"
		for(var/datum/mutation/M as anything in pcert_gene_mods)
			var/mutagen = M
			phoenixguy.dna.add_mutation(mutagen, MUTATION_SOURCE_ACTIVATED, 0)

/datum/outfit/phoenix/ert/command
	name = "Phoenix Collective ERT - Commander"

	id = /obj/item/card/id/advanced/black/phoenix/ert/cmdr
	belt = /obj/item/storage/medkit/frontier/phoenix/stocked
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/dna_pin
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/command
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert/cmdr
	glasses = /obj/item/clothing/glasses/hud/health/night
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/plasma_marksman = 1,
		/obj/item/ammo_box/magazine/pulse/extended = 3,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = 2,
		/obj/item/storage/box/alienhandcuffs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

	pcert_cyber_hud = 2

/datum/outfit/phoenix/ert/command/elite
	name = "Phoenix Collective ERT - Cmd-Elite"

	id = /obj/item/card/id/advanced/black/phoenix/ert/cmdr/elite
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/prenerf/tweaked
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/plasma_marksman = 1,
		/obj/item/ammo_box/magazine/pulse/extended = 3,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = 2,
		/obj/item/storage/box/alienhandcuffs = 1,
		/obj/item/storage/box/fragnades = 1,
		/obj/item/storage/box/flashbangs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)

	pcert_give_xray = TRUE;
	pcert_give_xears = TRUE;
	pcert_give_qani = TRUE;
	pcert_gene_mods = list(/datum/mutation/inexorable, /datum/mutation/adaptation/thermal,
		/datum/mutation/adaptation/pressure, /datum/mutation/strong, /datum/mutation/stimmed);

/datum/outfit/phoenix/ert/command/pm
	name = "Phoenix Collective ERT - Commander (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/command/elite/pm
	name = "Phoenix Collective ERT - Cmd-Elite (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/security
	name = "Phoenix Collective ERT - Security"

	id = /obj/item/card/id/advanced/black/phoenix/ert/sec
	belt = /obj/item/storage/medkit/frontier/phoenix/stocked
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/dna_pin
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/security
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert
	glasses = /obj/item/clothing/glasses/hud/health/night
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	mask = /obj/item/clothing/mask/gas/sechailer
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pulse/extended = 4,
		/obj/item/gun/energy/disabler/smg = 1,
		/obj/item/storage/box/alienhandcuffs = 1,
		/obj/item/storage/box/flashbangs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/ert/security/elite
	name = "Phoenix Collective ERT - Sec-Elite"

	id = /obj/item/card/id/advanced/black/phoenix/ert/sec/elite
	suit_store = /obj/item/gun/ballistic/automatic/pulse_rifle/phoenix/prenerf/tweaked
	backpack_contents = list(
		/obj/item/ammo_box/magazine/pulse/extended = 6,
		/obj/item/storage/box/fragnades = 1,
		/obj/item/storage/box/flashbangs = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)

	pcert_give_xray = TRUE;
	pcert_give_xears = TRUE;
	pcert_give_qani = TRUE;
	pcert_gene_mods = list(/datum/mutation/inexorable, /datum/mutation/adaptation/thermal,
		/datum/mutation/adaptation/pressure, /datum/mutation/strong, /datum/mutation/stimmed);

/datum/outfit/phoenix/ert/security/pm
	name = "Phoenix Collective ERT - Security (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/security/elite/pm
	name = "Phoenix Collective ERT - Sec-Elite (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/medic
	name = "Phoenix Collective ERT - Medical"

	id = /obj/item/card/id/advanced/black/phoenix/ert/med
	belt = /obj/item/storage/belt/medical/ert
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/medbeam
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/medical/surgical
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert
	glasses = /obj/item/clothing/glasses/hud/health/night
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/storage/medkit/frontier/phoenix/stocked = 1,
		/obj/item/storage/medkit/frontier/phoenix/toxin/stocked = 1,
		/obj/item/storage/medkit/frontier/phoenix/oxygen/stocked = 1,
		/obj/item/bodybag/stasis = 2,
		/obj/item/gun/ballistic/automatic/pistol/plasma_thrower = 1,
		/obj/item/ammo_box/magazine/recharge/plasma_battery = 3,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/ert/medic/pm
	name = "Phoenix Collective ERT - Medical (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/datum/outfit/phoenix/ert/engie
	name = "Phoenix Collective ERT - Engineering"

	id = /obj/item/card/id/advanced/black/phoenix/ert/eng
	belt = /obj/item/storage/belt/utility/full/powertools/ircd
	suit = /obj/item/clothing/suit/armor/vest/sol/marine/mk2
	suit_store = /obj/item/gun/ballistic/automatic/napad/rapidfire
	head = /obj/item/clothing/head/helmet/solfed/mk2
	uniform = /obj/item/clothing/under/rank/security/nova/utility
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/engineer
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/ert
	glasses = /obj/item/clothing/glasses/hud/health/night
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/melee/energy/sword/saber/red
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/ammo_box/magazine/napad = 6,
		/obj/item/lightreplacer/blue = 1,
		/obj/item/multitool = 1,
		/obj/item/storage/box/nri_flares = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

	skillchips = list(/obj/item/skillchip/job/engineer)
	pcert_cyber_hud = 3

/datum/outfit/phoenix/ert/engie/pm
	name = "Phoenix Collective ERT - Engineering (Plasmaman)"

	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	uniform = /obj/item/clothing/under/plasmaman/security
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	mask = /obj/item/clothing/mask/gas/sechailer/plasmaman
	r_pocket = /obj/item/tank/internals/plasmaman/belt/full

/// ------------------------------------------------------------------------------------------ ///
/// CENTRAL COMMAND AND SECTOR OPERATIONS
/// ------------------------------------------------------------------------------------------ ///
/datum/outfit/phoenix/centcom
	name = "Phoenix Collective CentCom Official"

	id = /obj/item/card/id/advanced/black/phoenix/centcom
	belt = null
	suit = /obj/item/clothing/suit/armor/vest/darkcarapace
	suit_store = null
	uniform = /obj/item/clothing/under/rank/captain/nova/utility
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/mod/control/pre_equipped/phoenix
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/cc
	glasses = /obj/item/clothing/glasses/hud/medsechud
	l_pocket = /obj/item/melee/energy/sword/saber/red
	backpack_contents = list(
		/obj/item/gun/energy/disabler = 1,
		/obj/item/gun/ballistic/automatic/pistol/clandestine/unrestricted = 1,
		/obj/item/ammo_box/magazine/m10mm = 3,
		/obj/item/flashlight/seclite = 1,
		/obj/item/beamout_tool = 1,
		/obj/item/modular_computer/pda/ceti = 1,
	)
	l_hand = null
	r_hand = null

/datum/outfit/phoenix/centcom/secops
	name = "Phoenix Collective SecOps Official"
	id = /obj/item/card/id/advanced/black/phoenix/centcom/secops

/datum/outfit/phoenix/centcom/secops/cutefrisk
	name = "Phoenix SecOps - Azrefrisk Dreemurr"

	id = /obj/item/card/id/advanced/black/phoenix/centcom/secops
	belt = /obj/item/storage/belt/utility/chief
	suit = /obj/item/clothing/suit/armor/vest/darkcarapace
	suit_store = null
	head = null
	uniform = /obj/item/clothing/under/rank/security/head_of_security/nova/alt
	shoes = /obj/item/clothing/shoes/winterboots/ice_boots/eva
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/phoenix/engineer/cutefrisk
	box = /obj/item/storage/box/survival/centcom
	ears = /obj/item/radio/headset/phoenix/cc
	glasses = /obj/item/clothing/glasses/hud/diagnostic/night
	mask = /obj/item/clothing/mask/gas/sechailer
	l_pocket = /obj/item/storage/bag/sheetsnatcher/debug
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double
	backpack_contents = list(
		/obj/item/storage/part_replacer/bluespace/randomitems = 1,
		/obj/item/storage/toolbox/guncase/nova/opfor/phoenix/pulserifle/def/cutefrisk = 1,
		/obj/item/storage/box/phoenixcc/azre = 1,
		/obj/item/storage/box/cables = 1,
		/obj/item/modular_computer/pda/heads/rd = 1,
		/obj/item/stock_parts/power_store/cell/infinite/abductor = 1,
		/obj/item/dualsaber/purple = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/beamout_tool = 1,
	)
	belt_contents = list(
		/obj/item/weldingtool/experimental = 1,
		/obj/item/construction/rcd/ce = 1,
		/obj/item/crowbar/power = 1,
		/obj/item/construction/rtd/loaded = 1,
		/obj/item/construction/rld = 1,
		/obj/item/pipe_dispenser/bluespace = 1,
		/obj/item/analyzer/ranged = 1,
	)
	l_hand = null
	r_hand = null

	skillchips = list(/obj/item/skillchip/job/engineer)

/datum/outfit/phoenix/centcom/secops/cutefrisk/post_equip(mob/living/carbon/human/phoenixguy, visuals_only = FALSE)
	if(visuals_only)
		return
	. = ..()

	var/obj/item/organ/cyberimp/arm/toolkit/toolset/engtools = new /obj/item/organ/cyberimp/arm/toolkit/toolset()
	var/obj/item/organ/cyberimp/chest/nutriment/plus/nutri = new /obj/item/organ/cyberimp/chest/nutriment/plus()
	var/obj/item/organ/cyberimp/chest/spine/spinal = new /obj/item/organ/cyberimp/chest/spine()
	engtools.Insert(phoenixguy)
	nutri.Insert(phoenixguy)
	spinal.Insert(phoenixguy)
