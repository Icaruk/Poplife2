
/*
por: Icaruk
*/

0 spawn ica_fnc_climaServidor;
0 spawn ica_fnc_initVars;
0 spawn ica_fnc_initNaufragios;
0 spawn ica_fnc_initMineria;

["init"] spawn ica_fnc_initSubasta;
[] spawn ica_fnc_resetDatos;
["reset0"] spawn ica_fnc_initPortatil;
["loop"] spawn ica_fnc_initPortatil;
// [] spawn ica_fnc_crearegalo; // pendiente
["init"] spawn ica_fnc_loteria;
["init"] spawn ica_fnc_roboConcesionario;
0 spawn ica_fnc_initDroga;
["init"] spawn ica_fnc_roboJoyeria;
["init"] spawn ica_fnc_roboBanco;
["init"] spawn ica_fnc_basura;

uranioTest = nil;
publicVariable "uranioTest";

centralitaArray = ["Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre","Libre"];

// *** Modo editor ***

if !(isDedicated) then {
	0 spawn ica_fnc_climaCliente;
	waitUntil {!isNil {experiencia}};

	0 spawn ica_fnc_initExp;
	0 spawn ica_fnc_impuestos;
	["init"] call ica_fnc_comoBebo;
	[] call ica_fnc_initHabilidades;
	0 spawn ica_fnc_consumo;
	["init"] call ica_fnc_camaras;
	0 spawn ica_fnc_EH;
	0 spawn ica_fnc_initHUD;

	arrayInfo = ["", "", "", "", "", "", "", "", "* Pop Life", "* v.server"];
	if (isNil {profileNamespace getVariable "arraySMS"}) then {
		_arr = []; _arr resize 30;
		profileNamespace setVariable ["arraySMS", _arr];
	};

	waitUntil {!isNull (uiNamespace getVariable "HUDica")};
	[] call ica_fnc_infolog;

	0 spawn ica_fnc_mapMarkers;

	player addAction ["", {
		call ica_fnc_limitadorDeArmas
	}, "", 0, false, true, "DefaultAction", "isNil 'puedoDisparar' "];

	[player] spawn ica_fnc_initMed;
    ["loop"] spawn ica_fnc_posicion;
 	waitUntil {!isNil {heNacido}};
	[] execVM "presentacion.sqf";
	["recibo"] call ica_fnc_bloqueoDinero;

	// mierda de test

	player addBackpack "b_huntingbackpack";
	player addUniform "U_C_Poloshirt_redwhite";
	player addItem "itemMap";
	player assignItem "itemMap";
	player addmagazines ["CUP_30Rnd_9x19_EVO", 3]; player addweapon "r3f_mp5a5";
	player addmagazines ["RH_16Rnd_9x19_cz", 3]; player addweapon "RH_cz75";

	// call ica_fnc_silencer;
};


