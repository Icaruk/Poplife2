#include <macro.h>
/*
	Author: Demigod
	
	Description:
	Purge Server Event setup. Sends a faction announcement, plays a sound file from an object
	and toggles a variable.
*/
private["_message"];
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint "Tienes que ser un administrador para utilizar esta función.";};

[["Aviso la Purga  va comenzar.  Todos los policías y servicio de emergencias quedan desactivados, vuelvan inmediatamente a sus casas. La unica norma activa es no matar en zonas de EMS","Gobierno de Sahrani",6],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;

["purge","playSound", true, true, true] call bis_fnc_MP;

// [[Tower1, "purge",35000],"life_fnc_playSound",false,true] spawn life_fnc_MP;

sleep 80;
[[["COMIENZA LA PURGA HASTA QUE LAS LUCES SE APAGUEN"]], "BIS_fnc_typeText", true, true, false] call BIS_fnc_MP;
[tower1, "purge",35000] call CBA_fnc_globalSay3d;
while {true} do {
	[tower1, "purge",35000] call CBA_fnc_globalSay3d;
	[["La purga está activa hasta que se apaguen las luces","Gobierno de Sahrani",6],"TON_fnc_clientMessage",civilian,false] spawn life_fnc_MP;
	sleep 300;
};
