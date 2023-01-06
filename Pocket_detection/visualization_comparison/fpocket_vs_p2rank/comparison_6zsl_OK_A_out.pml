                  
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
            load "../p2rank_output/visualizations/data/6zsl_OK_A_out.pdb_points.pdb.gz", points
        set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [2708,2645,2670,2709,8031,8033,8034,2724,2648,3071,3082,7492,7493,7491,3085,3072,6258,6260,6261,6272,6280,6283,6284,6293,6297,6298,8298,6430,6433,8303,2685,8266,8267,8307,2682,3074,8087,8295,8296,8297,2635,2636,6296,6355,6357,2632,7502,7504,8582,8583,8586,8587,8589,8590,8591,8673,8015,7995,8013,7529,7530,8041,8042,8575,8625,8626,8627,8628,6243,6429,6408,6417,6413,6416,6426,7514,7516,7517,7518,7525,7489] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.349,0.702]
select surf_pocket2, protein and id [8342,8343,8344,8345,4770,4771,4772,4778,4779,4781,4820,6226,4401,4402,4399,4400,4879,4420,4421,4833,5756,5758,8329,8330,8332,8328,6227,5769,5771,5765,5768,4782,5764,8790,4353] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.404,0.361,0.902]
select surf_pocket3, protein and id [5892,2049,2050,2051,2052,5564,5565,5566,5891,2113,2162,3515,5872,6282,6322,5841,6270,6273,6285,6283,6284,2741,2705,2706,2737,3474,2740,3491,2717,2723,5563,4732,4733,4741,4744,5813,5812,5815,2093,6321,6323,2215,2725,2726,3473,2161,2159,2160,2141,2143,2094,2096,2097,2098] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.416,0.278,0.702]
select surf_pocket4, protein and id [4431,4434,4878,4427,4428,4876,4952,4954,4401,4402,4387,4388,4394,4399,4879,4416,6850,8345,8365,6849,6820,6821,6843,6846,6847,4367,4368,4369,6822,6824,8367] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.663,0.361,0.902]
select surf_pocket5, protein and id [6647,6648,4322,6628,6645,6698,6710,6197,6198,6209,6210,8657,6213,8656,8658,6464,4321,7036,6465,6466,6756,6757,7055,6751,6752,6753,7037,7038,8641,7034,7050,7051,7052,7053,7074,7077,7101,7100,6200,6707,6709] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.616,0.278,0.702]
select surf_pocket6, protein and id [5840,5842,1810,5850,5854,5855,5856,6513,6300,6301,5868,1990,5864,2050,2051,6492,2097,2032,1798,1918,1978,1986,1979,1987,1742] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.902,0.361,0.878]
select surf_pocket7, protein and id [4286,4287,6700,6706,6718,6685,3710,3711,3713,3745,3746,3747,6612,4257,4259,6719,6722,6723,6725,4156,4217,4218,6613] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.584]
select surf_pocket8, protein and id [4431,4432,4434,4433,4436,4062,4063,4050,4002,4435,4049,4387,4388,4390,4376,6771,6774,6824,6825,6826,6793,6799,6768,6786] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.620]
select surf_pocket9, protein and id [60,38,1875,1877,1878,1939,1956,1957,2002,2003,2004,1962,3579,318,269,315,328,335,1943,3592,1941] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.380]
select surf_pocket10, protein and id [1335,1348,1322,1324,650,1014,660,678,679,708,710,949,977,980,1012,979,161,662,160,1346,1347,1341] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.361]
select surf_pocket11, protein and id [808,797,820,1051,1082,1083,793,1097,774,792,1098,1050,1056,1078,1063,787,788] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.380,0.278]
select surf_pocket12, protein and id [6545,6547,1864,1921,1922,1923,6548,1857,1861,1862,1807,6587,6588,6589,6613,6670,6612,3661,3663,6611,1835,1844] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.620,0.361]
select surf_pocket13, protein and id [3152,3158,2501,2505,2468,2469,7504,2597,2598,3087,2650,2651,2471,3177,3154,3178] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.584,0.278]
select surf_pocket14, protein and id [1289,1387,1408,1409,1410,1388,1389,1264,1407] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.878,0.361]
select surf_pocket15, protein and id [75,94,415,1446,1447,1448,1492,1494,1495,1502,74,91] 
set surface_color,  pcol15, surf_pocket15 
   
        
        deselect
        
        orient
        