/////////////////////////////
// TDR ACJ
// Animaciones
//////////////////////////

if (!isNil "life_fnc_animsync") then
{
[[player,"CL3_anim_eat"],"life_fnc_animsync",true,false] call life_fnc_MP;
} else
{
player switchmove "CL3_anim_eat"
};

[] spawn
{
sleep 7;
[[player,""],"life_fnc_animsync",true,false] call life_fnc_MP;
A3L_isDancing = false;
};