                  
                from pymol import cmd,stored
                
                set depth_cue, 1
                set fog_start, 0.4
                
                set_color b_col, [36,36,85]
                set_color t_col, [10,10,10]
                set bg_rgb_bottom, b_col
                set bg_rgb_top, t_col      
                set bg_gradient
                
                set  spec_power  =  200
                set  spec_refl   =  0
        load "../fpocket_output/6zsl_OK_A_out.pdb", file
            select fpocket, hetatm and not metals
            select protein, not fpocket and not metals

            # Select single fpocket pockets
            pockets = []
            iterate fpocket, pockets.append(resv)
            for i in range(1, pockets[-1]+1): cmd.select("fpocket_"+str(i), "fpocket and resi "+str(i))

            #create ligands, protein and organic
            #select xlig, protein and organic
            #delete xlig
            
            hide everything, all
            
            color white, elem c
            color bluewhite, protein
            #show_as cartoon, protein
            show surface, protein
            set transparency, 0.2, protein
            
            show sticks, ligands
            set stick_color, magenta
            
            
            
            
            # SAS points
            load "../p2rank_predictions/visualizations/data/6zsl_OK_A_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [13619,13620,17560,13571,18008,13584,16068,16043,16044,13585,16040,16061,16064,16067,16038,16039,16060,14000,13999,13988,13990,13996,13997,14038,17561,17562,17563,14037,13639,14096,14097,14095,14035,14987,14990,17548,17550,17546,15441,15444,15443,15445,14051,13616,14976,15381,13552,13617,13618,13638,13649,13652,13225,15021,14982,14983,14986,15394,15395,15396,15401,15405,17583,17584,17585,17586] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.408,0.702]
select surf_pocket2, protein and id [6243,8296,8297,8298,8587,8589,8590,8591,8673,8295,2708,6284,6280,6283,8586,6296,8575,8582,8583,6258,6260,6261,6272,8625,8626,8627,8628,6429,6355,6357,6408,6417,6413,6416,6426,6293,6297,6298,6430,6433,8031,8033,8034,8266,7995,8013,7530,8015,2682,2709,8041,2648,3074,3082,8087,8042,3085,3072,3071,7514,7516,7517,7518,7525,7529,2724,2632,2635,2636,2670,7492,7493,7502,7504,7489,7491,2645,8303,8307,2685,8267] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.475,0.902]
select surf_pocket3, protein and id [11900,11901,11902,11904,17514,17515,17516,11889,11926,17891,17805,17807,17808,17809,17213,17484,17231,11896,12293,11886,11887,11888,17251,17800,17801,17804,11942,11944,16735,17233,15478,15476,15479,15461,17846,15490,15498,15501,17844,17845,15647,15636,17793,17794,15571,15648,15651,15644,15575,15631,15635,15626,15511,15515,17485] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.329,0.702]
select surf_pocket4, protein and id [15034,15503,15500,15502,12733,12735,11269,11270,15059,15110,15030,15491,15108,15109,14780,14781,14782,14783,14778,15151,12781,15090,15092,15088,11328,11311,11312,11330,11378,11379,11380,11377,12766,11266,11267,11268,11314,11315,11316,11359,15539,15540,15541,12749,12761,12776,12707,12780,11959,11961,11958,11923,11935,11955,11941,11943,13949,13950,13962,13963,15031,14989,14990,13951,13952,14784] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.361,0.373,0.902]
select surf_pocket5, protein and id [2958,2997,5166,5167,14404,14405,2962,12223,14412,12480,2957,2990,2991,3276,12526,12527,12493,12494,12490,12495,3003,3004,3005,3002,3263,2961,14456,14457,14458,14459,2778,2779,2959,5164,5165,14415,5163,5198,3492,12162,12180,12176,12222,5186,12174,12175,12208,12190,12191,12209,3275,5160,5161,5162,5152] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.310,0.278,0.702]
select surf_pocket6, protein and id [6285,2705,6284,2113,2161,2162,3491,2160,6321,6322,6323,6283,2159,2093,2141,2143,3515,3516,3517,3518,3519,5891,2052,6273,5812,5892,5841,6270,5815,5563,5564,5565,5566,5872,2049,2050,2051,2094,2096,2097,2098,6282,2741,2706,2737,2740,2717,2723,2725,2726,3473,3474,2215,4744,4732,4733,4741,5813] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.451,0.361,0.902]
select surf_pocket7, protein and id [4401,4402,4879,8343,8790,8344,8345,4353,4399,4400,4770,4771,4779,4781,4820,4420,4421,4833,5756,5758,6226,8330,8332,8342,6227,5769,5771,5765,5768,4778,4782,5764,4772,8329,8328] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.392,0.278,0.702]
select surf_pocket8, protein and id [4878,4876,6820,6821,6843,6822,4952,4954,4427,4428,4388,4431,4434,6824,8367,4367,4401,4402,4879,6849,6850,8345,8365,6846,6847,4399,4368,4369,4387,4394,4416] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.553,0.361,0.902]
select surf_pocket9, protein and id [17479,12450,12451,12452,17293,17463,17291,17454,17451,17470,17485,17525,17526,17341,17342,11896,12293,17249,17246,17484,11900,11901,11902,11889,12290,12291,12292,12289,17248,17302,17305] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.471,0.278,0.702]
select surf_pocket10, protein and id [16011,16014,16015,16016,16017,13594,13651,13652,13653,13654,13220,13222,13267,13268,13281,13266,13321,15968,15986,15992,16004,16042,16043,16044,16041,16393] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.655,0.361,0.902]
select surf_pocket11, protein and id [15416,15682,15683,15684,15865,15866,15670,15861,15863,17859,16252,16254,16293,16294,16295,16322,15415,15428,13539,13540,15846,15916,15928,16235,16255,16256] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.549,0.278,0.702]
select surf_pocket12, protein and id [6200,4321,4322,7036,7055,6628,6698,6709,6710,6707,7050,7051,7052,7053,7074,7077,7101,6197,6209,6210,6213,7037,7038,7034,6756,6757,6751,6752,6753,7100,6647,6648,6464,6645,8657,8641,8656,8658,6465,6466,6198] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.757,0.361,0.902]
select surf_pocket13, protein and id [1742,2032,5856,1798,1810,1987,1990,1918,1978,1986,1979,2097,6300,2050,2051,5868,5840,5842,5864,6301,6513,6492,5850,5854,5855] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.627,0.278,0.702]
select surf_pocket14, protein and id [4286,4287,6700,6706,6718,6719,6722,3746,4217,6685,6725,3710,3711,3713,3745,3747,4257,4259,6723,4156,4218,6612,6613] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.859,0.361,0.902]
select surf_pocket15, protein and id [3579,3592,2002,2003,2004,1941,1939,1956,1957,315,318,269,1962,38,328,335,60,1875,1877,1878,1943] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.690]
select surf_pocket16, protein and id [15518,10960,11250,15710,10957,11267,11205,11208,15074,11015,11016,11026,10956,15058,15060,15068,15072,15519,15073,15075,15731,11029] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.839]
select surf_pocket17, protein and id [4388,4431,4432,4434,4062,4063,4433,4435,4436,4050,4049,4002,6824,6825,6826,6799,4387,4390,4376,6768,6771,6774,6786,6793] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.612]
select surf_pocket18, protein and id [5123,5359,5360,5361,5280,5377,5262,5248,5251,5120,5122,5138,12139,12140,12141,12021,12022,12137,12128,12142,5234,5286,5187,12178,12179,12177,5220] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.733]
select surf_pocket19, protein and id [13504,13505,15937,15941,15942,15943,12961,12963,12964,12965,15899,15901,15903,15918,12931,12929,13475,13477,13373,13374,13436,15828,15830] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.533]
select surf_pocket20, protein and id [650,708,710,678,679,1335,1322,1324,1012,1014,979,949,977,980,161,660,662,160,1341,1346,1347,1348] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.631]
select surf_pocket21, protein and id [14780,14778,15150,15151,12781,15090,15092,15194,15146,15195,12814,12831,12783,12780,12796,12749,12776,14779,14804,14764,14801,15206,15207,15208,15209] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.278,0.451]
select surf_pocket22, protein and id [5562,5989,5990,5991,5988,5566,5933,5872,5977,3562,3578,5874,3596,3531,3558,3563,3518,3519,5621] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.361,0.529]
select surf_pocket23, protein and id [9896,9867,9868,9878,9880,9926,9928,10565,9894,9890,10231,10232,10541,10168,10542,10197] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.278,0.373]
select surf_pocket24, protein and id [16721,12305,12308,12365,16711,11723,11719,11683,11686,12396,11674,11675,12375,11819,11869,11815,11817,16722,12304] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.361,0.427]
select surf_pocket25, protein and id [14631,14662,14666,192,194,14559,14654,14238,14648,14253,648,657,14242,14254,14255,659,1,15,2,5,337,338] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.278,0.294]
select surf_pocket26, protein and id [12810,9492,11221,11222,12797,11098,11097,9487,9511,9546,9533,9278,9256,9552,9554] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.392,0.361]
select surf_pocket27, protein and id [9514,9515,9516,9410,9411,9412,9866,9850,9893,9848,5448,5449,5450,5452,4607,9877,9892,9904,9229,9232,9554,9556,5437,5413] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.345,0.278]
select surf_pocket28, protein and id [808,774,787,788,792,793,797,820,1050,1051,1082,1083,1097,1098,1056,1078,1063] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.498,0.361]
select surf_pocket29, protein and id [6548,6547,6611,6612,6613,6545,6587,6588,6670,1862,1864,1923,3661,3663,1921,1922,1835,1844,1807,6589,1861,1857] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.427,0.278]
select surf_pocket30, protein and id [12175,12190,12194,3275,3288,12040,12196,3276,12526,12527,12523,12525] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.902,0.600,0.361]
select surf_pocket31, protein and id [5153,14418,14419,12735,12737,12738,14781,14782,14783,14358,13975,13978,14784,14441] 
set surface_color,  pcol31, surf_pocket31 
set_color pcol32 = [0.702,0.506,0.278]
select surf_pocket32, protein and id [2471,3154,3177,3178,2469,3087,2501,2468,3152,3158,2505,2650,2651,7504,2597,2598] 
set surface_color,  pcol32, surf_pocket32 
set_color pcol33 = [0.902,0.702,0.361]
select surf_pocket33, protein and id [15765,15804,12881,15766,15829,15830,15831,15806,15805,12878,12879,11082,12897,11053,11025,15807,11037,11038,11140] 
set surface_color,  pcol33, surf_pocket33 
set_color pcol34 = [0.702,0.584,0.278]
select surf_pocket34, protein and id [1289,1387,1409,1410,1264,1388,1389,1407,1408] 
set surface_color,  pcol34, surf_pocket34 
set_color pcol35 = [0.902,0.804,0.361]
select surf_pocket35, protein and id [12139,12140,12141,12018,12019,12020,12021,12022,12673,12675,12674,12637,12638,11459] 
set surface_color,  pcol35, surf_pocket35 
set_color pcol36 = [0.702,0.663,0.278]
select surf_pocket36, protein and id [12303,12325,17317,16771,17262,17305,12304,17264,17260,17263,12306,12307] 
set surface_color,  pcol36, surf_pocket36 
set_color pcol37 = [0.894,0.902,0.361]
select surf_pocket37, protein and id [9471,9472,9465,10828,9448,9779,10852,10837,10838,9456,9778] 
set surface_color,  pcol37, surf_pocket37 
set_color pcol38 = [0.655,0.702,0.278]
select surf_pocket38, protein and id [74,91,94,1494,1495,1446,1447,1492,1448,1502,415,75] 
set surface_color,  pcol38, surf_pocket38 
   
        
        deselect
        
        orient
        