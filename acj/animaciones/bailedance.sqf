/////////////////////////////
// TDR ACJ
// Animaciones de baiele //
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[[player,"A3L_Dance"],"life_fnc_animsync",true,false] call life_fnc_MP;
} else
{
player switchmove "A3L_Dance"
};

[] spawn
{
sleep 40;
[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
A3L_isDancing = false;
};