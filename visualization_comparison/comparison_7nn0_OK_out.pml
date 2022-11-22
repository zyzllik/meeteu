                  
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
        load "../fpocket_output/7nn0_OK_out.pdb", file
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
            load "../p2rank_predictions/visualizations/data/7nn0_OK_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [4410,4411,8335,4356,4357,4358,4359,6836,6840,8357,8356,4388,4377,4378,4379,4384,4406,4417,5762,8333,4343,6216,6217,8780,4391,4392,6833,4868,4423,4869,8358,3997,4425,4920,4942,4944,4424,4426,4421,4422,6832,6810,6811,6816,6812,6813,6814] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.404,0.702]
select surf_pocket2, protein and id [14055,14056,13656,13657,13602,13609,16086,16087,17604,13603,13604,13605,16083,14115,16061,16057,16058,16059,16079,14113,13630,13652,13663,13667,13623,13624,17603,15008,13589,13637,13638,15464,17579,17580,18027,13577,14007,14014,14015,14995,15005,17567,17568,17569,15463,17581,17582,14994,13634] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.459,0.902]
select surf_pocket3, protein and id [22853,22871,22824,22821,22822,22823,22828,22842,22843,22886,22887,22882,24682,24683,24684,26790,22811,22808,22856,22857,27186,27185,27247,25307,26825,26787,26799,22876,23275,22875,23331,23332,23333,23334,24224,24225,24226,23234,24223,24213,24214,26785,26800,26801,26802,23226] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.310,0.702]
select surf_pocket4, protein and id [32073,36008,32454,33446,33433,33434,33444,36027,36006,36018,36019,36021,32446,34526,32041,32077,33902,33903,32076,36028,36466,34525,36043,32062,32063,32091,32095,32096,32495,32044,34498,32043,32042,34497,34518,34522,34496] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.380,0.361,0.902]
select surf_pocket5, protein and id [27043,27044,27045,27047,24700,26753,26754,27129,27130,24875,24883,24886,24890,27085,27114,24717,24718,27046,27048,26452,26470,26472,24865,24870,24813,24812,24814,24874,21162,21163,21126,26490,26755,24750,24753,24754,24737,24740,24729,24715,24810,24811] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.341,0.278,0.702]
select surf_pocket6, protein and id [35491,35414,35465,35466,35397,35468,35395,34975,34976,34977,36840,36842,36843,3981,3984,36855,36860,3980,35015,36858,36894,35394,35407,35408,35411,6789,6816,35490,35530,6814,6815,7166,34944,34945,34946,34932,35463,35516,4040,3990,3992,4039,6786] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.498,0.361,0.902]
select surf_pocket7, protein and id [20548,20549,20552,20507,23189,23187,23188,24780,20616,21160,24779,24297,24324,24346,24347,24348,20503,20504,20617,21973,20568,21970,24021,24020,20566,24739,24730,24742,24268,24298] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.431,0.278,0.702]
select surf_pocket8, protein and id [4722,5831,5832,5882,5858,5881,2042,3509,2102,2152,3479,3505,3507,5553,5556,5860,5862,2039,5538,5549,5550,6272,6274,6275,2084,2151,2087,2022,1979,2038] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.616,0.361,0.902]
select surf_pocket9, protein and id [30383,34032,33956,33969,33973,33975,33972,30343,30344,35972,35973,35974,33959,33934,33936,33937,33948,36259,36262,36263,36264,36266,36302,33919,36303,36349,36304,36331,36332,36334,34105,34196,35671,36265,36267,34094,34102,34106] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.525,0.278,0.702]
select surf_pocket10, protein and id [1950,1994,50,1952,1992,1993,1870,3569,14652,326,14653,28,29,19,25,1869,283,318,324,328,259,305,3582] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.733,0.361,0.902]
select surf_pocket11, protein and id [3460,2794,2792,3446,2793,2913,2909,2914,14595,14596,14597,3494,2767,2768,2769,2944,2948,2951,14398,14456,2929,14355,14358,14359,14612,14613,14614,3490,3493,14374] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.616,0.278,0.702]
select surf_pocket12, protein and id [5922,5923,5550,5978,5979,5981,5614,14839,5862,5864,3552,3553,3554,3555,3521,14842,5552,5909,5918,5967,3586,3568] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.851,0.361,0.902]
select surf_pocket13, protein and id [283,3,182,184,328,1,13843,14681,14684,14685,14687,326,14653,13865,13867,13868,4,14650,14648,14649,14667,14668,14680,14271,14273] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.694]
select surf_pocket14, protein and id [25974,24863,24865,24874,27043,27044,26472,8536,27019,27020,27033,8540,27039,8953,8959,8983,8963,8965,24829,7350,8541,7388,7389,24862,24832,8537,8539] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.831]
select surf_pocket15, protein and id [15517,15520,15495,15497,15498,15509,17862,17863,17864,17865,17535,17825,17827,17910,17822,17820,15670,15534,15530,15667,15594,15655,15663,15666] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.600]
select surf_pocket16, protein and id [5213,2993,5177,3482,2731,2732,2994,5191,5556,14403,3509,3510,2671,2733,3029,5212,4748,4750,5130,4745] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.714]
select surf_pocket17, protein and id [10217,10218,10558,10559,9913,10214,10248,10249,10247,9943,9945,10582,9907,9897,9885,9895] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.510]
select surf_pocket18, protein and id [5113,5349,5350,5351,12038,12039,12040,12693,12160,12155,12157,12158,12159,5110,5112,5176,5149,5150,5173,5175,12728,12727,5368,5109,12190,12194,12196,12197,12198] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.596]
select surf_pocket19, protein and id [5609,12849,15213,12832,15106,15108,15110,15164,15169,12794,12814,12798,12799,12767,5613,15226,15227,14796,14798,14799] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.416]
select surf_pocket20, protein and id [9569,9571,9295,9528,9550,9224,9222,9573,9273,9274,9283,9504,11115,11116,12828,5640,12816,11239,11240,12815] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.478]
select surf_pocket21, protein and id [18515,18493,18494,18490,18789,18791,20457,20458,20459,22034,22047,20333,20335,18503,18561,20396,20411,20412,20415,20417,18748,18770] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.278,0.325]
select surf_pocket22, protein and id [6290,1801,5845,5844,5830,5840,5854,5832,1980,5847,2022,1788,1968,1969,1976,1977,1732] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.361,0.361]
select surf_pocket23, protein and id [19469,19105,19127,19778,19802,19779,19115,19117,19131,19163,19790,19434,19437,19438,19468,19405] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.325,0.278]
select surf_pocket24, protein and id [19015,19016,20065,20472,20089,18696,18693,18702,18707,18708,18709,18685] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.478,0.361]
select surf_pocket25, protein and id [29022,28998,29010,28999,28383,28385,28347,28351,28688,28689,28687,28325,28625,28335,28337,28354,28654,28657,28652,28658] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.416,0.278]
select surf_pocket26, protein and id [33998,29835,29724,29725,29769,29772,30392,30398,30400,29768,29836,29837,29726,29788,29834,33958,33999,30417,30380,31192] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.596,0.361]
select surf_pocket27, protein and id [29285,28235,28236,29309,29692,27929,27916,27922,27928,27905,27913,27927] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.510,0.278]
select surf_pocket28, protein and id [4040,4053,4424,4426,3992,4052,6816,6812,6813,6814,4378,4366,6764] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.714,0.361]
select surf_pocket29, protein and id [21530,21650,26690,26581,21141,26580,26692,26541,26543,21649] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.702,0.600,0.278]
select surf_pocket30, protein and id [1337,1326,1325,650,652,666,640,973,967,972,1313,1314,937,939,962,1003,1004,968,969] 
set surface_color,  pcol30, surf_pocket30 
set_color pcol31 = [0.902,0.831,0.361]
select surf_pocket31, protein and id [2695,2713,2707,2727,2152,3479,3507,2730,2698,6272,2084,2082,2083,2149,2150,2151,6312,6313,2715,3464] 
set surface_color,  pcol31, surf_pocket31 
set_color pcol32 = [0.702,0.694,0.278]
select surf_pocket32, protein and id [26194,27639,26248,26249,26245,26272,26122,27676,27623,27624,25757,26196,25797,26120,27636] 
set surface_color,  pcol32, surf_pocket32 
set_color pcol33 = [0.851,0.902,0.361]
select surf_pocket33, protein and id [7507,25856,27006,27008,27007,8554,8005] 
set surface_color,  pcol33, surf_pocket33 
   
        
        deselect
        
        orient
        