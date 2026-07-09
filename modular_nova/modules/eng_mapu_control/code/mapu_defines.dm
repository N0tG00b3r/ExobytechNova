/// ------------------------------------------------------------------------------------------ ///
/// ATMOSPHERIC THRESHOLDS
/// ------------------------------------------------------------------------------------------ ///

// The minimum atmos pressure that an MAPU's tile can be at before its energy production begins to stall, in kPA
#define MAPU_ATMOS_KPA_STALL_THRESHOLD 10

// The maximum atmos temperature that an MAPU's tile can be at before it starts spouting "temperature too high" warnings
#define MAPU_ATMOS_TEMP_WARNING_THRESHOLD 8000
// The maximum atmos temperature that an MAPU's tile can be at before it starts losing superstructure integrity from direct atmos damage
// Station is force-set to orange alert if not already at that alert level or higher when this temperature is reached
#define MAPU_ATMOS_TEMP_DAMAGE_THRESHOLD 30000

/// ------------------------------------------------------------------------------------------ ///
/// MATTER-ANTIMATTER ENERGY SATURATION THRESHOLDS
/// ------------------------------------------------------------------------------------------ ///

// The default matter-antimatter energy saturation an MAPU starts with when booted up by a (debatably qualified) engineer
#define MAPU_SATURATION_START 2500
// The minimum matter-antimatter energy saturation that an MAPU's tile can be on before stalling out and shutting off
// Used in conjunction with MAPU_ATMOS_KPA_STALL_THRESHOLD to define when the MAPU shuts off on its own.
#define MAPU_SATURATION_STALL 500
// Amount of matter-antimatter energy saturation at which MAPU monitoring screens/applications begin to report problems
#define MAPU_SATURATION_CAUTION 5000
// Amount of matter-antimatter energy saturation at which the MAPU starts outputting "saturation too high" messages
#define MAPU_SATURATION_WARNING 7500
// Amount of matter-antimatter energy saturation at which the MAPU is defined as going into "overload"
// At this level, energy saturation passively increases at exponential rate, passive Tritium generation occurs, and more severe warnings are issued
// Station is force-set to orange alert if not already at that alert level or higher
#define MAPU_SATURATION_OVERLOAD 9000
// Amount of matter-antimatter energy saturation at which the MAPU starts losing superstructure integrity from oversaturation damage
// Shown as 100% on monitoring programs; mostly for scaling
#define MAPU_SATURATION_DAMAGING 10000
// Absolute maximum amount of energy saturation that an MAPU can have
// Can cause monitoring programs to display values >100% if set above MAPU_SATURATION_DAMAGING
// Minimum MAPU saturation is always zero
#define MAPU_SATURATION_ABSMAX 20000

/// ------------------------------------------------------------------------------------------ ///
/// REACTOR INTEGRITY DEFINES
/// ------------------------------------------------------------------------------------------ ///

// Max integrity will display as 100% in-game regardless of what is set here. These values should be used for scaling. Minimum integrity is always zero.
// Maximum (and default) superstructure integrity.
#define MAPU_INTEG_SUPER_MAX 10000
// Maximum (and default) core structure integrity.
#define MAPU_INTEG_CORE_MAX 10000
