/obj/item/encryptionkey/phoenix
	name = "\improper Phoenix Collective imperial encryption key"
	icon = 'icons/map_icons/items/encryptionkey.dmi'
	icon_state = "/obj/item/encryptionkey/phoenix"
	post_init_icon_state = "cypherkey_centcom"
	channels = list(RADIO_CHANNEL_PHOENIX = 1)

/obj/item/encryptionkey/phoenix/ert
	name = "\improper Phoenix ERT imperial encryption key"
	channels = list(
		RADIO_CHANNEL_SECURITY = 1,
		RADIO_CHANNEL_ENGINEERING = 1,
		RADIO_CHANNEL_MEDICAL = 1,
		RADIO_CHANNEL_PHOENIX = 1,
	)

/obj/item/encryptionkey/phoenix/ert/cmdr
	name = "\improper Phoenix ERT command encryption key"
	special_channels = RADIO_SPECIAL_CENTCOM
	channels = list(
		RADIO_CHANNEL_COMMAND = 1,
		RADIO_CHANNEL_SECURITY = 1,
		RADIO_CHANNEL_ENGINEERING = 1,
		RADIO_CHANNEL_MEDICAL = 1,
		RADIO_CHANNEL_CENTCOM = 1,
		RADIO_CHANNEL_PHOENIX = 1,
	)

/obj/item/encryptionkey/phoenix/centcom
	name = "\improper Phoenix CentCom imperial encryption key"
	special_channels = RADIO_SPECIAL_CENTCOM
	channels = list(
		RADIO_CHANNEL_COMMAND = 1,
		RADIO_CHANNEL_SECURITY = 1,
		RADIO_CHANNEL_ENGINEERING = 1,
		RADIO_CHANNEL_SCIENCE = 0,
		RADIO_CHANNEL_MEDICAL = 1,
		RADIO_CHANNEL_SUPPLY = 0,
		RADIO_CHANNEL_SERVICE = 0,
		RADIO_CHANNEL_CENTCOM = 1,
		RADIO_CHANNEL_PHOENIX = 1,
	)
