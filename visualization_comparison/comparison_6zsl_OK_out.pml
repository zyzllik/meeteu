                  
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
        load "../fpocket_output/6zsl_OK_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/6zsl_OK_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [13605,13606,17546,13557,17994,13570,16054,16029,16030,13571,16026,16047,16050,16053,16024,16025,16046,13986,13985,13974,13976,13982,13983,14024,17547,17548,17549,14023,13625,14082,14083,14081,14021,14973,15427,14976,17534,17537,17532,15430,15431,15429,14037,13602,14962,15367,13538,13603,13604,13624,13635,13637,13211,15007,14968,14969,14972,15380,15381,15382,15387,15391,17569,17570,17571,17572] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.408,0.702]
select surf_pocket2, protein and id [8295,6284,8296,6243,8297,8298,8588,8590,8673,8587,2709,8591,6280,6283,6296,8575,8582,8583,8586,6258,6260,6261,8625,8626,8627,8628,6429,6272,6355,6357,6408,6413,6416,6418,6426,6293,6297,6298,6430,6433,8031,8033,8034,8267,7995,8013,7530,8015,2682,2708,2648,3074,3082,8087,8041,8042,3085,3072,3071,7514,7516,7517,7518,7525,7529,2724,2632,2635,2636,2671,7492,7493,7502,7504,7489,7491,2645,8303,8307,2685,8266] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.475,0.902]
select surf_pocket3, protein and id [11886,11887,11888,11890,17500,17501,17502,11874,11913,17877,17791,17792,17794,17795,17199,17471,17217,11882,12279,11872,11873,11875,17238,17786,17787,17790,11928,11930,16721,17219,15464,15462,15465,15447,17831,15476,15484,15487,17830,17832,15633,15621,17779,17780,15557,15634,15637,15630,15561,15617,15622,15612,15497,15501,17470] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.329,0.702]
select surf_pocket4, protein and id [15020,15489,15486,15488,12719,12722,11255,11256,15046,15096,15016,15477,15094,15095,14766,14767,14768,14770,14764,15137,12767,15076,15078,15074,11314,11297,11298,11316,11364,11365,11366,11363,12752,11252,11253,11254,11300,11301,11302,11345,15525,15526,15527,12735,12747,12762,12693,12766,11945,11947,11944,11909,11921,11941,11927,11929,13935,13936,15017,14975,13948,13949,14976,13937,13938,14769] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.361,0.373,0.902]
select surf_pocket5, protein and id [2958,2997,5166,5167,14390,14391,2961,12209,14398,12467,2957,2990,2991,3277,12512,12513,12479,12481,12476,12480,3003,3004,3005,3002,3262,2962,14442,14443,14444,14445,2779,2778,2959,5163,5164,5165,14401,5198,3491,12148,12165,12162,12208,5186,12160,12161,12194,12176,12177,12195,3275,5160,5161,5162,5152] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.310,0.278,0.702]
select surf_pocket6, protein and id [2705,6285,6284,2113,2161,2162,3492,2160,6321,6322,6323,6283,2159,2093,2141,2143,3515,3516,3517,3518,3519,5891,2052,6270,6273,5812,5892,5842,5815,5563,5564,5565,5566,5872,2049,2050,2051,2094,2096,2097,2098,6282,2741,2706,2737,2740,2717,2723,2725,2726,3473,3474,2215,4744,4732,4733,4741,5813] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.451,0.361,0.902]
select surf_pocket7, protein and id [4420,4421,8343,8344,8345,4399,4400,4401,4402,4879,8790,4353,4770,4771,4779,4781,4820,4833,5756,5758,5769,5771,5765,5768,4778,4782,5764,8333,8330,8342,6226,6227,4772,8329,8328] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.392,0.278,0.702]
select surf_pocket8, protein and id [4878,4876,6843,6820,6821,6822,4952,4954,4427,4428,4388,4431,4433,6824,8367,6850,8365,4367,6846,6847,6849,4368,4369,8345,4399,4401,4402,4879,4387,4394,4416] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.553,0.361,0.902]
select surf_pocket9, protein and id [17465,12436,12437,12438,17280,17449,17277,17439,17437,17455,17470,17511,17512,17327,17328,11882,12279,17235,17232,17471,11886,11887,11888,11874,12276,12277,12278,12275,17234,17288,17291] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.471,0.278,0.702]
select surf_pocket10, protein and id [15997,16000,16001,16002,16003,13580,13637,13638,13639,13640,13206,13208,13253,13254,13266,13252,13306,15954,15972,15978,15990,16028,16029,16030,16027,16380] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.655,0.361,0.902]
select surf_pocket11, protein and id [15402,15668,15669,15670,15851,15852,15656,15847,15849,17845,16238,16240,16279,16280,16281,16308,15401,15414,13525,13526,15832,15902,15914,16221,16241,16242] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.549,0.278,0.702]
select surf_pocket12, protein and id [6200,4321,4322,7036,7055,6628,6698,6709,6710,6707,7050,7051,7052,7053,7074,7077,7101,6197,6209,6210,6213,7037,7038,7034,6756,6757,6751,6752,6753,7100,6647,6648,6464,6645,6198,8656,8657,8658,6465,6466,8641] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.757,0.361,0.902]
select surf_pocket13, protein and id [1742,2032,5857,1798,1811,1987,1990,1918,1978,1986,1979,2097,6300,2050,2051,5868,5840,5841,6301,5864,6513,6492,5850,5854,5855] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.627,0.278,0.702]
select surf_pocket14, protein and id [4286,4287,6700,6706,6718,6719,6722,3746,4218,6685,6725,3710,3711,3714,3744,3747,4257,4259,6723,4156,4217,6612,6613] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.859,0.361,0.902]
select surf_pocket15, protein and id [3579,3592,2002,2003,2004,1941,1939,1956,1957,315,318,269,1962,38,328,335,60,1875,1877,1878,1943] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.690]
select surf_pocket16, protein and id [15504,10946,11236,15696,10943,11253,11191,11194,15061,11001,11002,11012,10942,15044,15045,15054,15058,15505,15059,15060,15717,11014] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.839]
select surf_pocket17, protein and id [4388,4431,4432,4433,4062,4063,4434,4435,4436,4050,4049,4002,6824,6825,6826,6798,4387,4390,4376,6768,6771,6774,6786,6793] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.612]
select surf_pocket18, protein and id [5123,5359,5360,5361,5280,5378,5262,5248,5251,5120,5122,5138,12125,12126,12127,12007,12008,12123,12114,12128,5234,5286,5187,12164,12166,12163,5220] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.733]
select surf_pocket19, protein and id [13490,13491,15923,15927,15928,15929,12947,12948,12950,12951,15885,15887,15889,15904,12918,12915,13461,13463,13359,13360,13421,15814,15816] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.533]
select surf_pocket20, protein and id [650,708,710,678,679,1335,1322,1324,1012,1014,979,949,977,980,161,660,662,160,1341,1346,1347,1348] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.631]
select surf_pocket21, protein and id [14766,14764,15136,15137,12767,15076,15078,15180,15132,15181,12800,12817,12769,12766,12782,12735,12762,14765,14790,14750,14787,15192,15193,15194,15195] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.278,0.451]
select surf_pocket22, protein and id [5562,5989,5990,5991,5988,5565,5933,5872,5977,3562,3578,5874,3596,3531,3558,3563,3517,3519,5621] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.361,0.529]
select surf_pocket23, protein and id [9883,9853,9854,9864,9866,9912,9914,10551,9880,9876,10217,10218,10527,10154,10528,10183] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.278,0.373]
select surf_pocket24, protein and id [11805,12351,12382,12361,16697,16707,12291,12294,11707,11705,11669,11672,11660,11661,11855,11801,11803,16708,12290] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.361,0.427]
select surf_pocket25, protein and id [14617,14648,14652,192,194,14545,14640,14224,14634,14239,648,657,14228,14240,14241,659,1,15,2,5,337,338] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.278,0.294]
select surf_pocket26, protein and id [12796,9478,11207,11208,12783,11084,11083,9473,9497,9532,9519,9264,9242,9538,9540] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.392,0.361]
select surf_pocket27, protein and id [9500,9501,9502,9396,9397,9398,9852,9836,9879,9834,5448,5449,5450,5451,4607,9863,9878,9890,9215,9218,9540,9542,5437,5413] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.345,0.278]
select surf_pocket28, protein and id [808,774,787,788,792,793,797,820,1050,1051,1082,1083,1097,1098,1056,1078,1063] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.498,0.361]
select surf_pocket29, protein and id [6548,6547,6611,6612,6613,6545,6587,6588,6669,1862,1864,1923,3661,3663,1921,1922,1835,1844,1807,6589,1861,1857] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.427,0.278]
select surf_pocket30, protein and id [12161,12176,12180,3275,3288,12026,12182,3277,12512,12513,12509,12511] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.902,0.600,0.361]
select surf_pocket31, protein and id [5153,14404,14405,12722,12723,12724,14767,14768,14770,14344,13962,13964,14769,14427] 
set surface_color,  pcol31, surf_pocket31 
set_color pcol32 = [0.702,0.506,0.278]
select surf_pocket32, protein and id [2471,3154,3177,3178,2469,3087,2501,2468,3152,3158,2503,2650,2651,7504,2597,2598] 
set surface_color,  pcol32, surf_pocket32 
set_color pcol33 = [0.902,0.702,0.361]
select surf_pocket33, protein and id [15751,15790,12867,15752,15815,15816,15817,15792,15791,12864,12865,11068,12883,11039,11011,15793,11023,11024,11126] 
set surface_color,  pcol33, surf_pocket33 
set_color pcol34 = [0.702,0.584,0.278]
select surf_pocket34, protein and id [1288,1387,1409,1410,1264,1388,1389,1407,1408] 
set surface_color,  pcol34, surf_pocket34 
set_color pcol35 = [0.902,0.804,0.361]
select surf_pocket35, protein and id [12125,12126,12127,12004,12005,12006,12007,12008,12659,12661,12660,12623,12624,11445] 
set surface_color,  pcol35, surf_pocket35 
set_color pcol36 = [0.702,0.663,0.278]
select surf_pocket36, protein and id [12289,12311,17303,16757,17248,17291,12290,17250,17246,17249,12292,12293] 
set surface_color,  pcol36, surf_pocket36 
set_color pcol37 = [0.894,0.902,0.361]
select surf_pocket37, protein and id [9457,9458,9451,10814,9434,9765,10838,10823,10824,9442,9764] 
set surface_color,  pcol37, surf_pocket37 
set_color pcol38 = [0.655,0.702,0.278]
select surf_pocket38, protein and id [74,91,94,1494,1495,1446,1447,1492,1448,1502,415,75] 
set surface_color,  pcol38, surf_pocket38 
   
        
        deselect
        
        orient
        