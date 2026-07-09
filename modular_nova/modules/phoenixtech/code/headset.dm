/obj/item/radio/headset/phoenix
	name = "Phoenix Collective imperial headset"
	desc = "A headset used by Phoenix Collective imperials. Protects ears from flashbangs."
	icon_state = "sec_headset_alt"
	worn_icon_state = "sec_headset_alt"
	keyslot = /obj/item/encryptionkey/phoenix
	radio_talk_sound = 'modular_nova/modules/radiosound/sound/radio/syndie.ogg' /// it sounds cool

/obj/item/radio/headset/phoenix/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection)

/obj/item/radio/headset/phoenix/ert
	keyslot = /obj/item/encryptionkey/phoenix/ert

/obj/item/radio/headset/phoenix/ert/cmdr
	keyslot = /obj/item/encryptionkey/phoenix/ert/cmdr
	command = TRUE

/obj/item/radio/headset/phoenix/cc
	name = "Phoenix Collective CentCom headset"
	desc = "A headset used by Phoenix Collective Central Command staff. Protects ears from flashbangs."
	keyslot = /obj/item/encryptionkey/phoenix/centcom
	command = TRUE
