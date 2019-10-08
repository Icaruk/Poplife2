enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};

//enableSaving[false,false];


// TFR Variables API
tf_no_auto_long_range_radio = true;
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;

tf_radio_channel_name = "TaskForceRadio_all";
tf_radio_channel_password = "radioparatodos";

profilenamespace setvariable ['GUI_BCG_RGB_R',0.0];
profilenamespace setvariable ['GUI_BCG_RGB_G',0.84];
profilenamespace setvariable ['GUI_BCG_RGB_B',0.0];
profilenamespace setvariable ['GUI_BCG_RGB_A',1.0];



KRON_StrToArray = {
	private["_in","_i","_arr","_out"];
	_in=_this select 0;
	_arr = toArray(_in);
	_out=[];
	for "_i" from 0 to (count _arr)-1 do {
		_out=_out+[toString([_arr select _i])];
	};
	_out
};

//Rosen Little Immersion Tweaks
[true, [false,false,false,true], [0,true,true], [[1000], true, true]] execVM "rosen\immersion\vip_lit\vip_lit_init.sqf";

StartProgress = true;
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
