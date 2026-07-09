/obj/item/stock_parts/power_store/cell/phoenix_crystal
	name = "rechargeable crystal battery"
	desc = "A containment unit housing and cycling voltage through a high-power plasma crystal. It recharges \
		slower than other power cells to prevent the crystal inside from undergoing spontaneous exothermic reaction."
	icon = 'modular_nova/modules/aesthetics/cells/icons/cell.dmi'
	icon_state = "crybscell"
	charging_icon = "crybscell_in"
	emp_damage_modifier = 5
	maxcharge = STANDARD_CELL_CHARGE * 50
	chargerate = STANDARD_CELL_RATE * 0.5
	connector_type = null

/** EXOBYTECHNOVA - TEMPORARY REMOVAL
/obj/item/stock_parts/power_store/cell/phoenix_crystal/grind_atom(datum/reagents/target_holder, mob/user)
	/// process regular grind logic to destroy item
	. = ..()
	/// then BOOM MOTHAFUCKA!!!
	to_chat(user, span_danger("The internal plasma crystal violently reacts and combusts! ...Dumbass."))
	var/turf/epicenter = get_turf(user.mob)
	dyn_explosion(epicenter, 2.5)
	/// exploding is not grinding, so
	return FALSE
*/
