
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
        
        load "data/5rm2_OK_B.pdb", protein
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
 
        load "data/5rm2_OK_B.pdb_points.pdb.gz", points
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
select surf_pocket1, protein and id [8568,8576,8578,8582,8618,8619,8621,8666,8580,8581,8583,8584,8290,6273,6276,2662,2698,2699,2700,6236,8288,8291,8260,8567,8575,8579,8569,2715,6289,6311,6346,8027,7988,8008,8006,7510,2659,2660,2661,8024,8258,8259,2669,2674,6253,6410,6422,6423,8620,6251,6254,8651,6459,6265,6272,6286,6348,6350,6406,6419,6401,6411,6290] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.353,0.702]
select surf_pocket2, protein and id [4392,4393,4394,4390,5749,5750,6156,4773,4774,4771,4812,4825,5748,4345,4413,4871,6819,4811,4412,4869,5760,5761,5764,5795,8325,5756,5757,6170,6169,6216,6218,6219,6220,6171,6176,6180,6843,8338,8358,8360,8323,8335,8321,8783,8336,8337,4764] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.388,0.361,0.902]
select surf_pocket3, protein and id [2040,5555,2103,3510,3523,3507,2042,5833,5804,6266,6275,5808,2101,3540,2102,2104,2085,2087,2088,2089,5882,5883,5884,5552,5554,5924,5925,2041,2043,5862,3550,5864,5866,3554,3555,2039,3535,3539,4722,4724,4725,4736,5763,4737,5557,5556,5558,5539,5764,5805,2708,2728,2734,3481,2731,2732,2696,6277,6278,2714,2151,2153,6315,2716,6316] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.396,0.278,0.702]
select surf_pocket4, protein and id [6446,6640,6641,6636,6638,7010,8634,6458,6459,6203,6206,4313,4314,6193,7029,7068,7070,7069,7031,7027,7030,6621,6691,6703] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.631,0.361,0.902]
select surf_pocket5, protein and id [4424,4425,4426,4427,4428,3994,4041,4042,6789,6817,6815,4367,4368,6767,6786,6790,4380,4382,4053,4054,4055,6761,6764] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.584,0.278,0.702]
select surf_pocket6, protein and id [4870,4871,6819,4380,4869,6817,6818,6815,4368,4424,4426,4427,4428,8360] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.875,0.361,0.902]
select surf_pocket7, protein and id [5832,1981,5856,5834,5842,6506,5846,5847,5849,6485,1802,1799,5848,1969,1977,1978,2023,1788,1789,1729,1730,1787,6293,6294,1733] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.702,0.278,0.627]
select surf_pocket8, protein and id [7728,7332,7731,7733,7849,7293,7807,7808,9159,7292,9160,7294,7656,7725,7724,7784,7785,7261,7333,9212,9211] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.682]
select surf_pocket9, protein and id [3702,4251,3703,3705,3739,6678,6716,6718,3738,4278,4279,6693,6674,6717,6603,6605] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.439]
select surf_pocket10, protein and id [5552,5554,5924,5925,5864,3588,3554,3555,3570,5920,5969,3605,5981,5980,5982,5983] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.439]
select surf_pocket11, protein and id [1326,1314,1338,1315,940,701,1003,1005,970,651,641,653] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.310,0.278]
select surf_pocket12, protein and id [1871,1995,3571,284,306,309,28,50,319,325,327,265,264,1994,260,3572,3584] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.522,0.361]
select surf_pocket13, protein and id [1855,3655,1914,6580,6581,1798,6540,6606,6582,6663,6541,6542,1913,1810,1812] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.502,0.278]
select surf_pocket14, protein and id [6712,4145,4147,4148,4210,3750,4188,4189,3705,3739,6678,6718,3735,3736,3737,3738] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.765,0.361]
select surf_pocket15, protein and id [2587,2588,2590,7495,7496,2592,2496,2642,3169,3077,3078,3079,7497,2641,2611,3138,3143,3146,3145,2459] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.690,0.278]
select surf_pocket16, protein and id [784,800,788,811,1073,1074,1088,779,1089,1041] 
set surface_color,  pcol16, surf_pocket16 
   
        
        deselect
        
        orient
        