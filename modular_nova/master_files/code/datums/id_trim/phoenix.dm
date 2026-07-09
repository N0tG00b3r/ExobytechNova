/datum/id_trim/phoenixcollective
	trim_icon = 'modular_nova/master_files/icons/obj/card.dmi'
	assignment = "Phoenix Collective Imperial"
	trim_state = "trim_phoenix"
	department_color = COLOR_ASSISTANT_GRAY
	subdepartment_color = COLOR_WHITE
	sechud_icon_state = SECHUD_ASSISTANT

/datum/id_trim/phoenixcollective/engie
	access = list(ACCESS_ENGINEERING, ACCESS_ATMOSPHERICS, ACCESS_MAINT_TUNNELS, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_TCOMMS, ACCESS_EXTERNAL_AIRLOCKS)
	assignment = "PCI-IND Station Engineer"
	department_color = COLOR_ENGINEERING_ORANGE
	sechud_icon_state = SECHUD_STATION_ENGINEER

/datum/id_trim/phoenixcollective/medical
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_MORGUE_SECURE, ACCESS_PHARMACY, ACCESS_SURGERY)
	assignment = "PCI-DHS Medical Doctor"
	department_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_MEDICAL_DOCTOR
/datum/id_trim/phoenixcollective/medical/rank2
	assignment = "PCI-DHS Senior Medical Officer"
	subdepartment_color = COLOR_HEALING_CYAN
	sechud_icon_state = SECHUD_PARAMEDIC
/datum/id_trim/phoenixcollective/medical/rank2/New()
	. = ..()
	access += list(ACCESS_PLUMBING, ACCESS_VIROLOGY, ACCESS_PARAMEDIC)

/// Lets be real if the ERT variant of these guys are coming, ya'll are (beyond) cooked
/datum/id_trim/phoenixcollective/ert
	assignment = "PCI Emergency Response Trooper"
	department_color = LIGHT_COLOR_INTENSE_RED
	threat_modifier = -10 // This counts as military intervention
	sechud_icon_state = SECHUD_SPACE_POLICE

/datum/id_trim/phoenixcollective/ert/cmdr
	assignment = "PCI-DD Responsory Commander"
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = SECHUD_EMERGENCY_RESPONSE_TEAM_COMMANDER

/datum/id_trim/phoenixcollective/ert/sec
	assignment = "PCI-DD Responsory Trooper"
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_SECURITY_RESPONSE_OFFICER

/datum/id_trim/phoenixcollective/ert/med
	assignment = "PCI-DHS Responsory Medic"
	subdepartment_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_MEDICAL_RESPONSE_OFFICER

/datum/id_trim/phoenixcollective/ert/eng
	assignment = "PCI-IND Responsory Engineer"
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	sechud_icon_state = SECHUD_ENGINEERING_RESPONSE_OFFICER

/datum/id_trim/phoenixcollective/ert/death
	assignment = "PCI-DMO Terminus Operative"
	department_color = COLOR_CRAYON_BLACK
	sechud_icon_state = SECHUD_DEATH_COMMANDO

/datum/id_trim/phoenixcollective/ert/cmdr/hvy
	assignment = "PCI-DMO Field Commander"

/datum/id_trim/phoenixcollective/ert/sec/hvy
	assignment = "PCI-DMO Elite"

/datum/id_trim/phoenixcollective/ert/New()
	. = ..()
	access = SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION))

/// Not a soft ERT variant, this is CentCom lol
/datum/id_trim/phoenixcollective/official
	assignment = "Phoenix Collective Central Command"
	sechud_icon_state = SECHUD_SOLFED_LIASON
	department_color = COLOR_STRONG_VIOLET
	subdepartment_color = COLOR_ORANGE
	threat_modifier = -10 // CentCom are 'legally' allowed to do whatever the fuck they want. Allegedly.

/// Alternate variant for PC Sector Operations
/datum/id_trim/phoenixcollective/official/secops
	assignment = "Phoenix Collective Sector Operations"
	subdepartment_color = LIGHT_COLOR_FLARE

/datum/id_trim/phoenixcollective/official/New()
	. = ..()
	access = SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION))
