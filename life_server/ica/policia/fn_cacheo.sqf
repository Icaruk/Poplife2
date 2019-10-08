
/*
por: Icaruk
	[cursorTarget] spawn ica_fnc_cacheo;
*/



_tio = _this select 0;
_slp = if ((call life_adminlevel) < 3) then {10} else {1};

if ((isNull _tio) OR (isNil {_tio})) exitWith {};
[_slp, "Cacheando..."] spawn ica_fnc_barrita;

_iU = getItemCargo uniformContainer _tio;
_aU = getWeaponCargo uniformContainer _tio;
_mU = getMagazineCargo uniformContainer _tio;
_iV = getItemCargo vestContainer _tio;
_aV = getWeaponCargo vestContainer _tio;
_mV = getMagazineCargo vestContainer _tio;
_iM = getItemCargo backpackContainer _tio;
_aM = getWeaponCargo backpackContainer _tio;
_mM = getMagazineCargo backpackContainer _tio;

sleep _slp;

disableSerialization;
createDialog "cacheo";
_ui = uiNamespace getVariable "cacheo";
_lis1 = _ui displayCtrl 7090;
_lis2 = _ui displayCtrl 7091;
_lis3 = _ui displayCtrl 7092;


_vars = [[_iU, _aU, _mU], [_iV, _aV, _mV], [_iM, _aM, _mM]];

_varidx = 0;
while {_varidx < count _vars} do {
	_arr = _vars select _varidx;
	
	{
		_cnt = count (_x select 0);
		
		if (_cnt > 0) then {
			_idx = 0;
			while {_idx < _cnt} do {
				(_ui displayCtrl (7090 + _varidx)) lbAdd format ["%1 x%2", [_x select 0 select _idx] call ica_fnc_classToName, _x select 1 select _idx];
				(_ui displayCtrl (7090 + _varidx)) lbSetPicture [(lbSize (_ui displayCtrl (7090 + _varidx))) -1, [_x select 0 select _idx] call ica_fnc_classToPic];		
				
				_idx = _idx + 1;
			};
		};
	} forEach _arr;
	
	_varidx = _varidx + 1;
};
