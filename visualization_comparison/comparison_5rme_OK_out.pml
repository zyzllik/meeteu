                  
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
        load "../fpocket_output/5rme_OK_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/5rme_OK_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4418,4419,4390,4434,4064,4389,4370,4371,6827,6825,4378,6771,6777,6789,4008,4435,4437,4438,6828,6829,4004,4436,4052,6799,6796,6801,4051,4821,4422,4423,4879,8368,4369,6846,6849,6850,6852,8370,6824,4881,4835,5758,5760,4402,4403,5766,5767,6229,4404,8345,8793,4355,6230,6853,4772,4773,4783,4784,4822,8331,8346,8347,8348,4747,5773,5770,5771,8333,8336,4774] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.404,0.702]
select surf_pocket2, protein and id [14968,13610,13611,13612,13630,13631,17554,17555,17556,13578,13579,13597,13598,18001,13563,13576,13577,16061,16060,16057,13991,14029,13981,13989,14030,14088,14089,14087,16031,16032,16053,16054,16035,16033,15013,14974,14975,14978,14979,15394,17544,17538,17539,17540,17541,17553,13992,13982,14982,15398,15438,15434,15388,17576,17577,17578] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.467,0.902]
select surf_pocket3, protein and id [15454,17506,17507,17508,17509,17884,17799,11917,11918,15491,15494,15504,17837,17838,17786,17794,17839,17476,17206,17224,17226,17797,17798,17800,17801,17802,11891,17477,17478,11877,11878,11879,11880,17244,15628,17793,15506,15507,11933,15564,16728,16737,15637,15640,15641,15568,15624,15629,15508,15471,17868,15469,15472,15483,15566,15619,17514,17515,17518] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.318,0.702]
select surf_pocket4, protein and id [8298,8299,8300,8301,8591,8593,8630,8676,8590,7998,8594,8628,8629,8631,8586,2710,6275,6287,6283,6286,2711,2726,6296,6299,6358,8577,8578,8585,8589,6356,6263,6264,6523,8658,8659,8660,6469,6360,6433,6411,6416,6419,6421,6429,6432,6301,8034,8036,8037,8016,7532,7533,8018,2684,2670,2673,8032,8033,8090,2650,3073,3084,3088,8044,8045,8048,3087,2634,2637,2638,7521,7528,2647,7505,7506,7507,7517,7492,7495,8268,8269,8306,8310,2686] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.365,0.361,0.902]
select surf_pocket5, protein and id [14769,14770,14772,14773,14774,14776,13943,15100,15101,15102,15022,15484,11261,15052,15023,12741,12753,12758,12725,12726,11321,11259,11260,11305,11306,11307,11303,15143,15082,15084,15080,12768,12772,12773,15026,15496,11914,15493,15495,12727,12729,12699,11950,11952,11946,11926,11949,11302,11368,11369,11370,11932,11934,15533,15534,11371,12679,14775,13942,13970,13968,13940,13941,14981,13951,13954,14982,14757] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.329,0.278,0.702]
select surf_pocket6, protein and id [2959,2993,2946,12516,12517,12518,2941,12486,12484,12485,12469,2781,2960,3007,2780,2999,2962,2963,2964,14406,14448,3004,3305,3307,2920,2940,2911,14449,14450,14451,5166,5167,5168,12199,12166,12181,12182,12185,3277,3278,3279,12152,12153,3264,12028,12187,14409,14411,5165,5162,5163,5185,5188] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.478,0.361,0.902]
select surf_pocket7, protein and id [12214,12730,12727,12729,12701,12702,5151,14371,14372,5152,5154,5155,12169,12171,5140,12012,12013,12168,11987,12713,12131,12665,12130,14374,14375,14376,14773,14774,14776,12728,5121,14373,12738,12722,12726,5376,5377,12743,5360,5380,14393,14394,14397,14775] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.416,0.278,0.702]
select surf_pocket8, protein and id [13644,13646,16009,13259,13260,13272,13273,13258,13212,13600,15985,15979,15980,16004,15997,15961,16034,16035,16036,16037,16008,13642,13643,13645,13217,13579,13586,13598,16007] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.588,0.361,0.902]
select surf_pocket9, protein and id [6285,2098,6325,2728,6326,2112,2113,2114,2161,2162,2163,2052,3494,3491,2053,2142,2144,2216,2095,2160,2094,2707,2708,6286,2051,2725,2727,3476,2706,2739,2719,2742,2743] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.502,0.278,0.702]
select surf_pocket10, protein and id [5565,5566,5567,5568,6276,2111,2112,2114,2052,3550,2053,6285,2098,3518,3519,3516,3517,5872,5893,5894,5814,5843,5844,5874,2050,2051,5876,4734,4733,4735,5203] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.698,0.361,0.902]
select surf_pocket11, protein and id [6303,6304,2033,1743,5857,5859,1798,1799,1812,6495,5856,1919,1987,1988,1991,5839,5842,5843,5852,6516,5858] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.588,0.278,0.702]
select surf_pocket12, protein and id [17446,17441,17334,17335,11894,17472,12441,17444,17456,17462,17463,17519,12283,12442,12443,17239,17241,17284,17295,17298,12294,12403,12404,17297,11893,17242,17478,17287] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.812,0.361,0.902]
select surf_pocket13, protein and id [5124,5140,5189,5122,12169,12171,5222,12128,12012,12013,12168,5125,5361,5362,5363,5288,12119,12131,12133,5264,5250,5253,5282,12130,5380,5121] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.675,0.278,0.702]
select surf_pocket14, protein and id [15060,11196,11199,15064,15074,11019,15065,15066,15067,10947,11017,11018,15703,15724,15742,11241,15511,15512,10951,15050,15051,10948,10945,11007] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.878]
select surf_pocket15, protein and id [3581,3594,2004,2005,1940,1957,1958,2003,270,294,316,271,1963,39,329,61,336,338,1942,1878,1879,1944] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.639]
select surf_pocket16, protein and id [6213,6216,7040,7041,7037,4324,7038,7039,7053,7054,7073,7077,7080,4323,6631,6701,6713,6200,6212,6203,6759,6760,7055,7058,7104,6756,6757,6755,8660,8661,8644,6455,6468,6469,6651,6650,6646] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.769]
select surf_pocket17, protein and id [14375,14376,14377,14772,14773,14774,12728,5578,5105,5379,5376,5377,5403,5378,5380,12741,12725,12726,5608,5625,5605,12774,12775,12773,5151,5155,12730] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.553]
select surf_pocket18, protein and id [15839,15854,15856,15858,15859,15408,15409,16249,15676,17868,17852,15664,15411,13532,13530,13531,15921,16288,16315,15420,15421,16245,16248,16247] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.655]
select surf_pocket19, protein and id [5036,5037,5452,5453,5446,5450,5451,5415,5439,9505,9400,9402,9839,9841,9842,9506,9504,4607,4610,9868,9870,9218,9857,9866,4609,9221,9544,9546] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.467]
select surf_pocket20, protein and id [13467,15892,13497,13496,15911,15934,15935,13428,15936,12924,12921,12956,12957,13366,15823,15821,15896,13469] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.545]
select surf_pocket21, protein and id [650,651,709,711,661,679,1349,1015,980,950,1323,973,978,984,1325,161,663,162,1348] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.278,0.380]
select surf_pocket22, protein and id [15199,15200,15198,15138,15142,15143,15186,15187,12768,12772,12773,12788,12823,15082,15084,12800,12806,12818,14770,14772,12741] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.361,0.435]
select surf_pocket23, protein and id [5992,5993,5935,3615,5977,5979,5978,3560,3564,3565,3580,5874,5876,3598,3522,5564,5567,3519,3521,3533,5990,5991,5623] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.278,0.294]
select surf_pocket24, protein and id [9888,10188,10223,9917,10222,9919,10159,10532,10533,10544,10556,9869,9881,9858,9859,9871] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.396,0.361]
select surf_pocket25, protein and id [6613,6615,4288,6703,3748,6688,3712,3713,3716,4259,4261,6728,6727,3749,6616] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.353,0.278]
select surf_pocket26, protein and id [14374,14375,14376,14772,14773,14774,14776,14373,12730,14371,14372,14775,13942,13970,13961,13968,14350,14393,14394,14397,14403,13951,14433] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.510,0.361]
select surf_pocket27, protein and id [11860,11808,12354,12356,11810,16715,12299,16704,16714,11712,11829,11859,11806,11854,16730,11858,11857,12291,17245,17257,12387,12295,12296] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.439,0.278]
select surf_pocket28, protein and id [11213,11089,9477,9482,9504,9501,9526,11212,9523,9400,9502,9542,9544,11088,9245,9267,9536,12789,12790,12802] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.620,0.361]
select surf_pocket29, protein and id [798,809,1083,1084,789,794,1098,788,793,1099,821,1051] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.525,0.278]
select surf_pocket30, protein and id [1865,6548,6551,6552,6550,6614,6616,6590,6591,6672,1808,1820,1821,1822,6592,1923,1924,1836] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.902,0.729,0.361]
select surf_pocket31, protein and id [16510,16511,16512,16482,17065,17026,17025,16479,18377,18378] 
set surface_color,  pcol31, surf_pocket31 
set_color pcol32 = [0.702,0.612,0.278]
select surf_pocket32, protein and id [11073,11016,11028,15798,15799,15800,11044,11131,11132,15823,15824,15880,12871,12873,12889,15758,15759] 
set surface_color,  pcol32, surf_pocket32 
set_color pcol33 = [0.902,0.843,0.361]
select surf_pocket33, protein and id [103,104,105,115,116,119,120,126,1437,94,1435,1436,1407] 
set surface_color,  pcol33, surf_pocket33 
set_color pcol34 = [0.702,0.698,0.278]
select surf_pocket34, protein and id [295,14623,14640,14645,14646,14647,195,193,14622,14624,14639,14600,1,2,338,339,5] 
set surface_color,  pcol34, surf_pocket34 
set_color pcol35 = [0.847,0.902,0.361]
select surf_pocket35, protein and id [10597,10598,10618,10616,10617,10619] 
set surface_color,  pcol35, surf_pocket35 
   
        
        deselect
        
        orient
        