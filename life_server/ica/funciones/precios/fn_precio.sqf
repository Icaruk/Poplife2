
/*


*/

_cosa = _this select 0;
_modo = _this select 1; // true precio de compra, false de venta

private "_n";

if (_modo) then { // compra
	_n = switch (_cosa) do {
		case "pop_P_Barbacoa": {250};
		case "pop_P_Clasica": {250};
		case "pop_P_Oliva": {250};
		case "pop_P_Originales": {250};
		case "pop_P_Queso": {250};
		case "pop_G_Ahoy": {250};
		case "pop_G_Chocolate": {250};
		case "pop_G_Oreo": {250};
		case "pop_R_Pepsi": {250};
		case "pop_R_Naranja": {250};
		case "pop_R_7up": {250};
		case "pop_R_Superstar": {250};
		case "pop_R_monster": {250};
		case "pop_R_Pepper": {250};
		case "pop_pringles": {250};
		case "pop_H_Fresa": {200};
		case "pop_H_vainilla": {200};
		case "pop_H_Napolitana": {250};
		case "pop_cheseburge": {600};
		case "pop_pizza": {500};
		case "pop_tostada": {400};
		case "pop_pistacho": {250};
		case "pop_kiwi": {225};
		case "pop_banana": {225};
		case "pop_apple": {225};
		
		case "pop_alcohol": {2750};
		
		case "pop_esposas": {250};
		case "pop_Ganzua": {250};
        
		case "RH_cz75": {45000};		
		case "RH_16Rnd_9x19_cz": {1200};
		case "RH_sw659": {45000};
		case "RH_14Rnd_9x19_sw": {1000};
		case "RH_usp": {45000};
		case "RH_12Rnd_45cal_usp": {1200};
		case "RH_mak": {45000};
		case "RH_8Rnd_9x18_Mak": {1000};
		case "RH_uspm": {45000};
		case "RH_16Rnd_40cal_usp": {1000};
		case "RH_m9": {55000};
		case "RH_m9c": {55000};
		case "RH_15Rnd_9x19_M9": {1000};
		case "RH_tt33": {55000};
		case "RH_8Rnd_762_tt33": {1000};
		case "RH_mk2": {55000};
		case "RH_10Rnd_22LR_mk2": {1000};
		case "RH_p226": {45000};
		case "RH_p226s": {45000};
		case "RH_15Rnd_9x19_SIG": {1000};
		case "RH_mateba": {45000};
		case "RH_6Rnd_44_Mag": {1000};
		case "RH_python": {45000};
		case "RH_mp412": {45000};
		case "RH_6Rnd_357_Mag": {1000};
		case "RH_bull": {55000};
		case "RH_bullb": {55000};
		case "RH_6Rnd_454_Mag": {1000};
		case "RH_fnp45": {55000};
		case "RH_fnp45t": {55000};
		case "RH_15Rnd_45cal_fnp": {1000};
		case "RH_fn57": {55000};
		case "RH_fn57_g": {55000};
		case "RH_fn57_t": {55000};
		case "RH_20Rnd_57x28_FN": {1000};
		case "RH_gsh18": {45000};
		case "RH_18Rnd_9x19_gsh": {1000};
		case "hgun_Pistol_heavy_01_F": {45000};
		case "11Rnd_45ACP_Mag": {1000};
		case "hgun_ACPC2_F": {45000};
		case "9Rnd_45ACP_Mag": {1000};
		case "hgun_P07_F": {45000};
		case "hgun_Rook40_F": {45000};
		case "16Rnd_9x21_Mag": {1000};
		case "hgun_Pistol_heavy_02_F": {45000};
		case "6Rnd_45ACP_Cylinder": {1000};
	    case "RH_ttracker": {55000};
		case "RH_6Rnd_45ACP_Mag": {1000};
		
		case "pop_vendas": {100};
		case "pop_vendas_c": {100};
		case "pop_morfina": {100};
		case "pop_epinefrina": {100};
		case "pop_tramadol": {100};
		case "pop_desfibrilador": {5000};
		case "pop_bolsadesangre": {100};
		case "pop_oxigeno": {100};
		case "pop_jarabe": {100};
		case "pop_aguaoxigenada": {100};
		case "pop_cajademedicamentos": {100};
		case "pop_yodo": {100};
		case "pop_csi": {100};
		case "pop_bisturi_item": {5000};
		
		case "pop_armariog": {150000};
		case "pop_armariop": {100000};
		
		case "pop_rabano_s": {45};
		case "pop_trigo_s": {45};
		case "pop_algodon_s": {55};
		case "pop_maiz_s": {55};
		case "pop_bamboo_s": {55};
		case "pop_cannabis_s": {250};
		case "pop_girasol_s": {55};
		
		case "pop_linterna": {500};
		case "pop_pico": {1500};
		case "pop_hacha": {1500};
		case "pop_pala": {1500};
		case "ItemRadio": {100};
		case "ToolKit": {1800};
		case "ItemMap": {100};
		case "pop_note": {250};
		case "Binocular": {750};
		case "pop_iphone": {500};
		case "pop_nokia": {250};
		case "ItemGPS": {150};
		case "pop_llaves": {150};
		case "pop_combustible": {7500};
		case "pop_portatil": {1500};
		case "tf_fadak": {50000};
		case "tf_anprc152": {50000};
		case "tf_anprc148jem": {50000};
	
		
		case "POP_senal_cuadrada_i": {250};
		case "POP_senal_alcoholemiagc_i": {250};
		case "POP_senal_control_policia_i": {250};
		case "POP_senal_stop_i": {250};
		case "POP_senal_derecha_i": {250};
		case "POP_senal_izquierda_i": {250};
		case "POP_senal_estrechamiento_i": {250};
		case "POP_senal_velocidad20_i": {250};
		case "POP_senal_velocidad40_i": {250};
		case "POP_banda_i": {250};
		case "POP_tetrapodo_i": {250};
		case "POP_tetrapodo_x3_i": {250};
		case "POP_tetrapodo_x5_i": {250};
		case "POP_tetrapodo_x7_i": {250};
		case "POP_electroflare_i": {250};
		case "optic_Arco": {25000};
		case "NVGoggles": {60000};
		
		case "Press_Mic_AAN_F": {2500};
		case "Press_Cam_F": {2500};
		case "Press_Mic_CNN_F": {2500};
		case "POPTV_Pop": {2500};
		case "H_Cap_press": {3500};
		case "V_Press_F": {3500};
		
		
		case "pop_correos":{5500};
	   


		
	};
} else { // venta
	_n = switch (_cosa) do {
		case "pop_coca_b": {1000};
		case "pop_efedrina_b": {1000};
		case "pop_opio_b": {1000};
		case "pop_cannabis_i": {1000};
		case "pop_cocaina_f": {8000};
		case "pop_metanfetamina_f": {8000};
		case "pop_heroina_f": {8000};
		case "pop_marihuana_f": {8000};
		case "pop_basura_item":{500};
	};

};


// Por si acaso
if (isNil {_n}) exitWith {
	if (_modo) then {
		_n = 999999999; // 999 millones
	} else {
		_n = 0;
	};
	_n
};
if ((typeName _n) != "SCALAR") exitWith {
	if (_modo) then {
		_n = 999999999; // 999 millones
	} else {
		_n = 0;
	};
	_n
};

round _n