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
ctrlSetText[3103,"Moda POP"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
        ["Tren",nil,3600 * Desc],
		["POP_Simpson",nil,3600 * Desc],
		["POP_Logo1",nil,3600 * Desc],
		["POP_Mano",nil,3600 * Desc],
		["POP_Mario",nil,3600 * Desc],
		["POP_Estoytoloko",nil,3600 * Desc],
		["POP_Lecuesta",nil,3600 * Desc],
		["POP_Paridas",nil,3600 * Desc],
		["POP_Google",nil,3600 * Desc],
		["POP_Fracasado",nil,3600 * Desc],
		["POP_Pena",nil,3600 * Desc],
		["POP_Sirena",nil,3600 * Desc],
		["POP_Torito",nil,3600 * Desc],
		["POP_Bebe",nil,3600 * Desc],
		["POP_Padre",nil,3600 * Desc],
		["POP_Chorizo",nil,3600 * Desc],
		["POP_Open",nil,3600 * Desc],
		["POP_Vivir",nil,3600 * Desc],
		["PACMAN_Pop",nil,3600 * Desc],
		["JWORLD_Pop",nil,3600 * Desc],
		["RAPTORS_Pop",nil,3600 * Desc],
		["RAPTORS2_Pop",nil,3600 * Desc],
		["KITKAT_Pop",nil,3600 * Desc],
		["MARITRINI_Pop",nil,3600 * Desc],
		["APIPAS_Pop",nil,3600 * Desc],
		["ET_Pop",nil,3600 * Desc],
		["PICAPIEDRA_Pop",nil,3600],
		["IDIOTA_Pop",nil,3600 * Desc],
		["NOENTIENDO_Pop",nil,3600 * Desc],
		["TITTY_Pop",nil,3600 * Desc],
		["MADURANDO_Pop",nil,3600],
		["CEDA_Pop",nil,3600 * Desc],
		["IBERDROGA_Pop",nil,3600 * Desc],
		["MORCILLA_Pop",nil,3600 * Desc],
		["PUMBA_Pop",nil,3600 * Desc],
		["LOGOPOP_Pop",nil,3600 * Desc],
		["TRONOS_Pop",nil,3600 * Desc],
		["CHAQUETANEGRA_Pop",nil,3600 * Desc],
		["CHAQUETALEOPARDO_Pop",nil,3600 * Desc],
		["CHAQUETASERPIENTE_Pop",nil,3600 * Desc],
		["CHAQUETAMARRON_Pop",nil,3600 * Desc],
		["CHAQUETAROJA_Pop",nil,4000 * Desc],
		["CHAQUETAAZUL_Pop",nil,4000 * Desc],
		["TRYK_U_B_BLK_T_BK",nil,4000 * Desc],
		["TRYK_U_B_BLK_T_WH",nil,4000 * Desc],
		["TRYK_U_B_Denim_T_BK",nil,4000 * Desc],
		["TRYK_U_B_Denim_T_WH",nil,4000 * Desc],
		["TRYK_U_denim_jersey_blk",nil,4000 * Desc],
		["TRYK_U_denim_jersey_blu",nil,4000 * Desc],
		["TRYK_U_denim_hood_nc",nil,4000 * Desc],
		["TRYK_U_denim_hood_blk",nil,4000 * Desc],
		["TRYK_U_B_wh_blk_Rollup_CombatUniform",nil,4000 * Desc],
		["TRYK_U_B_wh_tan_Rollup_CombatUniform",nil,4000 * Desc],
		["TRYK_shirts_DENIM_BK",nil,4000 * Desc],
		["TRYK_shirts_DENIM_BL",nil,4000 * Desc],
		["TRYK_shirts_DENIM_BWH",nil,4000 * Desc],
		["TRYK_shirts_DENIM_od",nil,4000 * Desc],
		["TRYK_shirts_DENIM_R",nil,4000 * Desc],
		["TRYK_shirts_DENIM_RED2",nil,4000 * Desc],
		["TRYK_shirts_DENIM_WH",nil,4000 * Desc],
		["TRYK_shirts_DENIM_WHB",nil,4000 * Desc],
		["TRYK_shirts_DENIM_ylb",nil,4000 * Desc],
		["TRYK_shirts_DENIM_BK_Sleeve",nil,4000 * Desc],
		["TRYK_shirts_DENIM_WH_Sleeve",nil,4000 * Desc],
		["TRYK_U_B_BLK_T_BG_BK",nil,4000 * Desc],
		["TRYK_U_B_RED_T_BG_BR",nil,4000 * Desc],
		["U_C_Travello2",nil,4000 * Desc],
		["TRYK_U_B_BLK_T_BK",nil,4000 * Desc],
		["U_C_Travello1",nil,4000 * Desc],
		["TRYK_SUITS_BLK_F",nil,20000 * Desc]
		
		];
	};
	
	//Hats
	case 1:
	{
		[		
			["H_MickeyMask",nil,1500 * Desc],
			["H_UltronMask",nil,1500 * Desc],
			["H_PatriotMask",nil,1500 * Desc],
			["H_AntmanMask",nil,1500 * Desc],
			["H_BobaMask",nil,1500 * Desc],
			["H_RAAMMask",nil,1500 * Desc],
			["H_HulkMask",nil,1500 * Desc],
			["H_SpongebobMask",nil,1500 * Desc],
			["H_SquidwardMask",nil,1500 * Desc],
			["H_JasonMask",nil,1500 * Desc],
			["H_DeadpoolMask",nil,1500 * Desc],
			["H_GingerbreadMask",nil,1500 * Desc],
			["H_SpidermanMask",nil,1500 * Desc],
			["H_StarFoxMask",nil,1500 * Desc],
			["H_BatmanMask",nil,1500 * Desc],
			["H_ScarecrowMask",nil,1500 * Desc],
			["H_GuyFawkesMask",nil,1500 * Desc],
			["H_WashingtonMask",nil,1500 * Desc],
			["H_LincolnMask",nil,1500 * Desc],
			["H_GrantMask",nil,1500 * Desc],
			["H_NixonMask",nil,1500 * Desc],
			["H_ClintonMask",nil,1500 * Desc],
			["H_BushMask",nil,1500 * Desc],
			["H_FranklinMask",nil,1500 * Desc],
			["TRYK_H_Bandana_H",nil,1500 * Desc],
			["TRYK_H_Bandana_wig",nil,1500 * Desc],
			["TRYK_H_Bandana_wig_g",nil,1500 * Desc],
			["H_Spliff",nil,1500 * Desc],
			["TRYK_R_CAP_BLK",nil,1500 * Desc],
			["TRYK_R_CAP_TAN",nil,1500 * Desc],
			["TRYK_R_CAP_OD_US",nil,1500 * Desc],
			["H_RacingHelmet_1_black_F",nil,1500 * Desc],
			["H_RacingHelmet_1_red_F",nil,1500 * Desc],
			["H_RacingHelmet_1_white_F",nil,1500 * Desc],
			["H_RacingHelmet_1_blue_F",nil,1500 * Desc],
			["H_RacingHelmet_1_yellow_F",nil,1500 * Desc],
			["H_RacingHelmet_1_green_F",nil,1500 * Desc],
			["H_RacingHelmet_1_F",nil,1500 * Desc],
			["H_RacingHelmet_2_F",nil,1500 * Desc],
			["H_RacingHelmet_3_F",nil,1500 * Desc],
			["H_RacingHelmet_4_F",nil,1500 * Desc],
			["POP_Mohawk",nil,3500 * Desc],
			["POP_Tophat",nil,2500 * Desc],
			["POP_Cowboy_hat",nil,2500 * Desc],
			["pop_gorra_cyan",nil,1500 * Desc],
			["pop_gorra_superman",nil,1500 * Desc],
			["pop_gorra_monster",nil,1500 * Desc],
			["pop_gorra_lakers",nil,1500 * Desc],
			["pop_gorra_redsox",nil,1500 * Desc],
			["pop_mexicano",nil,1500 * Desc],
			["pop_cowboy_brown",nil,1500 * Desc],
			["pop_cowboy_white",nil,1500 * Desc],
			["Masque_Alien1",nil,1500 * Desc],
			["Masque_Anonymous",nil,1500 * Desc],
			["Masque_Chains",nil,1500 * Desc],
			["Payday_GeneralO",nil,1500 * Desc],
			["Casque_Moto",nil,1500 * Desc],
			["Masque_speedRunner",nil,1500 * Desc],
			["Masque_Unic",nil,1500 * Desc],
			["Masque_Aubrey",nil,1500 * Desc],
			["Masque_Bonnie",nil,1500 * Desc],
			["Masque_Bush",nil,1500 * Desc],
			["Masque_Lincoln",nil,1500 * Desc],
			["Masque_Wolfv2",nil,1500 * Desc],
			["Masque_Arnold",nil,1500 * Desc],
			["Masque_Chuck",nil,1500 * Desc],
			["Masque_Fish",nil,1500 * Desc],
			["Masque_Clover",nil,1500 * Desc],
			["Masque_Hockey",nil,1500 * Desc],
			["Masque_Religieuse",nil,1500 * Desc],
			["Masque_Smiley",nil,1500 * Desc],
			["Masque_Santa",nil,1500 * Desc],
			["Masque_Momie",nil,1500 * Desc],
			["Masque_GdG",nil,1500 * Desc],
			["Masque_Gombo",nil,1500 * Desc],
			["Masque_Macrilleuse",nil,1500],
			["Masque_Hoxton",nil,1500 * Desc],
			["Masque_Incendiaire",nil,1500 * Desc],
			["Masque_Dallas",nil,1500 * Desc],
			["Masque_Chains",nil,1500 * Desc]
			
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["EWK_Cig1",nil,600 * Desc],
			["EWK_Cig2",nil,600 * Desc],
			["EWK_Cig3",nil,600 * Desc],
			["EWK_Cig4",nil,600 * Desc],
			["EWK_Glasses_Cig1",nil,600 * Desc],
			["EWK_Glasses_Cig2",nil,600 * Desc],
			["EWK_Glasses_Cig3",nil,600 * Desc],
			["EWK_Glasses_Cig4",nil,600 * Desc],
			["EWK_Cigar1",nil,600 * Desc],
			["EWK_Cigar2",nil,600 * Desc],
			["EWK_Glasses_Shemag_GRE_Cig6",nil,600 * Desc],
			["EWK_Glasses_Shemag_NB_Cig6",nil,600 * Desc],
			["EWK_Glasses_Shemag_tan_Cig6",nil,600 * Desc],
			["EWK_Shemag_tan_Cig6",nil,600 * Desc],
			["EWK_Shemag_NB_Cig6",nil,600 * Desc],
			["EWK_Shemag_GRE_Cig6",nil,600 * Desc],
			["EWK_Shemag_LULZ",nil,600 * Desc],
			["EWK_Shemag_GRE",nil,600 * Desc],
			["EWK_Shemag_tan",nil,600 * Desc],
			["EWK_Shemag_NB",nil,600 * Desc],
			["SFG_Tac_smallBeardB",nil,600 * Desc],
			["SFG_Tac_BeardD",nil,600 * Desc],
			["SFG_Tac_BeardB",nil,600 * Desc],
			["SFG_Tac_BeardG",nil,600 * Desc],
			["SFG_Tac_BeardO",nil,600 * Desc],
			["SFG_Tac_ChopsD",nil,600 * Desc],
			["SFG_Tac_ChopsG",nil,600 * Desc],
			["SFG_Tac_ChopsB",nil,600 * Desc],
			["SFG_Tac_ChopsO",nil,600 * Desc],
			["SFG_Tac_moustacheD",nil,600 * Desc],
			["SFG_Tac_moustacheG",nil,600 * Desc],
			["SFG_Tac_moustacheB",nil,600 * Desc],
			["SFG_Tac_moustacheO",nil,600 * Desc],
			["SFG_Tac_chinlessbD",nil,600 * Desc],
			["SFG_Tac_chinlessbG",nil,600 * Desc],
			["SFG_Tac_chinlessbO",nil,600 * Desc],
			["SFG_Tac_chinlessbB",nil,600 * Desc],
			["SFG_Tac_smallBeardG",nil,600 * Desc],
			["SFG_Tac_smallBeardO",nil,600 * Desc],
			["Masque_Chirurgical",nil,600 * Desc],
			["Payday_Cagoule",nil,600 * Desc],
			["Masque_Solitaire",nil,600 * Desc],
			["G_Shades_Blue",nil,600 * Desc],
			["G_Sport_Blackred",nil,600 * Desc],
			["G_Sport_Checkered",nil,600 * Desc],
			["G_Sport_Blackyellow",nil,600 * Desc],
			["G_Sport_BlackWhite",nil,600 * Desc],
			["G_Squares",nil,600 * Desc],
			["G_Aviator",nil,600 * Desc],
			["G_Lady_Mirror",nil,600 * Desc],
			["G_Lady_Dark",nil,600 * Desc],
			["G_Lady_Blue",nil,600 * Desc],
			["G_Lowprofile",nil,600 * Desc],
			["G_Combat",nil,600 * Desc]
		];
	};
	
	//Vest
	case 3:
	{
		[

		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500 * Desc],
			["B_Kitbag_mcamo",nil,4500 * Desc],
			["B_TacticalPack_oli",nil,3500 * Desc],
			["B_FieldPack_ocamo",nil,3000 * Desc],
			["B_Bergen_sgg",nil,4500 * Desc],
			["B_Kitbag_cbr",nil,4500 * Desc],
			["mochila_pequena",nil,4500 * Desc]
		];
	};
};