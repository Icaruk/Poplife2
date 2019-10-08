#include <macro.h>
/*
Tienda de la mafia
by: Icaruk

	["menu"] call ica_fnc_tiendaMafia;
*/

_param = _this select 0;

_tiendaLVL0 = [
	["Si no eres de la familia, no eres bienvenido", 0]
];
_tiendaLVL1 = [ // trajes
	["----- Trajes -----", 0],
	["TRYK_SUITS_BR_F", 10000 * Desc],
    ["TRYK_SUITS_BLK_F", 10000 * Desc],
	["TRYK_B_TRYK_OCP_D_T", 10000 * Desc],
	["TRYK_U_B_MTP_BLK_CombatUniform", 10000 * Desc],
	["TRYK_U_B_BLK_OD_Tshirt", 10000 * Desc],
	["TRYK_U_B_BLK3CD_Tshirt", 10000 * Desc],
	["TRYK_U_B_AOR2_OD_CombatUniform", 10000 * Desc],
	["TRYK_B_TRYK_3C_T", 10000 * Desc],
	["", 0]
];
_tiendaLVL2 = [ // chalecos
	["----- Chalecos -----", 0],
	["V_Chestrig_blk", 5000 * Desc],
	["V_PlateCarrier2_rgr", 5000 * Desc],
	["V_PlateCarrierIA2_dgtl", 5000 * Desc],
	["V_BandollierB_khk", 5000 * Desc],
	["V_TacVestIR_blk", 5000 * Desc],
	["V_TacVest_camo", 5000],
	["V_PlateCarrierSpec_rgr", 5000 * Desc],
	["V_PlateCarrier_Kerry", 5000 * Desc],
    ["V_PlateCarrierH_CTRG", 5000 * Desc],
	["B_Parachute", 5000 * Desc],
	["", 0]

];
_tiendaLVL3 = [ // pistolas automáticas
	["----- Pistolas automáticas -----", 0],
	["RH_m9", 40000],
	["RH_15Rnd_9x19_M9", 600 * Desc],
	["", 0],
	["RH_python", 40000 * Desc],
	["RH_6Rnd_357_Mag", 600 * Desc],
	["", 0],
	["RH_g17", 40000 * Desc],
	["RH_17Rnd_9x19_g17", 600 * Desc],
	["", 0],
	["RH_g18", 45000 * Desc],
	["RH_19Rnd_9x19_g18", 600 * Desc],
	["", 0],
	["RH_mak", 45000 * Desc],
	["RH_8Rnd_9x18_Mak", 600 * Desc],
	["", 0],
	["RH_mp412", 45000 * Desc],
	["RH_6Rnd_357_Mag", 600],
	["", 0],
	["RH_mk2", 45000 * Desc],
	["RH_10Rnd_22LR_mk2", 600 * Desc],
	["", 0],
	["RH_bull", 45000 * Desc],
	["RH_6Rnd_454_Mag", 600 * Desc],
	["", 0]
];
_tiendaLVL4 = [ // subfusiles nivel 1
	["----- Subfusiles nivel 1 -----", 0],
	["RH_muzi", 55000 * Desc],
	["RH_30Rnd_9x19_UZI", 600 * Desc],
	["", 0],
	["pop_thomson",55000 * Desc],
	["pop_thomson_45",500 * Desc],
	["pop_thomson_9x19",500 * Desc],
	["", 0]
];
_tiendaLVL5 = [ // subfusiles nivel 2
	["----- Subfusiles nivel 2 -----", 0],
	["C1987_MP7_ucp", 70000 * Desc],
	["C1987_40Rnd_46x30_mp7", 600 * Desc],
	["", 0],
	["C1987_MP7_folded2", 55000 * Desc],
	["C1987_40Rnd_46x30_mp7", 600 * Desc],
	["", 0],
	["C1987_MP7_nwu", 55000 * Desc],
	["C1987_40Rnd_46x30_mp7", 600 * Desc],
	["", 0],
	["AG_MP9_peq", 55000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 600 * Desc],
	["AG_MP9_wcam", 70000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 600 * Desc],
	["", 0],
	["AG_MP9_wcam", 55000 * Desc],
	["30Rnd_45ACP_Mag_SMG_01", 600 * Desc],
	["", 0]
];
_tiendaLVL6 = [ // veh mafiosos
	["----- Vehículos -----", 0],
	["Mercedes_Pullman_negra", 450000 * Desc],
	["pop_lincoln_negro", 100000 * Desc],
	["POP_jeep_blinde_negro", 100000 * Desc],
	["POP_jeep_blinde_negro_mate", 100000 * Desc],
	["", 0]
];
_tiendaLVL7 = [ // carabinas
	["----- Carabinas -----", 0],
	["hlc_rifle_ak12", 80000 * Desc],
	["hlc_rifle_aek971worn", 80000 * Desc],
	["hlc_30Rnd_545x39_B_AK", 700 * Desc],
	["", 0],
	["R3F_Famas_surb_HG", 80000 * Desc],
	["R3F_Famas_G2", 80000 * Desc],
	["R3F_30Rnd_556x45_FAMAS", 700 * Desc],
	["R3F_30Rnd_556x45_TRACER_HK416", 700 * Desc],
	["", 0]
];
_tiendaLVL8 = [ // fusiles de asalto
	["----- Fusiles de asalto -----", 0],
	["RH_Hk416c", 90000 * Desc],
	["RH_M4m", 90000 * Desc],
	["RH_M4sbr", 90000 * Desc],
	["RH_M4sbr_g", 90000 * Desc],
	["RH_M4_moe", 90000 * Desc],
	["RH_m4_des", 90000 * Desc],
	["RH_m4_tg", 90000 * Desc],
	["RH_m4_wdl", 90000 * Desc],
	["RH_30Rnd_556x45_M855A1", 800],
	["", 0],
	["hlc_rifle_aks74", 90000 * Desc],
	["hlc_rifle_aks74u", 90000 * Desc],
	["hlc_rifle_aku12", 90000 * Desc],
	["hlc_30Rnd_545x39_B_AK", 1000 * Desc],
	["", 0],
	["R3F_HK416M_HG_DES", 95000 * Desc],
	["R3F_30Rnd_556x45_HK416", 1000 * Desc],
	["", 0],
	["RH_M16A4", 90000 * Desc],
	["RH_30Rnd_556x45_M855A1", 800 * Desc],
	["", 0]

];


_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_nivel = "maf" call ica_fnc_expToLevel;
	_bd = call mafia;

	if (_bd == 0)    then { _arrayTienda append _tiendaLVL0 };
	if ((_nivel >= 1) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL1 };
	if ((_nivel >= 2) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL2 };
	if ((_nivel >= 3) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL3 };
	if ((_nivel >= 4) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL4 };
	if ((_nivel >= 5) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL5 };
	if ((_nivel >= 6) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL6 };
	if ((_nivel >= 7) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL7 };
	if ((_nivel >= 8) and !(_bd == 0)) then { _arrayTienda append _tiendaLVL8 };

	private ["_nom", "_pre"];
	_idx = 0;
	while {_idx < (count _arrayTienda)} do {

		// Hallo su nombre visual
		_nom = [_arrayTienda select _idx select 0] call ica_fnc_classToName;
		_pic = [_arrayTienda select _idx select 0] call ica_fnc_classToPic;

		// Hallo su precio
		_precio = (_arrayTienda select _idx select 1); // pillo el precio
		if (_precio != 0) then { // si es 0, es un espaciador
			_pre = format ["(%1€)", ([_precio, 3] call ica_fnc_numToStr)];
		} else {_pre = ""; };

		// Creo cada elemento de la lista
		_lista lbAdd format ["%1 %2", _nom, _pre];
		_lista lbSetPicture [_idx, _pic];
		_lista lbSetData [_idx, (_arrayTienda select _idx select 0)];
		_lista lbSetValue [_idx, (_arrayTienda select _idx select 1)];
		if ((_arrayTienda select _idx select 1) == 0) then { // si es separador le cambio de color
			_lista lbSetColor [_idx, [0, 0.6, 0, 1]];
		};

		_idx = _idx + 1;
	};


	// _lista lbSetCurSel 0;
};

if (_param isEqualTo "actualiza") exitWith {
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;

	_boton buttonSetAction '
		["compro", cosa, precio] call ica_fnc_tiendaMafia;
	';
};

if (_param isEqualTo "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;

	private "_fuera";
	if (_precio > pop_din) exitWith {hint "No tienes suficiente dinero."; };

	/* // va raro
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; _fuera = true; };
	};
	if (!isNil {_fuera}) exitWith {};
	*/

	pop_din = pop_din - _precio;

	if (getNumber (configFile >> "CfgVehicles" >> _cosa >> "maxspeed") > 0) then {
		private "_mrk";
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil {_veh}};
		_veh allowDamage false;
		_veh lock 2;
		_veh setVectorUp (surfaceNormal (getMarkerPos _mrk));
		_veh setDir (markerDir _mrk);
		_veh setPos (getMarkerPos _mrk);
		[[_veh,1],"life_fnc_colorVehicle",true,false] call life_fnc_MP;
		[_veh] call life_fnc_clearVehicleAmmo;
		[[_veh,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		[[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] call life_fnc_MP;
		_veh disableTIEquipment true;
		_veh allowDamage true;
		_veh setVariable ["matricula", call ica_fnc_creaMatricula, true];

		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
		[0] call SOCK_fnc_updatePartial;
		closeDialog 0;
	} else {
		[_cosa] call ica_fnc_item;
	};

	hint format ["Has comprado %1 por %2€", _cosa, _precio];
	[format ["- %1€", _precio]] call ica_fnc_infolog;
};

