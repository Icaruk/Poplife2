/////////////////////////////
// TDR ACJ
// Animaciones de baiele //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[[player,"cl3_hiphopdance"],"life_fnc_animsync",true,false] call life_fnc_MP;
} else
{
player switchmove "cl3_hiphopdance"
};

[] spawn
{
sleep 50;
[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
A3L_isDancing = false;
};