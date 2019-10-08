
/*
by: Icaruk

	["menu"] call ica_fnc_tiendaPolicia;
*/

_param = _this select 0;

_tiendaLVL0 = [
	["No eres policía, ¿qué haces aquí?", 0]
];

_tiendaComun = [
	["----- Equipamiento Básico -----", 0],
	//["tf_anprc152",50000],
	["Taser_26",1000],
	["26_cartridge",50],
	["Binocular",1500],
	["pop_linterna",500],
	["O_IR_Grenade",2000],
	["SmokeShell",  200],
	["RH_12Rnd_45cal_usp",200],
	["Acc_flashlight",500],
	["optic_Hamr",25000],
	["", 0],
	["----- Mochilas -----", 0],
	["mochila_pequena",1500],
	["B_Parachute",5000],
	["", 0]
];

_senales = [
	["----- Señalización Tráfico -----", 0],
	["pop_tetrapodo_i",500],
	["pop_tetrapodo_x3_i",500],
	["pop_tetrapodo_x5_i",500],
	["pop_tetrapodo_x7_i",500],
	["POP_banda_i",500],
	["POP_electroflare_i",500],
	["POP_senal_alcoholemiagc_i",500],
	["POP_senal_control_policia_i",500],
	["POP_senal_izquierda_i",500],
	["POP_senal_derecha_i",500],
	["POP_senal_stop_i",500],
	["POP_senal_estrechamiento_i",500],
	["POP_senal_velocidad20_i",500],
	["POP_senal_velocidad40_i",500],
	["POP_BandaClavos_i",500],
	//["NVGoggles",60000],	
	["", 0]
];

_gafas = [
	["----- Gafas y esas cosas -----", 0],
	["G_Shades_Black",500],
	["G_Shades_Blue",500],
	["G_Sport_Blackred",500],
	["G_Sport_Checkered",500],
	["G_Sport_Blackyellow",500],
	["G_Sport_BlackWhite",500],
	["G_Aviator",500],
	["G_Squares",500],
	["G_Lowprofile",500],
	["G_Combat",500],
	["G_Diving",500],
	["", 0]
];

_tiendaLVL1 = [
	["----- Recluta -----", 0], // el precio 0 significa que es un título
	["rh_usp", 1000],
	["CNP_Pop", 1000],
	["GORRA_CNP", 1000],
	["CNP_BELT", 1000],
	["pop_chaleco_pocient2", 1000],
	["GC_Pop", 1000],
	["GCT_Pop", 1000],
	["GORRA_GC", 1000],
	["pop_chaleco_gcreflectante", 1000],
	["", 0] // esto es un espacio
];
_tiendaLVL2 = [
	["----- Policía Nacional (Agente) -----", 0],
	["rh_usp", 1000],
	["hlc_smg_mp510", 3000],
	["hlc_30Rnd_10mm_B_MP5", 500],
	["RH_M16A4", 10000],
	["RH_Hk416c", 10000],
	["RH_M4sbr_b", 10000],
	["RH_M4", 10000],
	["RH_M4m_b", 10000],
	["RH_M4_moe_b", 10000],
	["RH_M4m", 10000],
	["RH_M4sbr", 10000],
	["RH_M4sbr_g", 10000],	
	["RH_M4_moe", 10000],
	["RH_m4_des", 10000],	
	["RH_30Rnd_556x45_M855A1", 1000],
	//["optic_Holosight_smg", 1000],
	//["optic_aco_grn", 1000],
	//["optic_Arco",25000],
	["CNP2_Pop", 1000],
	["BOINA_CNP", 1000],
	["BOINA_CNP2", 1000],
	["BOINA_CNP3", 1000],
	["pop_chaleco_polcient", 1000],
	["", 0]
];
_tiendaLVL3 = [
	["----- Policía Nacional (Oficial) -----", 0],
	["rh_usp", 1000],
	["hlc_smg_mp510", 3000],
	["hlc_30Rnd_10mm_B_MP5", 500],
	//["optic_aco_grn", 1000],
	//["optic_Holosight_smg", 1000],
	//["optic_Arco",25000],
    ["RH_M16A4", 10000],
	["RH_Hk416c", 10000],
	["RH_M4sbr_b", 10000],
	["RH_M4", 10000],
	["RH_M4m_b", 10000],
	["RH_M4_moe_b", 10000],
	["RH_M4m", 10000],
	["RH_M4sbr", 10000],
	["RH_M4sbr_g", 10000],	
	["RH_M4_moe", 10000],
	["RH_m4_des", 10000],	
	["RH_30Rnd_556x45_M855A1", 1000],
	["CNP2_Pop", 1000],
	["CNP2_Pop", 1000],
	["BOINA_CNP", 1000],
	["BOINA_CNP2", 1000],
	["BOINA_CNP3", 1000],
	["pop_chaleco_polcient", 1000],
	["", 0]
];
_tiendaLVL4 = [
	["----- Guardia Civil (Agente) -----", 0],
	["POP_tricornio", 1000],
	["GC2_Pop", 1000],
	["BOINA_GC", 1000],
	["BOINA_GC2", 1000],
	["GC_Pop", 1000],
   	["GCT_Pop", 1000],
    ["GORRA_GC", 1000],
    ["pop_chaleco_gcreflectante", 1000],
	["rh_usp", 3000],
	["hlc_smg_mp510", 3000],
	["hlc_30Rnd_10mm_B_MP5", 500],
	//["optic_aco_grn", 1000],
	//["optic_Arco",25000],
	["RH_M16A4", 10000],
	["RH_Hk416c", 10000],
	["RH_M4sbr_b", 10000],
	["RH_M4", 10000],
	["RH_M4m_b", 10000],
	["RH_M4_moe_b", 10000],
	["RH_M4m", 10000],
	["RH_M4sbr", 10000],
	["RH_M4sbr_g", 10000],	
	["RH_M4_moe", 10000],
	["RH_m4_des", 10000],	
	["RH_30Rnd_556x45_M855A1", 1000],
	["", 0]
];
_tiendaLVL5 = [
	["----- Guardia Civil (Oficial) -----", 0],
	["POP_tricornio", 1000],
	["GC2_Pop", 1000],
	["BOINA_GC", 1000],
	["BOINA_GC2", 1000],
	["GC_Pop", 1000],
	["GCT_Pop", 1000],
	["GORRA_GC", 1000],
	["pop_chaleco_gcreflectante", 1000],
	["rh_usp", 3000],
	["hlc_smg_mp510", 3000],
	["hlc_30Rnd_10mm_B_MP5", 500],
	["RH_M16A4", 10000],
	["RH_Hk416c", 10000],
	["RH_M4sbr_b", 10000],
	["RH_M4", 10000],
	["RH_M4m_b", 10000],
	["RH_M4_moe_b", 10000],
	["RH_M4m_b", 10000],
	["RH_M4_moe_b", 10000],
	["RH_M4m", 10000],
	["RH_M4sbr", 10000],
	["RH_M4sbr_g", 10000],	
	["RH_M4_moe", 10000],
	["RH_m4_des", 10000],	
	["RH_30Rnd_556x45_M855A1", 1000],
	//["optic_Holosight_smg", 1000],
	//["optic_Arco",25000],
	["UEI_Pop", 1000],

	["", 0]
];
_tiendaLVL6 = [
	["----- Fuerzas especiales -----", 0],
	["POP_tricornio", 1000],
	["GC2_Pop", 1000],
	["BOINA_GC", 1000],
	["BOINA_GC2", 1000],
	["GC_Pop", 1000],
	["GCT_Pop", 1000],
	["GORRA_GC", 1000],
	["pop_chaleco_gcreflectante", 1000],
	["GEO_Pop", 1000],
	["CNP3_Pop", 1000],
	["GEO_CHALECO", 1000],
	["CASCO_GEO", 1000],
	["CASCO_GEO2", 1000],
	["RH_m9", 2000],
	//["optic_Holosight_smg", 1000],
	//["optic_Arco",25000],
	["hlc_smg_mp510", 3000],
	["hlc_30Rnd_10mm_B_MP5", 500],
	["RH_M16A4", 10000],
	["RH_Hk416c", 10000],
	["RH_M4sbr_b", 10000],
	["RH_M4", 10000],
	["RH_M4m_b", 10000],
	["RH_M4_moe_b", 10000],
	["RH_M4sbr", 10000],
	["RH_M4sbr_g", 10000],	
	["RH_M4_moe", 10000],
	["RH_m4_des", 10000],	
	["RH_30Rnd_556x45_M855A1", 1000],
	["SUPER_flash", 1000],
	["", 0]
];

_tiendaRopaCivil = [
	["----- Ropa de civil (Solo secreta) -----", 0],
	["TRYK_U_B_BLK_T_BK", 1000],
	["TRYK_U_B_Denim_T_BK", 1000],
	["TRYK_U_denim_jersey_blk", 1000],
	["TRYK_U_denim_hood_blk", 1000],
	["LOGOPOP_Pop", 1000],
	["CHAQUETANEGRA_Pop", 1000],
	["CHAQUETAMARRON_Pop", 1000],
	["CHAQUETAROJA_Pop", 1000],
	["CHAQUETAAZUL_Pop", 1000],
	["TRYK_U_B_Denim_T_WH", 1000],
	["TRYK_U_denim_jersey_blu", 1000],
	["CHAQUETALEOPARDO_Pop", 1000],
	["U_C_Travello1", 1000],
	["TRYK_shirts_DENIM_WH_Sleeve", 1000],
	["pop_gorra_lakers", 100],
	["pop_mexicano", 100],
	["pop_cowboy_brown", 100],
	["TRYK_R_CAP_BLK", 100],
	["", 0]
];


/*
_tiendaLVL7 = [
	["----- Mando -----", 0],
	["", 0]
];
*/


_arrayTienda = [];
if (_param isEqualTo "menu") exitWith {
    disableSerialization;
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	ctrlSetText [5005, "\pop_iconos\paa\tiendaPolicia.paa"];
	_lista = (_ui displayCtrl 5007);
	_nivel = call life_coplevel;

	if (_nivel >= 1) then {
		_arrayTienda append _tiendaComun;
	};

	switch (_nivel) do {
		case 0: {
			_arrayTienda append _tiendaLVL0;
		};
		case 1: {
			_arrayTienda append _tiendaLVL1;
		};
		case 2: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
		};
		case 3: {
			_arrayTienda append _tiendaLVL3;
		};
		case 4: {
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
		};
		case 5: {
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaRopaCivil;
		};
		case 6: {
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
			_arrayTienda append _tiendaRopaCivil;
		};
		case 7: {
			_arrayTienda append _tiendaLVL1;
			_arrayTienda append _tiendaLVL2;
			_arrayTienda append _tiendaLVL3;
			_arrayTienda append _tiendaLVL4;
			_arrayTienda append _tiendaLVL5;
			_arrayTienda append _tiendaLVL6;
			_arrayTienda append _tiendaRopaCivil;
			//_arrayTienda append _tiendaLVL7;
		};
	};

	if (_nivel >= 1) then {
		_arrayTienda append _senales;
		//_arrayTienda append _gafas;
	};

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
		["compro", cosa, precio] call ica_fnc_tiendaPolicia;
	';
};

if (_param isEqualTo "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;

	if (_precio > pop_din) exitWith {hint "No hay nada gratis."; };
	if !(isClass (configFile >> "CfgVehicles" >> _cosa)) then { // si no es veh, pregunta si te cabe en el inventario
		if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; fuera = true; };
	};
	if (!isNil {fuera}) exitWith {fuera = nil};

	pop_din = pop_din - _precio;
	if (isNil {pop_din}) then {pop_din = 0};

	if (isClass (configFile >> "CfgVehicles" >> _cosa)) then {
		private "_mrk"; // ¿qué marcador tengo más cerca?
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3"] call ica_fnc_masCercano;

		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil "_veh"};
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

		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] call life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] call life_fnc_MP;
		[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently
		closeDialog 0;
		hint format ["Has comprado %1 por %2€", _cosa, _precio];
	} else {
		[_cosa] call ica_fnc_item;
	};
};

