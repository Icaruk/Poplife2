#include <macro.h>
/*
	File: fn_adminDebug.sqf
    Author: tenshi	
*/
if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint "No puedes usar esto.";};

createDialog "RscDisplayDebugPublic";