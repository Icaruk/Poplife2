/////////////////////////////
// TDR ACJ
// Animaciones de triste //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[[player,"A3L_Facepalm"],"life_fnc_animsync",true,false] call life_fnc_MP;
} else
{
player switchmove "A3L_Facepalm"
};

[] spawn
{
sleep 2;
[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
A3L_isDancing = false;
};