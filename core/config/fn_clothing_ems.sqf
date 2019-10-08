/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"EMS Clothing Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["SAMUR_Pop",nil,500],
		    ["SEM_Pop",nil,500],
			["TRYK_OVERALL_SAGE_BLKboots_nk_blk2",nil,850],
			["TRYK_OVERALL_nok_flesh",nil,850],
			["TRYK_SUITS_BLK_F", 1000],
			["U_B_Wetsuit",nil,500]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["GORRA_SAMUR",nil,500],
		    ["GORRA_SEM",nil,500],
			["H_Orel_FireFighter",nil,850],
			["H_CrewHelmetHeli_O",nil,850],
			["H_PilotHelmetHeli_O",nil,850],
			["H_Orel_FireFighter_Gaz",nil,850]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Diving", nil, 20]
			
		];
	};
	
	//Vest
	case 3:
	{
		[
			["SAMUR_CHALECO",nil,500],
			["SAMUR_CHALECO2",nil,500],
            ["SAMUR_CHALECO3",nil,500],
			["SAMUR_CHALECO4",nil,500],
		    ["SEM_CHALECO",nil,500],
			["SEM_CHALECO2",nil,500],
		    ["SEM_CHALECO3",nil,500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["mochila_mediana",nil,1000],
			["mochila_pequena",nil,300]
		];
	};
};
