#include <macro.h>
/*
        File:
        Author: Bryan "Tonic" Boardwine

        Description:
        Master configuration list / array for buyable vehicles & prices and their shop.
*/
private ["_shop", "_return"];
_shop = [_this, 0, "", [""]] call BIS_fnc_param;
if (_shop == "") exitWith { []};
_return = [];
switch (_shop) do {
	case "dezzie_car": {
		_return = [
			["POP_Ferrari_Enzo_rojo", 2000000 * Desc],
			["shounka_f430_spider_amarillo", 2000000 * Desc],
			["shounka_f430_spider", 2000000 * Desc],
			["shounka_f430_spider_azul", 2000000 * Desc],
			["shounka_f430_spider_gris", 2000000 * Desc],
			["shounka_f430_spider_naranja", 2000000 * Desc],
			["shounka_f430_spider_negro", 2000000 * Desc],
			["shounka_f430_spider_rojo", 2000000 * Desc],
			["shounka_f430_spider_rosa", 2000000 * Desc],
			["shounka_f430_spider_violeta", 2000000 * Desc],
			["pop_porsche911", 1750000 * Desc],
			["pop_porsche911_gris", 1750000 * Desc],
			["pop_porsche911_naranja", 1750000 * Desc],
			["pop_porsche911_negro", 1750000 * Desc],
			["pop_porsche911_rojo", 1750000 * Desc],
			["pop_porsche911_rosa", 1750000 * Desc],
			["pop_porsche911_violeta", 1750000 * Desc],
			["pop_porsche911_amariilo", 1750000 * Desc],
			["pop_porsche911_azul", 1750000 * Desc],
			["pop_LamborghiniVeneno_negro", 2000000 * Desc],
			["pop_LamborghiniVeneno_negro1", 2000000 * Desc],
			["pop_LamborghiniVeneno_gris", 2000000 * Desc],
			["pop_mp4", 2000000 * Desc],
			["pop_mp4_bleufonce", 2000000 * Desc],
			["pop_mp4_grise", 2000000 * Desc],
			["pop_mp4_jaune", 2000000 * Desc],
			["pop_mp4_noir", 2000000 * Desc],
			["pop_mp4_orange", 2000000 * Desc],
			["pop_mp4_rose", 2000000 * Desc],
			["pop_mp4_rouge", 2000000 * Desc],
			["pop_mp4_violet", 2000000 * Desc],
			["pop_agera_p", 1500000 * Desc],
			["pop_agera_amarillo", 1500000 * Desc],
			["pop_agera_azul", 1500000 * Desc],
			["pop_agera_negro", 1500000 * Desc],
			["pop_panamera_negro", 1500000 * Desc],
			["pop_panamera_azul", 1500000 * Desc],
			["pop_panamera_rojo", 1500000 * Desc],
			["pop_panamera_amarillo", 1500000 * Desc],
			["pop_panamera_rosa", 1500000 * Desc],
			["pop_panamera_gris", 1500000 * Desc],
			["pop_panamera_naranja", 1500000 * Desc],
			["pop_gt_noir", 1500000 * Desc],
			["pop_gt_bleufonce", 1500000 * Desc],
			["pop_gt_rouge", 1500000 * Desc],
			["pop_gt_jaune", 1500000 * Desc],
			["pop_gt_rose", 1500000 * Desc],
			["pop_gt_grise", 1500000 * Desc],
			["pop_gt_violet", 1500000 * Desc],
			["pop_gt_orange", 1500000 * Desc],
			["pop_pagani_c", 1500000 * Desc],
			["pop_pagani_c_noir", 1500000 * Desc],
			["pop_pagani_c_bleufonce", 1500000 * Desc],
			["pop_pagani_c_rouge", 1500000 * Desc],
			["pop_pagani_c_jaune", 1500000 * Desc],
			["pop_pagani_c_rose", 1500000 * Desc],
			["pop_pagani_c_grise", 1500000 * Desc],
			["pop_pagani_c_violet", 1500000 * Desc],
			["pop_pagani_c_orange", 1500000 * Desc],
			["pop_lykan_Hypersport_violeta", 1500000 * Desc],
			["pop_lykan_Hypersport_noir", 1500000 * Desc],
			["pop_lykan_Hypersport_bleufonce", 1500000 * Desc],
			["pop_lykan_Hypersport_rouge", 1500000 * Desc],
			["pop_lykan_Hypersport_jaune", 1500000 * Desc],
			["pop_lykan_Hypersport_rose", 1500000 * Desc],
			["pop_lykan_Hypersport_grise", 1500000 * Desc],
			["pop_lykan_Hypersport_orange", 1500000 * Desc],
			["pop_bmw_1series", 1000000 * Desc],
			["pop_bmw_1series_bleufonce", 1000000 * Desc],
			["pop_bmw_1series_grise", 1000000 * Desc],
			["pop_bmw_1series_jaune", 1000000 * Desc],
			["pop_bmw_1series_noir", 1000000 * Desc],
			["pop_bmw_1series_orange", 1000000 * Desc],
			["pop_bmw_1series_rose", 1000000 * Desc],
			["pop_bmw_1series_rouge", 1000000 * Desc],
			["pop_bmw_1series_violet", 1000000 * Desc]
		];
	};
	case "kart_shop": {
		_return = [
			["C_Kart_01_Blu_F", 15000 * Desc],
			["C_Kart_01_Fuel_F", 15000 * Desc],
			["C_Kart_01_Red_F", 15000 * Desc],
			["C_Kart_01_Vrana_F", 15000 * Desc]
		];
	};
	case "taxista_shop": {
		_return = [
			["POP_Opel_Insignia_taxi", 25000 * Desc],
			["Mercedes_Pullman_negra", 100000 * Desc]
		];
	};
	case "periodista_shop": {
		_return = [
			["pop_cherokee_prensa", 50000 * Desc]
		];
	};
	case "med_shop": {
		_return = [
			["POP_Mercedes_Sprinter_amb", 35000 * Desc],
			["POP_Mercedes_Sprinter_cruz", 35000 * Desc],
			["pop_Volkswagen_Touareg_sem", 25000 * Desc],
			["pop_grua", 25000 * Desc],
			["pop_cayenne_samur", 25000 * Desc],
			["POP_corbillard_c_noir", 25000 * Desc],
			["ec135_ems_F", 50000 * Desc]
		];
	};
	case "med_air_hs": {
		_return = [
			["ec135_ems_F", 50000 * Desc]
		];
	};
	case "exo_car": {
		_return = [
			["pop_bmwm6_negro", 180000 * Desc],
			["pop_bmwm6_azul", 180000 * Desc],
			["pop_bmwm6_rojo", 180000 * Desc],
			["pop_bmwm6_amarillo", 180000 * Desc],
			["pop_bmwm6_rosa", 180000 * Desc],
			["pop_bmwm6_gris", 180000 * Desc],
			["pop_bmwm6_violet", 180000 * Desc],
			["pop_bmwm6_naranja", 180000 * Desc],
			["pop_mercedes_190_p_civ", 160000 * Desc],
			["pop_mercedes_190_p_amarillo", 160000 * Desc],
			["pop_mercedes_190_p_azul", 160000 * Desc],
			["pop_mercedes_190_p_grise", 160000 * Desc],
			["pop_mercedes_190_p_naranja", 160000 * Desc],
			["pop_mercedes_190_p_negro", 160000 * Desc],
			["pop_mercedes_190_p_rojo", 160000 * Desc],
			["pop_mercedes_190_p_rosa", 160000 * Desc],
			["pop_mercedes_190_p_violeta", 160000 * Desc],
			["pop_a3_308", 100000 * Desc],
			["pop_a3_308_rcz_bleufonce", 100000 * Desc],
			["pop_a3_308_rcz_grise", 100000 * Desc],
			["pop_a3_308_rcz_jaune", 100000 * Desc],
			["pop_a3_308_rcz_noir", 100000 * Desc],
			["pop_a3_308_rcz_orange", 100000 * Desc],
			["pop_a3_308_rcz_rose", 100000 * Desc],
			["pop_a3_308_rcz_rouge", 100000 * Desc],
			["pop_a3_308_rcz_violet", 100000 * Desc],
			["pop_subaru08_civ", 120000 * Desc],
			["pop_subaru08_amarillo", 120000 * Desc],
			["pop_subaru08_azul", 120000 * Desc],
			["pop_subaru08_gris", 120000 * Desc],
			["pop_subaru08_naranja", 120000 * Desc],
			["pop_subaru08_negro", 120000 * Desc],
			["pop_subaru08_rojo", 120000 * Desc],
			["pop_subaru08_rosa", 120000 * Desc],
			["pop_subaru08_violeta", 120000 * Desc],
			["pop_clk", 250000 * Desc],
			["pop_clk_noir", 250000 * Desc],
			["pop_clk_bleufonce", 250000 * Desc],
			["pop_clk_rouge", 250000 * Desc],
			["pop_clk_jaune", 250000 * Desc],
			["pop_clk_rose", 250000 * Desc],
			["pop_clk_grise", 250000 * Desc],
			["pop_clk_violet", 250000 * Desc],
			["pop_clk_orange", 250000 * Desc],
			["pop_toyota_gt86_Blanco", 180000 * Desc],
			["pop_toyota_gt86_silver", 180000 * Desc],
			["pop_toyota_gt86_gris", 180000 * Desc],
			["pop_toyota_gt86_negro", 180000 * Desc],
			["pop_toyota_gt86_rojo", 180000 * Desc],
			["pop_cayenne_p_negro", 175000 * Desc],
			["pop_cayenne_p_azul", 175000 * Desc],
			["pop_cayenne_p_rojo", 175000 * Desc],
			["pop_cayenne_p_amarillo", 175000 * Desc],
			["pop_cayenne_p_rosa", 175000 * Desc],
			["pop_cayenne_p_gris", 175000 * Desc],
			["pop_cayenne_p_violeta", 175000 * Desc],
			["pop_cayenne_p_naranja", 175000 * Desc],
			["pop_dodge15_civ_negro", 100000 * Desc],
			["pop_dodge15_civ_azuloscuro", 100000 * Desc],
			["pop_dodge15_civ_rojo", 100000 * Desc],
			["pop_dodge15_civ_amarillo", 100000 * Desc],
			["pop_dodge15_civ_rosa", 100000 * Desc],
			["pop_dodge15_civ_gris", 100000 * Desc],
			["pop_dodge15_civ_violeta", 100000 * Desc],
			["pop_dodge15_civ_naranja", 100000 * Desc],
			["pop_gtr_blanco", 100000 * Desc],
			["pop_gtr_negro", 100000 * Desc],
			["pop_gtr_azul", 100000 * Desc],
			["pop_lincoln_rojo", 100000 * Desc],
			["pop_lincoln_azul", 100000 * Desc],
			["pop_lincoln_amarillo", 100000 * Desc],
			["pop_lincoln_gris", 100000 * Desc],
			["pop_lincoln_violeta", 100000 * Desc],
			["pop_lincoln_naranja", 100000 * Desc],
			["pop_mustang_negro", 100000 * Desc],
			["pop_mustang_azul", 100000 * Desc],
			["pop_mustang_rojo", 100000 * Desc],
			["pop_mustang_amarillo", 100000 * Desc],
			["pop_mustang_rosa", 100000 * Desc],
			["pop_mustang_gris", 100000 * Desc],
			["pop_mustang_violeta", 100000 * Desc],
			["pop_transam_noir", 100000 * Desc],
			["pop_transam_bleufonce", 100000 * Desc],
			["pop_transam_rouge", 100000 * Desc],
			["pop_transam_jaune", 100000 * Desc],
			["pop_transam_rose", 100000 * Desc],
			["pop_transam_grise", 100000 * Desc],
			["pop_transam_violet", 100000 * Desc],
			["pop_transam_orange", 100000 * Desc],
			["pop_hotrod_civ", 100000 * Desc],
			["pop_hotrod_civ", 100000 * Desc],
			["pop_mustang_naranja", 100000 * Desc]

		];
	};


	case "moto_chop": {
		_return = [
			["pop_yamaha_p", 22000 * Desc],
			["pop_yamaha_p_bf", 32600 * Desc],
			["pop_yamaha_p_g", 32600 * Desc],
			["pop_yamaha_p_j", 32600 * Desc],
			["pop_yamaha_p_noir", 32600 * Desc],
			["pop_yamaha_p_o", 32600 * Desc],
			["pop_yamaha_p_rose", 32600 * Desc],
			["pop_yamaha_p_r", 32600 * Desc],
			["pop_yamaha_p_v", 32600 * Desc],
			["pop_ducati_negra", 25000 * Desc],
			["pop_ducati_azul", 25000 * Desc],
			["pop_ducati_roja", 25000 * Desc],
			["pop_ducati_Amarilla", 25000 * Desc],
			["pop_ducati_rosa", 25000 * Desc],
			["pop_ducati_gris", 25000 * Desc],
			["pop_ducati_violeta", 25000 * Desc],
			["pop_ducati_naranja", 25000 * Desc]
		];
	};

	case "dodge_car": {
		_return = [
			["pop_hummer_civ", 250000 * Desc],
			["pop_hummer_civ_amarillo", 250000 * Desc],
			["pop_hummer_civ_azulfuerte", 250000 * Desc],
			["pop_hummer_civ_gris", 250000 * Desc],
			["pop_hummer_civ_Naranja", 250000 * Desc],
			["pop_hummer_civ_negro", 250000 * Desc],
			["pop_hummer_civ_rojo", 250000 * Desc],
			["pop_hummer_civ_rosa", 250000 * Desc],
			["pop_hummer_civ_violeta", 250000 * Desc],
			["pop_h2", 250000 * Desc],
			["pop_h2_bleufonce", 250000 * Desc],
			["pop_h2_grise", 250000 * Desc],
			["pop_h2_jaune", 250000 * Desc],
			["pop_h2_noir", 250000 * Desc],
			["pop_h2_orange", 250000 * Desc],
			["pop_h2_rose", 250000 * Desc],
			["pop_h2_rouge", 250000 * Desc],
			["pop_h2_violet", 250000 * Desc],
			["pop_Bowler_c", 200000 * Desc],
			["pop_Bowler_c_bleufonce", 200000 * Desc],
			["pop_Bowler_c_grise", 200000 * Desc],
			["pop_Bowler_c_jaune", 200000 * Desc],
			["pop_Bowler_c_noir", 200000 * Desc],
			["pop_Bowler_c_orange", 200000 * Desc],
			["pop_Bowler_c_rose", 200000 * Desc],
			["pop_Bowler_c_rouge", 200000 * Desc],
			["pop_Bowler_c_violet", 200000 * Desc],
			["pop_avalanche", 200000 * Desc],
			["pop_avalanche_amarillo", 200000 * Desc],
			["pop_avalanche_azul", 200000 * Desc],
			["pop_avalanche_gris", 200000 * Desc],
			["pop_avalanche_naranja", 200000 * Desc],
			["pop_avalanche_negro", 200000 * Desc],
			["pop_avalanche_rojo", 200000 * Desc],
			["pop_avalanche_rosa", 200000 * Desc],
			["pop_avalanche_violeta", 200000 * Desc],
			["pop_monsteur", 500000 * Desc],
			["pop_monsteur_amarillo", 500000 * Desc],
			["pop_monsteur_azul", 500000 * Desc],
			["pop_monsteur_gris", 500000 * Desc],
			["pop_monsteur_naranja", 500000 * Desc],
			["pop_monsteur_negro", 500000 * Desc],
			["pop_monsteur_rojo", 500000 * Desc],
			["pop_monsteur_rosa", 500000 * Desc],
			["pop_monsteur_violeta", 500000 * Desc],
			["POP_jeep_blinde_azul", 200000 * Desc],
			["POP_jeep_blinde_azul_mate", 200000 * Desc],
			["POP_jeep_blinde_blanco", 200000 * Desc],
			["POP_jeep_blinde_blanco_mate", 200000 * Desc],
			["POP_jeep_blinde_violeta", 200000 * Desc],
			["pop_jeep_blinde_violeta_mate", 200000 * Desc],
			["POP_jeep_blinde_rojo", 200000 * Desc],
			["POP_jeep_blinde_rojo_mate", 200000 * Desc],
			["POP_Landrover_Defender", 200000 * Desc],
			["pop_raptor_blanco", 300000 * Desc],
			["pop_raptor_negro", 300000 * Desc],
			["pop_raptor_azul", 300000 * Desc],
			["pop_raptor_rojo", 300000 * Desc],
			["pop_raptor_amarillo", 300000 * Desc],
			["pop_raptor_gris", 300000 * Desc],
			["pop_raptor_violeta", 300000 * Desc],
			["pop_raptor_naranja", 300000 * Desc],
			["pop_UAZ_Patriot_negro", 300000 * Desc],
			["pop_Vandura_civ_equipoa", 400000 * Desc],
			["pop_Volkswagen_Touareg_rojo", 175000 * Desc],
			["pop_Volkswagen_Touareg_negro", 175000 * Desc],
			["pop_Volkswagen_Touareg_azul", 175000 * Desc],
			["pop_Volkswagen_Touareg_violeta", 175000 * Desc],
			["pop_Volkswagen_Touareg_amarillo", 175000 * Desc],
			["pop_Volkswagen_Touareg_rosa", 175000 * Desc],
			["pop_Volkswagen_Touareg_gris", 175000 * Desc],
			["pop_Volkswagen_Touareg_naranja", 175000 * Desc],
			["pop_cherokee_negro", 150000 * Desc],
			["pop_cherokee_negro_mate", 150000 * Desc],
			["pop_cherokee_negro_azul", 150000 * Desc],
			["pop_cherokee_negro_azul_mate", 150000 * Desc],
			["pop_cherokee_negro_blanco", 150000 * Desc],
			["pop_cherokee_negro_blano_mate", 150000 * Desc],
			["pop_cherokee_negro_violeta", 150000 * Desc],
			["pop_cherokee_negro_violeta_mate", 150000 * Desc],
			["pop_cherokee_negro_rojo", 150000 * Desc],
			["pop_cherokee_negro_rojo_mate", 150000 * Desc],
			["POP_Qashqai_amarillo", 150000 * Desc],
			["POP_Qashqai_blanco", 150000 * Desc],
			["POP_Qashqai_azul", 150000 * Desc],
			["POP_Qashqai_gris", 150000 * Desc],
			["POP_Qashqai_negro", 150000 * Desc],
			["POP_Qashqai_naranja", 150000 * Desc],
			["POP_Qashqai_rosado", 150000 * Desc],
			["POP_Qashqai_rojo", 150000 * Desc],
			["POP_Qashqai_rojo_oscuro", 150000 * Desc],
			["POP_Qashqai_violeta", 150000 * Desc],
			["POP_Qashqai_rojo_oscuro", 150000 * Desc],
			["pop_smart_supercharge_civ_azul", 150000 * Desc],
			["pop_smart_supercharge_civ_negro", 150000 * Desc],
			["pop_a3_audiq7_bleu", 175000 * Desc],
			["pop_smart_supercharge_rojo", 150000 * Desc]


		];
	};

	case "civ_car": {
		_return = [
			["POP_207_rojo", 35000 * Desc],
			["POP_207_negro", 35000 * Desc],
			["POP_207_amarillo", 35000 * Desc],
			["POP_207_rose", 35000 * Desc],
			["POP_207_gris", 35000 * Desc],
			["POP_207_violeta", 35000 * Desc],
			["POP_207_naranja", 35000 * Desc],
			["pop_golfvi_civ", 35000 * Desc],
			["pop_golfvi_bleufonce", 35000 * Desc],
			["pop_golfvi_grise", 35000 * Desc],
			["pop_golfvi_jaune", 35000 * Desc],
			["pop_golfvi_noir", 35000 * Desc],
			["pop_golfvi_orange", 35000 * Desc],
			["pop_golfvi_rose", 35000 * Desc],
			["pop_golfvi_rouge", 35000 * Desc],
			["pop_golfvi_violet", 35000 * Desc],
			["pop_308_negro", 35000 * Desc],
			["pop_308_azul", 35000 * Desc],
			["pop_308_rojo", 35000 * Desc],
			["pop_308_amarillo", 35000 * Desc],
			["pop_308_violeta", 35000 * Desc],
			["pop_308_gris", 35000 * Desc],
			["pop_308_naranja", 35000 * Desc],
			["pop_308_rosa", 35000 * Desc],
			["pop_twingo_p", 20000 * Desc],
			["pop_twingo_p_amarillo", 20000 * Desc],
			["pop_twingo_p_azul", 20000 * Desc],
			["pop_twingo_p_gris", 20000 * Desc],
			["pop_twingo_p_naranja", 20000 * Desc],
			["pop_twingo_p_negro", 20000 * Desc],
			["pop_twingo_p_rojo", 20000 * Desc],
			["pop_twingo_p_rosa", 20000 * Desc],
			["pop_twingo_p_violeta", 20000 * Desc],
			["pop_Alfa_Romeo_negro", 35000 * Desc],
			["pop_Alfa_Romeo_azuloscuro", 35000 * Desc],
			["pop_Alfa_Romeo_rojo", 35000 * Desc],
			["pop_Alfa_Romeo_amarillo", 35000 * Desc],
			["pop_Alfa_Romeo_rosa", 35000 * Desc],
			["pop_Alfa_Romeo_gris", 35000 * Desc],
			["pop_Alfa_Romeo_violetta", 35000 * Desc],
			["pop_Alfa_Romeo_Naranga", 35000 * Desc],
			["pop_c4_p_negro", 17000 * Desc],
			["pop_c4_p_azul", 17000 * Desc],
			["pop_c4_p_rojo", 17000 * Desc],
			["pop_c4_p_amarillo", 17000 * Desc],
			["pop_c4_p_rosa", 17000 * Desc],
			["pop_c4_p_gris", 17000 * Desc],
			["pop_c4_p_violeta", 17000 * Desc],
			["pop_c4_p_naranja", 17000 * Desc],
			["pop_c4_picasso_p_azul", 10000 * Desc],
			["pop_c4_picasso_p_negro", 10000 * Desc],
			["pop_c4_picasso_p_rojo", 10000 * Desc],
			["pop_c4_picasso_p_amarillo", 10000 * Desc],
			["pop_c4_picasso_p_rosa", 10000 * Desc],
			["pop_c4_picasso_p_gris", 10000 * Desc],
			["pop_c4_picasso_p_violeta", 10000 * Desc],
			["pop_c4_picasso_p_naranja", 10000 * Desc],
			["pop_ds3_negro", 35000 * Desc],
			["pop_ds3_azul", 35000 * Desc],
			["pop_ds3_civ_rojo", 35000 * Desc],
			["pop_ds3_amarillo", 35000 * Desc],
			["pop_ds3_rosa", 35000 * Desc],
			["pop_ds3_gris", 35000 * Desc],
			["pop_ds3_violeta", 35000 * Desc],
			["pop_ds3_naranja", 35000 * Desc],
			["pop_ds4_negro", 35000 * Desc],
			["pop_ds4_azul", 35000 * Desc],
			["pop_ds4_rojo", 35000 * Desc],
			["pop_ds4_amarillo", 35000 * Desc],
			["pop_ds4_rosa", 35000 * Desc],
			["pop_ds4_gris", 35000 * Desc],
			["pop_ds4_violeta", 35000 * Desc],
			["pop_ds4_naranja", 35000 * Desc],
			["pop_r5_negro", 35000 * Desc],
			["pop_r5_azul", 35000 * Desc],
			["pop_r5_rojo", 35000 * Desc],
			["pop_r5_amarillo", 35000 * Desc],
			["pop_r5_rosa", 35000 * Desc],
			["pop_r5_gris", 35000 * Desc],
			["pop_r5_violeta", 35000 * Desc],
			["pop_r5_naranja", 35000 * Desc],
			["pop_rs_rojo", 35000 * Desc],
			["pop_rs_negro", 35000 * Desc],
			["pop_rs_azul", 35000 * Desc],
			["pop_rs_amarillo", 35000 * Desc],
			["pop_rs_rosa", 35000 * Desc],
			["pop_rs_gris", 35000 * Desc],
			["pop_rs_violeta", 35000 * Desc],
			["pop_rs_naranja", 35000 * Desc],
			["POP_smart_rojo", 25000 * Desc],
			["POP_smart_civ_negro", 25000 * Desc],
			["pop_peugeot508_civ", 50000 * Desc],
			["pop_peugeot508_civ_noir", 50000 * Desc],
			["pop_peugeot508_civ_bleufonce", 50000 * Desc],
			["pop_peugeot508_civ_rouge", 50000 * Desc],
			["pop_peugeot508_civ_jaune", 50000 * Desc],
			["pop_peugeot508_civ_rose", 50000 * Desc],
			["pop_peugeot508_civ_grise", 50000 * Desc],
			["pop_peugeot508_civ_violet", 50000 * Desc],
			["pop_peugeot508_civ_orange", 50000 * Desc],
			["pop_rs6", 50000 * Desc],
			["pop_rs6_amarillo", 50000 * Desc],
			["pop_rs6_azul", 50000 * Desc],
			["pop_rs6_gris", 50000 * Desc],
			["pop_rs6_naranja", 50000 * Desc],
			["pop_rs6_negro", 50000 * Desc],
			["pop_rs6_rojo", 50000 * Desc],
			["pop_rs6_rosa", 50000 * Desc],
			["pop_rs6_violeta", 50000 * Desc],
			["POP_smart_civ_azul", 25000 * Desc]
			/*
			["POP_Citroen_2CV_amarillo", 10000 * Desc],
			["POP_Citroen_2CV_blanco", 10000 * Desc],
			["POP_Citroen_2CV_azul", 10000 * Desc],
			["POP_Citroen_2CV_marino", 10000 * Desc],
			["POP_Citroen_2CV_gris", 10000 * Desc],
			["POP_Citroen_2CV_negro", 10000 * Desc],
			["POP_Citroen_2CV_naranja", 10000 * Desc],
			["POP_Citroen_2CV_rosado", 10000 * Desc],
			["POP_Citroen_2CV_rojo", 10000 * Desc],
			["POP_Citroen_2CV_rojo_oscuro", 10000 * Desc],
			["POP_Citroen_2CV_lima", 10000 * Desc],
			["POP_Citroen_2CV_verde", 10000 * Desc],
			["POP_Citroen_2CV_violeta", 10000 * Desc],
			*/
		];
	};
	case "skate_shop": {
		_return = [

		];

	};
	case "tienda_trasporte": {
		_return = [
			["POP_renaultmagnum1_f", 220000 * Desc],
			["pop_Man_TGXsin_negro", 160000 * Desc],
			["pop_volvo_camion_sin", 100000 * Desc]
		];
	};
	case "civ_truck": {
		_return = [

			["POP_renaultmagnum_f", 400000 * Desc],
			["pop_Man_TGX_negro", 200000 * Desc],
			["pop_volvo_camion", 100000 * Desc],
			["POP_bus_tour_amarillo", 80000 * Desc],
			["POP_bus_tour_azul", 80000 * Desc],
			["POP_bus_tour_marino", 80000 * Desc],
			["POP_bus_tour_gris", 80000 * Desc],
			["POP_bus_tour_negro", 80000 * Desc],
			["POP_bus_tour_naranja", 80000 * Desc],
			["POP_bus_tour_rosado", 80000 * Desc],
			["POP_bus_tour_rojo", 80000 * Desc],
			["POP_bus_tour_rojo_oscuro", 80000 * Desc],
			["POP_bus_tour_verde", 80000 * Desc],
			["POP_bus_tour_violeta", 80000 * Desc],
			["pop_Vandura_civ", 100000 * Desc],
			["pop_Vandura_civ_negro", 100000 * Desc],
			["pop_Vandura_civ_azul", 100000 * Desc],
			["pop_Vandura_civ_rojo", 100000 * Desc],
			["pop_Vandura_civ_Amarillo", 100000 * Desc],
			["pop_Vandura_civ_rosa", 100000 * Desc],
			["pop_Vandura_civ_gris", 100000 * Desc],
			["pop_Vandura_civ_violeta", 100000 * Desc],
			["pop_Vandura_civ_naranja", 100000 * Desc],
			["pop_nemo", 100000 * Desc],
			["pop_nemo_noir", 100000 * Desc],
			["pop_nemo_bleufonce", 100000 * Desc],
			["pop_nemo_rouge", 100000 * Desc],
			["pop_nemo_jaune", 100000 * Desc],
			["pop_nemo_rose", 100000 * Desc],
			["pop_nemo_grise", 100000 * Desc],
			["pop_nemo_violet", 100000 * Desc],
			["pop_nemo_orange", 100000 * Desc],
			["pop_iveco_f", 150000 * Desc]

		];
	};
	case "med_ship": {
		_return = [
			["POP_Lancha_EMS", 10000 * Desc],
			["O_Lifeboat", 2500 * Desc]

		];
	};
	case "cop_car": {
		_return = [
			["pop_cherokee_ATGC", 20000 * Desc],
			["pop_cherokee_GC", 20000 * Desc],
			["POP_Opel_Insignia_ATGC", 15000 * Desc],
			["POP_Mercedes_Sprinter_cnp", 15000 * Desc],
			["POP_Mercedes_Sprinter_gc", 15000 * Desc],
			["pop_c4_picasso_cnp_new", 10000 * Desc],
			["pop_c4_picasso_gc_new", 10000 * Desc],
			["POP_rs_gend", 20000 * Desc],
			["POP_Qashqai_cnp", 20000 * Desc],
		 	["pop_toyota_gt86_policia", 20000 * Desc],
			["POP_Opel_Insignia_ka_GC", 20000 * Desc],
			["POP_Opel_Insignia_ka_CNP", 20000 * Desc],
			["POP_Opel_Insignia_ka_ATGC", 20000 * Desc],
			["POP_Opel_Insignia_ka_blanco_GC", 20000 * Desc],
			["POP_Opel_Insignia_ka_rojo_GC", 20000 * Desc],
			["POP_Opel_Insignia_ka_verde_GC", 20000 * Desc],
			["POP_Opel_Insignia_ka_azul_GC", 20000 * Desc],
			["POP_Opel_Insignia_ka_amarillo_GC", 20000 * Desc],
			["POP_Opel_Insignia_ka_blanco_CNP", 20000 * Desc],
			["POP_Opel_Insignia_ka_rojo_CNP", 20000 * Desc],
			["POP_Opel_Insignia_ka_verde_CNP", 20000 * Desc],
			["POP_Opel_Insignia_ka_azul_CNP", 20000 * Desc],
			["POP_Opel_Insignia_ka_amarillo_CNP", 20000 * Desc],
			["POP_Opel_Insignia_ka_blanco_ATGC", 20000 * Desc],
			["POP_Opel_Insignia_ka_rojo_ATGC", 20000 * Desc],
			["POP_Opel_Insignia_ka_verde_ATGC", 20000 * Desc],
			["POP_Opel_Insignia_ka_azul_ATGC", 20000 * Desc],
			["POP_Opel_Insignia_ka_amarillo_ATGC", 20000 * Desc],
			["pop_cherokee_camuflado_blanco", 20000 * Desc],
			["pop_cherokee_camuflado_rojo", 20000 * Desc],
			["pop_cherokee_camuflado_azul", 20000 * Desc],
			["pop_cherokee_camuflado_verde", 20000 * Desc],
			["pop_cherokee_camuflado_gris", 20000 * Desc],
			["pop_cherokee_camuflado_negro", 20000 * Desc],
			["POP_rs_camuflado_blanco", 20000 * Desc],
			["POP_rs_camuflado_negro", 20000 * Desc],
			["POP_rs_camuflado_azul", 20000 * Desc],
			["POP_rs_camuflado_gris", 20000 * Desc],
			["pop_c4_picasso_camuflado_negro", 20000 * Desc],
			["pop_c4_picasso_camuflado_blanco", 20000 * Desc],
			["pop_c4_picasso_camuflado_rojo", 20000 * Desc],
			["pop_c4_picasso_camuflado_azul", 20000 * Desc],
			["pop_c4_picasso_camuflado_gris", 20000 * Desc]


		];
	};
	case "civ_air": {
		_return = [
			["pop_heli_Light_01_blue_F", 700000 * Desc],
			["pop_heli_Light_01_red_F", 700000 * Desc],
			["pop_heli_Light_01_ion_F", 700000 * Desc],
			["pop_heli_Light_01_blueLine_F", 700000 * Desc],
			["pop_heli_Light_01_digital_F", 700000 * Desc],
			["pop_heli_Light_01_elliptical_F", 700000 * Desc],
			["pop_heli_Light_01_furious_F", 700000 * Desc],
			["pop_heli_Light_01_graywatcher_F", 700000 * Desc],
			["pop_heli_Light_01_jeans_F", 700000 * Desc],
			["pop_heli_Light_01_light_F", 700000 * Desc],
			["pop_heli_Light_01_shadow_F", 700000 * Desc],
			["pop_heli_Light_01_sheriff_F", 700000 * Desc],
			["pop_heli_Light_01_speedy_F", 700000 * Desc],
			["pop_heli_Light_01_sunset_F", 700000 * Desc],
			["pop_heli_Light_01_vrana_F", 700000 * Desc],
			["pop_heli_Light_01_wasp_F", 700000 * Desc],
			["pop_heli_Light_01_wave_F", 700000 * Desc],
			["pop_heli_Light_01_camuflaje_F", 700000 * Desc],
			["pop_heli_Light_01_naranja_F", 700000 * Desc],
			["pop_heli_Light_01_chapa_F", 700000 * Desc],
			["pop_heli_Light_01_escamas_F", 700000 * Desc],
			["pop_heli_Light_01_olas_F", 700000 * Desc],
			["pop_heli_Light_01_pelotas_F", 700000 * Desc],
			["pop_heli_Light_01_psico1_F", 700000 * Desc],
			["pop_heli_Light_01_psico2_F", 700000 * Desc],
			["pop_heli_Light_01_psico3_F", 700000 * Desc],
			["pop_heli_Light_01_psico4_F", 700000 * Desc],
			["pop_heli_Light_01_psico5_F", 700000 * Desc],
			["pop_heli_Light_01_amanecer_F", 700000 * Desc],
			["pop_heli_Light_01_triangulos_F", 700000 * Desc],
			["pop_heli_Light_01_triangulos2_F", 700000 * Desc],

			["ec135_civil_rojo", 1000000 * Desc],
			["ec135_civil_blanco", 1000000 * Desc],
			["ec135_civil_azul", 1000000 * Desc],
			["ec135_civil_Negro", 1000000 * Desc],
			["pop_cessna_1", 350000 * Desc],
			["pop_cessna_2", 350000 * Desc],
			["pop_cessna_3", 350000 * Desc],
			["pop_cessna_4", 350000 * Desc],
			["pop_cessna_5", 350000 * Desc],
			["pop_cessna_6", 350000 * Desc]







		];
	};
	case "cop_air": {
		_return = [
			["policia_helicopter", 45000 * Desc],
			["ec135_policia_f", 45000 * Desc],
			["ec135_guardiacivil_F", 45000 * Desc]
		];
	};
	case "cop_airhq": {
		_return = [
			["policia_helicopter", 45000 * Desc],
			["ec135_policia_f", 45000 * Desc],
			["ec135_guardiacivil_F", 45000 * Desc],
			["B_Heli_Light_01_F", 45000 * Desc]
		];
	};
	case "civ_ship": {
		_return = [
			["C_Rubberboat", 10000 * Desc],
			["POP_Lancha_civil", 25000 * Desc],
			["POP_pesca_f", 35000 * Desc],
			["POP_Speed_yatch", 1500000 * Desc]
		];
	};
	case "cop_ship": {
		_return = [
			["B_SDV_01_F", 100000 * Desc],
			["C_Boat_Civil_01_police_F", 20000 * Desc],
			["POP_Lancha_policia", 20000 * Desc],
			["B_Boat_Transport_01_F", 3000 * Desc]

		 ];
	};
	case "donator": {
		if(__GETC__(life_donator) > 0) then {
			_return = [
			    ["POP_Ferrari_Enzo_rojo", 1500000 * Desc],
				["pop_LamborghiniVeneno_grafiti3", 1500000 * Desc],
				["pop_LamborghiniVeneno_grafiti1", 1500000 * Desc],
				["pop_LamborghiniVeneno_grafiti2", 1500000 * Desc],
				["pop_FordTransiSupervan_civ_violeta", 500000 * Desc],
				["pop_FordTransiSupervan_civ_naranja", 500000 * Desc],
				["pop_FordTransiSupervan_don", 500000 * Desc],
				["pop_FordTransiSupervan_civ_gris", 500000 * Desc],
				["pop_FordTransiSupervan_civ_rosa", 500000 * Desc],
				["pop_FordTransiSupervan_civ_Amarillo", 500000 * Desc],
				["pop_FordTransiSupervan_civ_rojo", 500000 * Desc],
				["pop_FordTransiSupervan_civ_azul", 500000 * Desc],
				["pop_FordTransiSupervan_civ_negro", 500000 * Desc],
				["pop_c63_2015_civ", 180000 * Desc],
			    ["pop_c63_2015_mat", 180000 * Desc],
			    ["pop_c63_2015_noir", 180000 * Desc],
			    ["pop_c63_2015_mat_n", 180000 * Desc],
			    ["pop_c63_2015_bleufonce", 180000 * Desc],
			    ["pop_c63_2015_mat_b", 180000 * Desc],
			    ["pop_c63_2015_rouge", 180000 * Desc],
			    ["pop_c63_2015_jaune", 180000 * Desc],
			    ["pop_c63_2015_rose", 180000 * Desc],
			    ["pop_c63_2015_grise", 180000 * Desc],
			    ["pop_c63_2015_violet", 180000 * Desc],
			    ["pop_c63_2015_orange", 180000 * Desc]
			];
		};
	};
};

_return;