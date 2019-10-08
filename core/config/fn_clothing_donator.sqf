#include <macro.h>

/*
	File: fn_clothing_donator.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	donators
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tienda donadores"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
        if(__GETC__(life_donator) > 0) then
        {
			_ret set[count _ret,["TRYK_U_Bts_GRYGRY_PCUs",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_PCUGs_gry",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_PCUGs_OD",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_wh_tan_Rollup_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_U_B_wh_blk_Rollup_CombatUniform",nil,2000]];
			_ret set[count _ret,["TRYK_SUITS_BLK_F",nil,2000]];
			_ret set[count _ret,["TRYK_SUITS_BR_F",nil,2000]];
			_ret set[count _ret,["TRYK_U_pad_hood_Cl_blk",nil,2000]];
			_ret set[count _ret,["TRYK_U_pad_hood_odBK",nil,2000]];
			_ret set[count _ret,["RAPTORS2_Pop",nil,2000]];
			_ret set[count _ret,["PACMAN_Pop",nil,2000]];
			_ret set[count _ret,["JWORLD_Pop",nil,2000]];
			_ret set[count _ret,["RAPTORS_Pop",nil,2000]];
			_ret set[count _ret,["KITKAT_Pop",nil,2000]];
			_ret set[count _ret,["MARITRINI_Pop",nil,2000]];
			_ret set[count _ret,["IBERDROGA_Pop",nil,2000]];
			_ret set[count _ret,["CHAQUETANEGRA_Pop",nil,2000]];

        };
		
        if(__GETC__(life_donator) > 1) then
        {
            _ret set[count _ret,["KITKAT_Pop",nil,2000]];	
        };
		
    };
	
	//Hats
	case 1:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
		   _ret set[count _ret,["H_ShrekMask",nil,1500]];
		   _ret set[count _ret,["H_AugustusMask",nil,1500]];
		   _ret set[count _ret,["H_ObamaMask",nil,1500]];
		   _ret set[count _ret,["H_VenomMask",nil,1500]];
		   _ret set[count _ret,["H_KermitMask",nil,1500]];
	       _ret set[count _ret,["Masque_Mempo",nil,1500]];
           _ret set[count _ret,["Masque_Metalhead",nil,1500]];
           _ret set[count _ret,["Masque_Mark",nil,1500]];
		   _ret set[count _ret,["Masque_Orc",nil,1500]];
		   _ret set[count _ret,["Masque_Lion",nil,1500]];
		   _ret set[count _ret,["Masque_archNemesis",nil,1500]];
		   _ret set[count _ret,["Masque_Optimiste",nil,1500]];
		   _ret set[count _ret,["Masque_forceAlpha",nil,1500]];
       };	
	};
	
	//Glasses
	case 2:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
	       _ret set[count _ret,["SFG_Tac_smallBeardD",nil,400]];
           _ret set[count _ret,["SFG_Tac_smallBeardB",nil,400]];
           _ret set[count _ret,["SFG_Tac_BeardD",nil,400]];
		   _ret set[count _ret,["SFG_Tac_BeardO",nil,400]];
		   _ret set[count _ret,["SFG_Tac_BeardB",nil,400]];
		   _ret set[count _ret,["SFG_Tac_BeardG",nil,400]];
		   _ret set[count _ret,["SFG_Tac_ChopsD",nil,400]];
		   _ret set[count _ret,["SFG_Tac_ChopsG",nil,400]];
		   _ret set[count _ret,["SFG_Tac_ChopsB",nil,400]];
		   _ret set[count _ret,["SFG_Tac_ChopsO",nil,400]];
		   _ret set[count _ret,["SFG_Tac_moustacheD",nil,400]];
		   _ret set[count _ret,["SFG_Tac_moustacheG",nil,400]];
		   _ret set[count _ret,["SFG_Tac_moustacheB",nil,400]];
		   _ret set[count _ret,["SFG_Tac_moustacheO",nil,400]];
		   _ret set[count _ret,["SFG_Tac_chinlessbD",nil,400]];
           _ret set[count _ret,["SFG_Tac_chinlessbG",nil,400]];
           _ret set[count _ret,["SFG_Tac_chinlessbO",nil,400]];
		   _ret set[count _ret,["SFG_Tac_chinlessbB",nil,400]];
		   _ret set[count _ret,["SFG_Tac_smallBeardG",nil,400]];
		   _ret set[count _ret,["SFG_Tac_smallBeardO",nil,400]];
		   _ret set[count _ret,["G_Shades_Blue",nil,400]];
		   _ret set[count _ret,["G_Sport_Blackred",nil,400]];
		   _ret set[count _ret,["G_Sport_Checkered",nil,400]];
		   _ret set[count _ret,["G_Sport_Blackyellow",nil,400]];
		   _ret set[count _ret,["G_Sport_BlackWhite",nil,400]];
		   _ret set[count _ret,["G_Squares",nil,400]];
		   _ret set[count _ret,["G_Aviator",nil,400]];
		   _ret set[count _ret,["G_Lady_Mirror",nil,400]];
       };	
	};
	
	//Vest
	case 3:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
	       _ret set[count _ret,["k_cut_1",nil,2500]];
           _ret set[count _ret,["k_cut_2",nil,2500]];
           _ret set[count _ret,["k_cut_3",nil,2500]];
		   _ret set[count _ret,["k_cut_4",nil,2500]];
		   _ret set[count _ret,["k_cut_5",nil,2500]];
		   _ret set[count _ret,["k_cut_6",nil,2500]];
		   _ret set[count _ret,["k_cut_7",nil,2500]];
		   _ret set[count _ret,["k_cut_8",nil,2500]];
		   _ret set[count _ret,["k_cut_9",nil,2500]];
		   _ret set[count _ret,["k_cut_10",nil,2500]];
		   _ret set[count _ret,["k_cut_11",nil,2500]];
		   _ret set[count _ret,["TRYK_V_Bulletproof_BL",nil,2500]];
		   _ret set[count _ret,["TRYK_V_Bulletproof_BLK",nil,2500]];
		   _ret set[count _ret,["TRYK_V_Bulletproof",nil,2500]];
       };	
	};
	
	//Backpacks
	case 4:
	{   
	   if(__GETC__(life_donator) > 0) then
	   {
	       _ret set[count _ret,["B_AssaultPack_cbr",nil,2500]];
           _ret set[count _ret,["B_Kitbag_mcamo",nil,2500]];
           _ret set[count _ret,["B_TacticalPack_oli",nil,2500]];
		   _ret set[count _ret,["B_FieldPack_ocamo",nil,2500]];
		   _ret set[count _ret,["B_Bergen_sgg",nil,2500]];
		   _ret set[count _ret,["B_Kitbag_cbr",nil,2500]];
		   _ret set[count _ret,["mochila_pequena",nil,2500]];
       };	
	};
};

_ret;