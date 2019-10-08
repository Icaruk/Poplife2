#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg-<DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Policia Sahrani"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
    {
       		_ret set[count _ret,["CNP_Pop","Traje CNP",1000]];
		_ret set[count _ret,["GC_Pop","Guardia civil",1000]];
		_ret set[count _ret,["CNP2_Pop","Traje CNP2",1000]];
		_ret set[count _ret,["GC2_Pop","Guardia civil 2",1000]];
		_ret set[count _ret,["GCT_Pop","Guardia civil trafico",1000]];
		_ret set[count _ret,["CNP3_Pop","Traje CNP3",1000]];
		_ret set[count _ret,["UEI_Pop","Traje",1000]];
		_ret set[count _ret,["U_B_HeliPilotCoveralls",1000]];
		
        if(__GETC__(life_coplevel) >= 6) then
        {
            _ret set[count _ret,["GEO_Pop","GEO",1500]];
        };

    };

	//Hats
	case 1:
	{

			_ret set[count _ret,["H_Beret_blk_POLICE",nil,150]];
			_ret set[count _ret,["H_Beret_02",nil,150]];
			_ret set[count _ret,["H_Cap_press",nil,150]];
			_ret set[count _ret,["GORRA_CNP",nil,150]];
			_ret set[count _ret,["GORRA_GC",nil,150]];
			_ret set[count _ret,["BOINA_CNP",nil,150]];
			_ret set[count _ret,["BOINA_CNP2",nil,150]];
			_ret set[count _ret,["BOINA_CNP3",nil,150]];
			_ret set[count _ret,["BOINA_GC",nil,150]];
			_ret set[count _ret,["BOINA_GC2",nil,150]];
			_ret set[count _ret,["H_PilotHelmetHeli_B",nil,150]];

		if(__GETC__(life_coplevel) > 2) then
		{
            		_ret set[count _ret,["POP_tricornio","tricornio",1500]];
		};
		if(__GETC__(life_coplevel) > 5) then
        	{
        		_ret set[count _ret,["CASCO_GEO",nil,250]];
			_ret set[count _ret,["CASCO_GEO2",nil,250]];
		};


	};

	//Glasses
	case 2:
	{
		_ret =
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Balaclava_blk",nil,30],
			["G_Combat",nil,55],
			["G_Diving",nil,500]
		];
	};

	//Vest
	case 3:
	{

		_ret set[count _ret,["CNP_BELT","Chaleco CNP1",1000]];
		_ret set[count _ret,["CNP_CHALECO","Chaleco CNP2",1000]];
		_ret set[count _ret,["CNP_CHALECO2","Chaleco CNP3",1000]];
		_ret set[count _ret,["GC_CHALECO","Chaleco guardia civil",1000]];
		_ret set[count _ret,["UEI_CHALECO","Chaleco UEI",1000]];
		_ret set[count _ret,["pop_chaleco_pocient2","Chaleco Cientifica",1000]];
		_ret set[count _ret,["GEO_CHALECO","Chaleco geo",1000]];
		_ret set[count _ret,["pop_chaleco_gcreflectante","Chaleco reflectante ATGC",1000]];



	};

	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Parachute",nil,100],
			["mochila_pequena",nil,800],
			["mochila_mediana",nil,5000]
			//["B_TacticalPack_blk",nil,1000],
			//["B_Carryall_cbr",nil,1000]
		];
	};
};

_ret;