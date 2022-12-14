
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
        
        load "data/5rm2_OK.pdb", protein
        create ligands, protein and organic
        select xlig, protein and organic
        delete xlig
        
        hide everything, all
        
        color white, elem c
        color bluewhite, protein
        #show_as cartoon, protein
        show surface, protein
        #set transparency, 0.15
        
        show sticks, ligands
        set stick_color, magenta
        
        
        
        
        # SAS points
 
        load "data/5rm2_OK.pdb_points.pdb.gz", points
        hide nonbonded, points
        show nb_spheres, points
        set sphere_scale, 0.2, points
        cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)
        
        
        stored.list=[]
        cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
        lastSTP=stored.list[-1] # get the index of the last residue
        hide lines, resn STP
        
        cmd.select("rest", "resn STP and resi 0")
        
        for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
        for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))
        
        
        
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [6228,6229,6230,8333,8345,4402,4403,4404,6853,8346,8347,8348,8793,4355,4368,4369,6852,5770,4772,4773,4781,4783,4784,5767,4819,4822,4835,4774,8331,6181,6186,6190,5758,5766,5760,4400,6180,4881,6846,6849,8370,4821,4879,8368,8369,4422,4423,4880,4390,4433,4434,4435,4370,4371,6825,4389,6827,6828,6829,4437,4438,5771,5805,6226,6189,5773,8336] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.412,0.702]
select surf_pocket2, protein and id [15470,15567,15482,15489,15490,15493,15503,15506,15507,15563,15565,15640,17835,17836,17838,15618,15623,15627,15628,17785,17786,15676,15636,15639,15528,17801,17795,17793,17796,17797,17798,17799,17800,17784,17792,11878,11915,11917,11932,11876,17205,17243,11879,16727,17223,17225,11877,17508,17883,17476,17505,17507,17475,17477,17241,11916,11886,11891,15453,15468,17837,17867,15471] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.482,0.902]
select surf_pocket3, protein and id [14042,13629,13630,14086,14088,17555,13607,13610,13611,16060,16036,17577,14028,14029,14965,14973,14974,14977,14978,13609,14981,17538,17540,17543,17552,17553,17554,13991,13988,13990,13981,15393,15397,15433,15437,13562,15435,15436,18000,14966,14967,15373,15386,15387,15388,15012,17575] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.341,0.702]
select surf_pocket4, protein and id [6263,6264,8676,8630,8591,8593,8594,8590,8577,8585,8586,8589,8628,8629,8631,8625,6421,8578,6286,6302,2709,6261,6275,6283,6296,2711,6411,6416,6429,6433,6419,6420,6432,6521,6523,6436,6360,8298,8299,8300,8301,8306,8307,8310,2710,8036,2670,2673,7528,7529,8016,8018,7533,8044,8045,8048,7532,2647,2651,2650,7495,3084,3089,3091,3085,3088,3090,2634,2637,2638,7519,7520,7521,7522,7517,7506,7492,2684,2686,8268,8269,8270,7998,8030,8032,8034] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.361,0.392,0.902]
select surf_pocket5, protein and id [14772,14773,14774,14775,13942,15021,15022,15483,13939,13941,15495,15025,14769,14771,14756,15100,15141,15142,15099,15101,13953,13954,14980,14981,11949,11951,11318,12757,11256,15079,12756,15081,15083,11319,11320,11321,11370,11368,11302,11304,11306,15494,15532,15533,15492,11257,11258,11259,11260,11305,15051,12724,12726,12698,12740,12752,12767,12771,12772,11945,11948,11913,11925,11931,11933] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.290,0.278,0.702]
select surf_pocket6, protein and id [2993,3279,5154,5185,5188,12152,5167,12165,5168,5169,12166,12516,12199,12517,12483,12485,12213,14432,3007,2999,3264,2959,2960,2961,2946,2964,12484,14405,14410,14431,12468,14450,2992,2994,2781,3004,14409,5162,5165,5166,5163,12162] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.424,0.361,0.902]
select surf_pocket7, protein and id [2115,5203,5567,2053,6276,6285,2099,2112,2100,3517,3518,3519,3520,3521,2051,2052,5872,5874,5893,5894,2054,5844,5565,5566,5568,4734,4733,4742,4743,4746,5818,4735,5202,5814] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.365,0.278,0.702]
select surf_pocket8, protein and id [5842,5844,6303,6304,5852,6516,6495,5843,1813,5857,5859,5856,1920,2034,1744,1980,1981,1988,1989,1800,2099,2053] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.514,0.361,0.902]
select surf_pocket9, protein and id [5377,5360,5380,12728,12729,12712,12727,12709,12721,12696,12699,12701,12737,5121,5122,5124,5362,5378,12167,12170,11986,12700,12010,12011,12012,12664,12665,12666,5152,5155,14370,14372,14392,14393,14395,14396,14373,14374,14375,12168,12169,12212,12210] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.435,0.278,0.702]
select surf_pocket10, protein and id [2115,2164,3491,2053,6285,2099,2707,2708,6326,2095,6324,2143,2162,2163,2161,2113,2112,2096,2098,2100,6325,2051,2052,2743,2742,2739,2745,3476,2719,3494,3473,3475,2725,2727] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.608,0.361,0.902]
select surf_pocket11, protein and id [15410,15857,15858,15853,15838,15855,15908,15420,15675,16227,16244,16247,16248,15423,16246,17851,13530,13531,16287,16285,16286,15920,15676,15663] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.510,0.278,0.702]
select surf_pocket12, protein and id [13584,13585,13597,13641,13642,13644,13645,16034,16032,16003,16006,16007,13599,13643,13270,13271,15978,15981,15984,13258,13272,13259,13211] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.698,0.361,0.902]
select surf_pocket13, protein and id [5376,5377,12742,5403,5380,12741,12737,12740,12724,12726,12728,12729,12727,12725,5105,5379,5378,5608,12773,12774,12772,14373,14374,14375,14376,14771,5578,5605,5618] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.580,0.278,0.702]
select surf_pocket14, protein and id [14769,14771,15199,15200,15137,15141,15142,15198,15185,15197,15186,14772,12771,12772,12787,12805,12822,12740,12767,15081,15083] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.792,0.361,0.902]
select surf_pocket15, protein and id [7039,6651,7077,6467,6203,6650,6646,6648,6631,6701,7040,7041,6201,6212,6213,6216,6468,4323,6757,6759,6713,6760,6754,6755,6756,7054,7055,7073,7080,7103,7104,7058,4324,7053] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.651,0.278,0.702]
select surf_pocket16, protein and id [6616,6688,6703,4259,4261,6615,4289,3712,3713,3716,3747,3748,3749,4158,4219,4220,6728,4157,4288] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.886,0.361,0.902]
select surf_pocket17, protein and id [162,652,664,1349,1337,1343,1348,1350,710,712,1016,1014,680,1322,1324,1326,985,981,951] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.675]
select surf_pocket18, protein and id [12127,12129,12130,12132,12162,5288,12118,5221,5235,5236,5240,5241,5243,5122,5124,5125,5362,5363,5255,5222,5250,5253,5189] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.824]
select surf_pocket19, protein and id [39,316,329,1962,1877,1878,57,59,60,61,333,336,49,1879,1880,2006,3581,270,2004,2005,1964,1941,1958,1959,275,274,3594,3611,3613,1945,1943] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.604]
select surf_pocket20, protein and id [4378,6827,6828,6829,6777,6801,4390,4392,4435,4436,4437,4438,4004,4052,4051,4064] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.729]
select surf_pocket21, protein and id [13585,13597,13641,13642,13644,13645,16034,16035,16036,17577,16032,14086,14087,14088] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.278,0.533]
select surf_pocket22, protein and id [11240,15049,15050,10950,15510,15511,15723,10947,15702,15059,15065,11186,11194,11195,11198,15073,11006,15063,15064,15066,11004,11005,11018,10946,11016] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.361,0.639]
select surf_pocket23, protein and id [17024,17025,17064,16509,16510,16511,16478,16549,16942,16945,16948,16950,18376,16941,17001,18377,17002,16873,16550,18428,18429] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.278,0.459]
select surf_pocket24, protein and id [3564,3565,3580,5874,5876,5935,5979,3521,5990,5991,5992,5993,5934,5564,5562] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.361,0.545]
select surf_pocket25, protein and id [5141,5142,5164,5202,4760,4762,5201,5563,5564,5565,5566,5568,4734,5536,5203,5567,5199,5195] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.278,0.388]
select surf_pocket26, protein and id [3076,3236,2688,3073,3077,8239,8076,2687,8037,8264,8270,3197,3196,8090,8087,8126,8127,8236,8254] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.361,0.451]
select surf_pocket27, protein and id [9506,9504,5453,9840,9838,9882,9883,9400,9402,9856,9867,9865,9218,9221,9544,9546,9894] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.278,0.318]
select surf_pocket28, protein and id [12923,15933,15934,15935,12920,12955,12956,13495,13496,15910,15820,15895,15891,13468,12919,15822] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.361,0.361]
select surf_pocket29, protein and id [3307,3309,3290,12184,12186,12513,3322,12530,12531,12575,3277,3278,12027,12028,12029,12030,12151] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.318,0.278]
select surf_pocket30, protein and id [8297,8296,8306,8307,4760,4743,4746,4747,5773,5818,4734,6288,5225,4774,4757,4753,4770] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.902,0.451,0.361]
select surf_pocket31, protein and id [9477,9481,9501,9523,9526,9536,9245,9267,9542,9544,12801,11088,9482,11211,12788,12789,11212] 
set surface_color,  pcol31, surf_pocket31 
set_color pcol32 = [0.702,0.388,0.278]
select surf_pocket32, protein and id [14374,14375,14376,5138,5151,5578,5376,5377,5403,5380,5105,5379,5121,5378,5608] 
set surface_color,  pcol32, surf_pocket32 
set_color pcol33 = [0.902,0.545,0.361]
select surf_pocket33, protein and id [10187,10220,10222,10157,10531,10532,9887,9918,10543,9868,9870,10555,9858] 
set surface_color,  pcol33, surf_pocket33 
set_color pcol34 = [0.702,0.459,0.278]
select surf_pocket34, protein and id [1923,1924,6551,1837,1809,6548,6590,6591,6592,1863,1859,1866,1925,3663,3665,3662,6550,6614,6616] 
set surface_color,  pcol34, surf_pocket34 
set_color pcol35 = [0.902,0.639,0.361]
select surf_pocket35, protein and id [11029,11072,11130,11131,15797,15798,15799,11015,11027,15758,15759,12872,15757,15823,15879] 
set surface_color,  pcol35, surf_pocket35 
set_color pcol36 = [0.702,0.533,0.278]
select surf_pocket36, protein and id [799,810,822,1084,1085,1099,790,794,795,798,1100,1052] 
set surface_color,  pcol36, surf_pocket36 
set_color pcol37 = [0.902,0.729,0.361]
select surf_pocket37, protein and id [12923,13364,13365,13426,15935,12952,12953,12954,12955,12956,12967,13405,15929,13362,13406,15895] 
set surface_color,  pcol37, surf_pocket37 
set_color pcol38 = [0.702,0.604,0.278]
select surf_pocket38, protein and id [1638,1726,1582,1583,1637,1731,1584,1784] 
set surface_color,  pcol38, surf_pocket38 
set_color pcol39 = [0.902,0.824,0.361]
select surf_pocket39, protein and id [11858,11859,11711,12386,12294,12295,12362,12355,12360,12363,11676,16712,16714,16713,12296,11807,11809,11828,11804,11805] 
set surface_color,  pcol39, surf_pocket39 
set_color pcol40 = [0.702,0.675,0.278]
select surf_pocket40, protein and id [10005,10028,10291,10305,10306,10290,9996,10001,10017,10258] 
set surface_color,  pcol40, surf_pocket40 
set_color pcol41 = [0.886,0.902,0.361]
select surf_pocket41, protein and id [2467,2470,2471,2505,2503,7507,3092,2599,2600,2622,2473,3179,3180,3181,3090,3156,3154,3155,2652,2653] 
set surface_color,  pcol41, surf_pocket41 
set_color pcol42 = [0.651,0.702,0.278]
select surf_pocket42, protein and id [9458,11275,11278,11333,5392,12743,12738,12751,12754,12755,9482,5418] 
set surface_color,  pcol42, surf_pocket42 
   
        
        deselect
        
        orient
        