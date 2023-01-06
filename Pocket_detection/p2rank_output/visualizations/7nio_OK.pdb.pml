
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
        
        load "data/7nio_OK.pdb", protein
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
 
        load "data/7nio_OK.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [13967,13968,13976,13977,13980,13987,13991,14014,14015,14004,14007,14055,11941,11346,11349,11396,11397,11398,14459,11953,11973,12710,11977,11979,11917,11330,11395,11332,11333,11334,11287,11284,11286,11288,15106,15126,15128,14784,15127,13970,13969,14783,14796,14799,14800,14798,14795,12767,12779,12784,15108,15110,15167,15168,15169,12799,12798,14802,12725,12751,12754,15052,15048,15005,15050,15051,13638,14995,15007,14018,13652,13656,13657,14111,14113,13669,14115,15078,15519,15510,15522,11945,15521,15559,15560,11939,13981,14056,14008,11918,11919,11959,11961,11962,15557,11377,11379,11450,17531,18027,16087,17588,17565,17579,17580,17581,17582,17587,16083,17602,17604,17605,17532,17529,17541,17597,17543,13592,15463,15464,13577,13589,13634,13635,13637,13602,13603,13630,16059,13605,13611,13623,13624,16061,16057,16058] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.396,0.702]
select surf_pocket2, protein and id [8590,8591,8593,8594,8600,8601,8604,8605,8606,8608,2726,8580,8581,8607,8609,8582,8034,7544,7546,8032,8030,7534,7535,7543,7548,2741,2652,2685,2686,2688,8314,8315,8316,8691,8013,8025,8285,8051,2703,2725,2700,17788,18201,16635,16636,18200,18199,18206,6391,6393,16596,16597,18210,2653,7494,16633,7507,7533,7536,7519,6390,6423,6424,6426,6435,6373,6388,18234,18237,18302,6371,6315,6314,6336,6338,8644,8645,8646,8643,6276,6279,6290,6298,6299,6311,6301,6436,6375,6444,6448,6451,6447,8675,6278,17809,17810,17813,17851,17852,17850,17877,8564,17783] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.447,0.902]
select surf_pocket3, protein and id [15533,17824,17825,17827,11872,17828,17864,17910,17232,17534,17535,11922,17502,16752,16753,16754,16755,11871,17250,17252,17270,17264,17268,17504,16726,9011,8991,8992,8993,15608,15609,7375,7377,7378,16738,8995,15594,15663,15666,15667,15495,15497,15498,15643,15644,15645,15642,11944,15517,15520,11884,11905,11907,11904,11906,11920,11921,15509,15530,8564,17799,17800,17823,17801,8568,7415,7416,7417,16713,17253,15654,17809,17810,17813,8633,17811,17812,17819,17820,17862,17865,17863,15653,15655,8630,8658,8631,8632,8981,9015,9017,8987,8579,8578,8590,8591,8593,8594] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.278,0.298,0.702]
select surf_pocket4, protein and id [5830,5860,6291,6317,6318,6319,5858,5859,5910,2067,2068,2069,5909,3548,5580,5577,5579,5872,5882,5868,5886,5873,5875,6531,5888,5565,3575,3580,5890,5892,5950,5951,4750,5831,5832,4748,4749,5581,5583,5576,5564,2047,2006,2065,2066,2004,2007,3565,1759,2048,2049,6316,1828,1815,6300,6303,5833,5834,6302,3532,3533,3534,3535,3536,3537,4761,4762,4789,4758,4768,4775,8347,5789,5788,8346,2114,2177,2178,2179,2129,6340,6341,2111,2112,2113,2115,6313,6335,6312,2758,2760,2702,2703,8312,2742,2722,3506,3507,2734,2754,2757,2740,2176] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.404,0.361,0.902]
select surf_pocket5, protein and id [8362,8363,4837,4894,4895,4370,4383,4384,6860,6861,6864,6868,8385,6838,6840,8351,8348,8360,8361,5788,8346,4762,4788,4789,4796,8349,6244,4415,5776,4433,4437,4438,4444,4358,4385,4386,4404,4405,4406,4411,4448,4451,4893,6842,6241,5821,4418,4419,6205,6201,6195,5785,5786,5787,8367] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.365,0.278,0.702]
select surf_pocket6, protein and id [8091,8253,8102,8105,8142,3088,3091,3212,3211,2415,2438,3107,8104,8140,8141,8325,2699,3090,3092,3251,3250,8285,8049,8326,8251,8235,8248,2413,8270] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.533,0.361,0.902]
select surf_pocket7, protein and id [14802,14376,12754,12756,14433,14437,14432,14434,12241,14799,14800,14801,13968,13977,13994,13996,14459,11979,11288] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.467,0.278,0.702]
select surf_pocket8, protein and id [17472,17360,17361,12321,17324,12341,17321,17323,17373,12347,12359,12363,17482,17488,17498,17310,17469,17470,17265,17267,17268,17271,17504,17503,17544,17545,11920,12311,12470,12307,12308,12309,12310,12430,11658,12431,11634] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.663,0.361,0.902]
select surf_pocket9, protein and id [6843,6844,6842,4019,4079,4066,4067,4080,4065,4023,4448,4449,4451,4453,4450,4452,6814,4393,4405,6811,4407,6792,6786,4465,6817,6815,6816] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.565,0.278,0.702]
select surf_pocket10, protein and id [16273,16287,16313,16341,16290,16289,16340,17878,16274,16275,16292,15690,15884,13558,15436,15437,15865,15882,15935,15947,13557,15993,15946,15701,15703,15885,17894,15702,17895,15434,15446,15447,15450] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.792,0.361,0.902]
select surf_pocket11, protein and id [15078,15536,15537,10978,11268,15538,15750,11033,11047,15093,11034,11334,15076,11223,15086,11154,15090,11215,11214,11222,11216] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.667,0.278,0.702]
select surf_pocket12, protein and id [16023,16005,16006,16008,16011,16063,13284,13298,13286,13238,13285,16059,13611,13623,13624,16061,13612,16033,16062,13626,13668,13669,13670,13671,13672,16412,16414,16030,16034,16035] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.878]
select surf_pocket13, protein and id [4235,6742,3762,3763,3764,4303,6718,4304,6741,6743,3731,4276,3728,4173,4234,6703,6630] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.278,0.631]
select surf_pocket14, protein and id [13523,12950,13493,13522,15849,15850,13517,12983,13507,15959,15960,15962,13495,12946,13491,13488,12947,15922,15937,15955] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.361,0.749]
select surf_pocket15, protein and id [8992,8993,15571,15612,7375,7377,8994,8995,9070,9069,11872,15557,15569,11378,11379,11380,15575,11451,11452,11873,11832,11819,11820,10920] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.278,0.533]
select surf_pocket16, protein and id [7052,7054,7094,7122,4338,6646,6728,4339,6218,6217,6665,6666,6661,6663,6483,6482] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.361,0.620]
select surf_pocket17, protein and id [12828,11116,11239,11240,11114,12815,9296,9529,9551,9554,9274,9284,9292,9570,9572,9505,9506,11198] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.278,0.431]
select surf_pocket18, protein and id [3597,2020,1896,1897,2021,3596,3609,56,78,310,332,345,351,73,55,65,353,286] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.902,0.361,0.490]
select surf_pocket19, protein and id [10215,10219,10208,10213,10250,10559,10560,9915,9944,9886,10583,9946,9914] 
set surface_color,  pcol19, surf_pocket19 
set_color pcol20 = [0.702,0.278,0.329]
select surf_pocket20, protein and id [679,1031,667,1363,1364,1365,677,689,695,1029,177,178,1339,1341,967] 
set surface_color,  pcol20, surf_pocket20 
set_color pcol21 = [0.902,0.361,0.361]
select surf_pocket21, protein and id [6430,1723,1727,1733,6433,1713,1714,1716,1734,1780,6424,18237,18301] 
set surface_color,  pcol21, surf_pocket21 
set_color pcol22 = [0.702,0.329,0.278]
select surf_pocket22, protein and id [1627,577,578,2034,2098,269,270,264,247,1651] 
set surface_color,  pcol22, surf_pocket22 
set_color pcol23 = [0.902,0.490,0.361]
select surf_pocket23, protein and id [6563,6566,3680,6565,1939,1940,6567,1881,6604,6605,6606,6607,6631,1938,1852,1824,1836,1838] 
set surface_color,  pcol23, surf_pocket23 
set_color pcol24 = [0.702,0.431,0.278]
select surf_pocket24, protein and id [10029,10033,10038,10056,10333,10334,10296,10318,10319,10286,10024,10044] 
set surface_color,  pcol24, surf_pocket24 
set_color pcol25 = [0.902,0.620,0.361]
select surf_pocket25, protein and id [3134,2485,2318,2618,2518,2520,3173,3175,2482,3171,2668,3195,2486] 
set surface_color,  pcol25, surf_pocket25 
set_color pcol26 = [0.702,0.533,0.278]
select surf_pocket26, protein and id [11704,11737,11739,11736,12393,11834,11835,11836,12390,12414,11701,11705,16739,16740,12392,12394,11837] 
set surface_color,  pcol26, surf_pocket26 
set_color pcol27 = [0.902,0.749,0.361]
select surf_pocket27, protein and id [9796,9797,10846,9466,11317,11253,9487,9489,9490,9483,10870,10856] 
set surface_color,  pcol27, surf_pocket27 
set_color pcol28 = [0.702,0.631,0.278]
select surf_pocket28, protein and id [10965,10960,10954,10955,10871,10817,10818,11018] 
set surface_color,  pcol28, surf_pocket28 
set_color pcol29 = [0.902,0.878,0.361]
select surf_pocket29, protein and id [18455,16961,16577,18401,18404,18416,18419,16972,16900,16968,16969,16975,17051,17052,17025,16955,16956,16957,17026,16977] 
set surface_color,  pcol29, surf_pocket29 
set_color pcol30 = [0.667,0.702,0.278]
select surf_pocket30, protein and id [16977,16978,16536,16537,16538,17051,17052,18404] 
set surface_color,  pcol30, surf_pocket30 
   
        
        deselect
        
        orient
        