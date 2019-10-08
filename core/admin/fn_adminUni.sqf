#include <macro.h>
/*
    File: fn_adminKill.sqf
    Author: tenshi
*/
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};

/*
if (uniform player != "A3L_SECRET") then{

	player addUniform "A3L_SECRET";
	hint "DIOS activado";
	player allowDamage false;
} else {
	hint "DIOS desactivado";
	player allowDamage true;
	removeUniform player;
};
*/

if (isNil {particAdmin}) then {
	// LeavesFall, SmallFireBarrel
	player allowDamage false;
	0 spawn {
		_pos = getPos player;
		_pos set [2, 1.75];
		particAdmin = "#particlesource" createVehicle _pos;
		particAdmin setParticleClass "SmallFireBarrel";
		particAdmin setParticleFire [0,0,0];
		particAdmin attachto [player, [0,0,0.15], "head"];
	};
} else {
	player allowDamage true;
	deleteVehicle particAdmin;
	particAdmin = nil;
};



