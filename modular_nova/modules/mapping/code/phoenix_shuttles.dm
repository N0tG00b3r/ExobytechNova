/*----- PHOENIX COLLECTIVE - SHUTTLE GLOBAL VARIABLES -----*/
#define MORRIGI_SPACE_AMBIENCE_PATH "modular_nova/master_files/sound/ambience/morrambi1.ogg"
	
/*----- End of PHOENIX SHUTTLE GLOBAL VARIABLES Code -----*/

/*----- PHOENIX COLLECTIVE - "PERSONAL WHITESHIP" Shuttle Code -----*/
/datum/map_template/shuttle/whiteship/personalshuttle_phoenix
	suffix = "personalshuttle_phoenix"
	name = "Phoenix Collective Shuttle"
	description = "A retrofitted and upgraded version of the Personal Travel Shuttle, utilized by Phoenix Collective officials and non-emergency crews."
	admin_notes = "Has super fucking overpowered shit, you really shouldn't spawn this for non-admins."
/*----- End of PHOENIX WHITESHIP Shuttle Code -----*/

/*----- PHOENIX COLLECTIVE - "AXION PARIAH" Shuttle Code -----*/
/area/shuttle/phoenix
	name = "Axion Pariah"

	/// If the Morrigi space ambient from SOTS 2 should be attached to the end of the ambient soundscape for this zone. Defaults to false.
	var/is_morrigi_space = FALSE

/area/shuttle/phoenix/Initialize(mapload)
	if (ambience_index == AMBIENCE_GENERIC && is_morrigi_space)
		is_morrigi_space = FALSE // so that we don't accidentally double trigger
		ambientsounds = list(MORRIGI_SPACE_AMBIENCE_PATH)

	. = ..()

	if(is_morrigi_space)
		ambientsounds += MORRIGI_SPACE_AMBIENCE_PATH

/datum/map_template/shuttle/planetary/phoenix
	prefix = "_maps/shuttles/nova/phoenix/"
	suffix = "phoenix_arrival_shuttle"
	name = "\"Axion Pariah\" Phoenix Collective Transport Shuttle"
	description = "An unarmed non-military space shuttle for transport of Phoenix Collective Imperials and/or civilian crews."

/datum/map_template/shuttle/planetary/phoenix/axionlocked
	prefix = "_maps/shuttles/nova/phoenix/"
	suffix = "phoenix_arrival_shuttle_station"
	name = "Station-Locked \"Axion Pariah\" Phoenix Collective Transport Shuttle"
	description = "This Axion Pariah has been modified to be locked to a station's arrivals dock and transfer satellite."
	admin_notes = "Doesn't function properly on maps other than Dark Phoenix."

/obj/machinery/computer/shuttle/phoenix
	name = "\improper Axion Pariah control console"
	desc = "Used to control an Axion Pariah model shuttle."
	circuit = /obj/item/circuitboard/computer/phoenix
	shuttleId = "phoenix_arrival_shuttle"
	possible_destinations = "phoenix_general_custom;phoenix_general_home;phoenix_arrivals_stationary;phoenix_arrivals_transfer;whiteship_home;whiteship_lavaland;\
		ferry_home;syndicate_ne;syndicate_nw;syndicate_n;syndicate_se;syndicate_sw;syndicate_s"
	req_access = list(ACCESS_CENT_GENERAL)

/obj/machinery/computer/shuttle/phoenix/axionlocked
	circuit = /obj/item/circuitboard/computer/phoenix/axionlocked
	shuttleId = "phoenix_arrival_shuttle_station"
	possible_destinations = "phoenix_arrivals_stationary; phoenix_arrivals_transfer"
	req_access = null

/obj/machinery/computer/camera_advanced/shuttle_docker/phoenix
	name = "\improper Axion Pariah navigation computer"
	desc = "The navigation console for an Axion Pariah model shuttle."
	shuttleId = "phoenix_arrival_shuttle"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "phoenix_general_custom"
	jump_to_ports = list( "phoenix_general_home" = 1, "ferry_home" = 1, "syndicate_ne" = 1, "syndicate_nw" = 1, "syndicate_n" = 1, "syndicate_se" = 1,
		"syndicate_sw" = 1, "syndicate_s" = 1, )
	view_range = 12
	zlink_range = 1
	move_up_action = /datum/action/innate/camera_multiz_up
	move_down_action = /datum/action/innate/camera_multiz_down
	req_access = list(ACCESS_CENT_GENERAL)

/obj/item/circuitboard/computer/phoenix
	name = "Axion Pariah Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/phoenix

/obj/item/circuitboard/computer/phoenix/axionlocked
	name = "Station-Locked Axion Pariah Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/phoenix/axionlocked

/obj/item/gps/computer/space/phoenix
	name = "\improper Phoenix Collective GPS transponder"
	icon = 'modular_nova/modules/mapping/icons/machinery/gps_computer_x32.dmi'	//needs its own file for pixel size ;-;
	gpstag = "*PC - AXIPAR"
	pixel_y = 0

/*----- End of AXION PARIAH Shuttle Code -----*/

/*----- PHOENIX COLLECTIVE - "BLACK KNIFE" Shuttle Code -----*/
/area/shuttle/phoenix/ert
	name = "Black Knife"
	requires_power = TRUE
	is_morrigi_space = TRUE

/area/shuttle/phoenix/ert/common
	name = "Black Knife Common Room"

/area/shuttle/phoenix/ert/engine
	ambience_index = AMBIENCE_MAINT
	forced_ambience = TRUE
	ambient_buzz = 'sound/ambience/maintenance/source_corridor2.ogg'
	ambient_buzz_vol = 20

/area/shuttle/phoenix/ert/engine/left
	name = "Black Knife Left Engine Maintenance"

/area/shuttle/phoenix/ert/engine/right
	name = "Black Knife Right Engine Maintenance"

/area/shuttle/phoenix/ert/medbay
	name = "Black Knife Emergency Medbay"
	ambience_index = AMBIENCE_VIROLOGY

/area/shuttle/phoenix/ert/armory
	name = "Black Knife Armory"
	ambience_index = AMBIENCE_DANGER

/area/shuttle/phoenix/ert/bridge
	name = "Black Knife Bridge"

/datum/map_template/shuttle/ert/phoenix
	prefix = "_maps/shuttles/nova/phoenix/"
	suffix = "phoenix_transport"
	name = "\"Black Knife\" Phoenix Collective Imperial Shuttle"
	description = "The \"Black Knife\" Imperial shuttle is the standard for military response crews. Supplied with elite technology and \
		plenty of resources for any ERT, this is the go-to for many of the Phoenix Collective's own emergency responses. Contains crew \
		commons, a bridge w/ sleeper units, a stocked armory, and an emergency medical bay."
	admin_notes = "This is meant for military interventions and should not be used for most ERT situations. Shuttle is too large to fit in \
		the dock(s) of most stations. Use the shuttle's navigation computer where needed."

/obj/machinery/computer/shuttle/phoenix/ert
	name = "\improper Black Knife control console"
	desc = "Used to control a Black Knife model shuttle."
	circuit = /obj/item/circuitboard/computer/phoenix/ert
	shuttleId = "phoenix_ert_shuttle"
	possible_destinations = "phoenix_ert_custom;phoenix_general_custom;phoenix_general_home;whiteship_home;whiteship_lavaland;\
		ferry_home;syndicate_ne;syndicate_nw;syndicate_n;syndicate_se;syndicate_sw;syndicate_s"

/obj/item/circuitboard/computer/phoenix/ert
	name = "Black Knife Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/phoenix/ert

/obj/machinery/computer/camera_advanced/shuttle_docker/phoenix/ert
	name = "\improper Black Knife navigation computer"
	desc = "The navigation console for a Black Knife model shuttle."
	shuttleId = "phoenix_ert_shuttle"
	shuttlePortId = "phoenix_ert_custom"

/obj/item/gps/computer/space/phoenix/ert
	gpstag = "*PC - BLKNIF"

/*----- End of BLACK KNIFE Shuttle Code -----*/

/*----- PHOENIX COLLECTIVE - "APPRENTICESHIP" Shuttle & Away Mission Code -----*/
/area/awaymission/phoenix
	name = "(dev fucked up) Phoenix Away Mission"
	icon_state = "unknown"
	area_flags = EVENT_PROTECTED|LOCAL_TELEPORT|CULT_PERMITTED|UNIQUE_AREA

	/// If the Morrigi space ambient from SOTS 2 should be attached to the end of the ambient soundscape for this zone. Defaults to false.
	var/is_morrigi_space = FALSE

/area/awaymission/phoenix/Initialize(mapload)
	if (ambience_index == AMBIENCE_GENERIC && is_morrigi_space)
		is_morrigi_space = FALSE // so that we don't accidentally double trigger
		ambientsounds = list(MORRIGI_SPACE_AMBIENCE_PATH)

	. = ..()

	if(is_morrigi_space)
		ambientsounds += MORRIGI_SPACE_AMBIENCE_PATH

/area/awaymission/phoenix/tradeship
	name = "Apprenticeship"
	requires_power = TRUE
	is_morrigi_space = TRUE

/area/awaymission/phoenix/tradeship/hallway
	name = "Apprenticeship Primary Hallway"
	icon_state = "away"
	sound_environment = SOUND_ENVIRONMENT_HALLWAY

/area/awaymission/phoenix/tradeship/hallway/command
	name = "Apprenticeship Command Hallway"
	icon_state = "awaycontent16"

/area/awaymission/phoenix/tradeship/crew/dorms
	name = "Apprenticeship Crew Quarters"
	icon_state = "awaycontent5"

/area/awaymission/phoenix/tradeship/crew/bath
	name = "Apprenticeship Crew Restrooms"
	icon_state = "awaycontent6"
	sound_environment = SOUND_ENVIRONMENT_BATHROOM

/area/awaymission/phoenix/tradeship/crew/shower
	name = "Apprenticeship Crew Showers"
	icon_state = "awaycontent7"
	sound_environment = SOUND_ENVIRONMENT_BATHROOM

/area/awaymission/phoenix/tradeship/storage
	name = "Apprenticeship Primary Shipping Storage"
	icon_state = "away4"
	sound_environment = SOUND_ENVIRONMENT_HANGAR

/area/awaymission/phoenix/tradeship/storage/freight
	icon_state = "awaycontent4"
/area/awaymission/phoenix/tradeship/storage/freight/one
	name = "Apprenticeship Freight Storage A"
/area/awaymission/phoenix/tradeship/storage/freight/two
	name = "Apprenticeship Freight Storage B"

/area/awaymission/phoenix/tradeship/storage/atmos
	name = "Apprenticeship Atmos Shipping Storage"
	icon_state = "awaycontent14"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/awaymission/phoenix/tradeship/storage/bio
	name = "Apprenticeship Biological Shipping Storage"
	icon_state = "awaycontent3"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/awaymission/phoenix/tradeship/storage/ord
	name = "Apprenticeship Ordnance Shipping Storage"
	icon_state = "awaycontent1"
	sound_environment = SOUND_ENVIRONMENT_ROOM

/area/awaymission/phoenix/tradeship/maintenance
	ambience_index = AMBIENCE_MAINT
	forced_ambience = TRUE
	ambient_buzz = 'sound/ambience/maintenance/source_corridor2.ogg'
	ambient_buzz_vol = 20
	icon_state = "awaycontent18"

/area/awaymission/phoenix/tradeship/maintenance/engine
	ambience_index = AMBIENCE_ENGI
	icon_state = "awaycontent22"
	sound_environment = SOUND_ENVIRONMENT_HANGAR

/area/awaymission/phoenix/tradeship/maintenance/engine/left
	name = "Apprenticeship Aft Port Maintenance"

/area/awaymission/phoenix/tradeship/maintenance/engine/right
	name = "Apprenticeship Aft Starboard Maintenance"

/area/awaymission/phoenix/tradeship/maintenance/thrusters/left
	name = "Apprenticeship Central Port Maintenance"

/area/awaymission/phoenix/tradeship/maintenance/thrusters/right
	name = "Apprenticeship Central Starboard Maintenance"

/area/awaymission/phoenix/tradeship/maintenance/bathrooms
	name = "Apprenticeship Command Hallway Maintenance"

/area/awaymission/phoenix/tradeship/bridge
	name = "Apprenticeship Bridge"
	icon_state = "awaycontent21"

/area/shuttle/phoenix/tradeship
	name = "Apprenticeship Delivery Shuttle"

/datum/map_template/shuttle/tradership/phoenix_trade_shuttle
	prefix = "_maps/shuttles/nova/phoenix/"
	suffix = "phoenix"
	name = "\"Apprenticeship\" Phoenix Collective Trade Freighter - Delivery Shuttle"
	description = "The \"Apprenticeship\" trade freighter was designed from the ground up for hauling cargo across long distances for \
		inter-empire trade. It has also seen use as a transport for Imperial goods. The design contains space for general storage, two \
		freight storage bays, a vacuum-sealed research ordnance storage, biological storage for housing plant growers and organisms in \
		cryostasis, a set of minimal crew facilities, and two maintenance bays for engine repair. At the aft of the ship, a smaller delivery \
		shuttle is held to dock with stations and engage in the face-to-face delivery of high-value goods and services.\n\n\
		Due to their size and tendency to hold large amounts of cargo and resources, Apprenticeship freighters have become quite a target for \
		space pirates and some Syndicate groups."
	admin_notes = "NOT MEANT TO BE SPAWNED HERE - LOAD ANY PHOENIX TRADERSHIP AWAY MISSION! THIS SHUTTLE WILL SPAWN ALONGSIDE IT. Use the \
		Spawn Panel to give the ship cargo if needed."

/obj/machinery/computer/shuttle/phoenix/trader
	name = "\improper Apprenticeship shuttle control console"
	desc = "Used to control an Apprenticeship freighter's delivery shuttle."
	circuit = /obj/item/circuitboard/computer/phoenix/trader
	shuttleId = "phoenix_tradership"
	possible_destinations = "tradership_away;phoenix_trader_custom;phoenix_general_home;whiteship_home;whiteship_lavaland;ferry_home;\
		syndicate_ne;syndicate_nw;syndicate_n;syndicate_se;syndicate_sw;syndicate_s;phoenix_tradership_dock"

/obj/item/circuitboard/computer/phoenix/trader
	name = "Apprenticeship Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/phoenix/trader

/obj/machinery/computer/camera_advanced/shuttle_docker/phoenix/trader
	name = "\improper Apprenticeship shuttle navigation computer"
	desc = "The navigation console for an Apprenticeship freighter's delivery shuttle."
	shuttleId = "phoenix_tradership"
	shuttlePortId = "phoenix_trader_custom"
	jump_to_ports = list( "tradership_away" = 1, "phoenix_general_home" = 1, "ferry_home" = 1, "syndicate_ne" = 1, "syndicate_nw" = 1, "syndicate_n" = 1, "syndicate_se" = 1, "syndicate_sw" = 1, "syndicate_s" = 1, )

/obj/item/gps/computer/space/phoenix/trader
	gpstag = "*PC - APRNTC"

/*----- End of BLACK KNIFE Shuttle Code -----*/

/*----- PHOENIX COLLECTIVE - "ERISGATE" Shuttle Code -----*/
/area/shuttle/phoenix/vyra_portal
	name = "Eris' Gate"
	is_morrigi_space = TRUE

/datum/map_template/shuttle/planetary/phoenix/vyra_portal
	prefix = "_maps/shuttles/nova/phoenix/"
	suffix = "phoenix_bluegate"
	name = "\"Eris' Gate\" Phoenix Collective Portable Bluespace Shuttle"
	description = "This shuttle was designed as a mobile habitat for Icewalkers. It gets its name from Eris Vyra, the first Icewalker \
		successfully recovered and uplifted by the Phoenix Collective."
	admin_notes = "Intended as a \"place-able minisat\" to properly add the Uplifted Icewalker ghost role to maps that don't have it."

/obj/machinery/computer/shuttle/phoenix/vyra_portal
	name = "\improper Eris' Gate control console"
	desc = "Used to control a Eris' Gate model shuttle."
	circuit = /obj/item/circuitboard/computer/phoenix/vyra_portal
	shuttleId = "phoenix_vyragate"
	possible_destinations = "phoenix_vyragate_custom;phoenix_general_home;whiteship_home;whiteship_lavaland;\
		ferry_home;syndicate_ne;syndicate_nw;syndicate_n;syndicate_se;syndicate_sw;syndicate_s"

/obj/item/circuitboard/computer/phoenix/vyra_portal
	name = "Eris' Gate Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/phoenix/vyra_portal

/obj/machinery/computer/camera_advanced/shuttle_docker/phoenix/vyra_portal
	name = "\improper Eris' Gate navigation computer"
	desc = "The navigation console for a Eris' Gate model shuttle."
	shuttleId = "phoenix_vyragate"
	shuttlePortId = "phoenix_vyragate_custom"

/obj/item/gps/computer/space/phoenix/vyra_portal
	gpstag = "*PC - VYRA"

/*----- End of BLACK KNIFE Shuttle Code -----*/
