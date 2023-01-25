from pymol import cmd, stored

structure_path = '7nio_OK_A.pdbqt'
# initial_center = (-17.992932530120488, 23.231783132530108, -27.456845783132515)
# initial_size = (25, 25, 25)


def create_initial_box(initial_center=(-17.992932530120488, 23.231783132530108, -27.456845783132515), 
                       initial_size=(25, 25, 25)):
    
    # Create box center
    cmd.pseudoatom('box_center', pos=initial_center)
    cmd.show('dots', 'box_center')
    cmd.color('red', 'box_center')
    
    # Create box vertices
    for i in [-1, 1]:
        for j in [-1, 1]:
            for k in [-1, 1]:
                cmd.pseudoatom(f'box_vertice_{i}_{j}_{k}',
                               pos=(initial_center[0]+i*initial_size[0]/2,
                                    initial_center[1]+j*initial_size[1]/2,
                                    initial_center[2]+k*initial_size[2]/2))
                cmd.show('dots', f'box_vertice_{i}_{j}_{k}')
                cmd.color('green', f'box_vertice_{i}_{j}_{k}')

def move_box(move_x, move_y, move_z):
    # Move center
    cmd.translate(vector=(move_x, move_y, move_z),
                  selection = 'box_center')
    
    # Move vertices
    for i in [-1, 1]:
        for j in [-1, 1]:
            for k in [-1, 1]:
                cmd.translate(vector=(move_x, move_y, move_z),
                              selection=f'box_vertice_{i}_{j}_{k}')

def change_size(size_x, size_y, size_z):
    # Get current center coordinates
    center = cmd.get_coordset('box_center')[0]
    
    # Move vertices
    for i in [-1, 1]:
        for j in [-1, 1]:
            for k in [-1, 1]:
                cmd.delete(f'box_vertice_{i}_{j}_{k}')
                cmd.pseudoatom(f'box_vertice_{i}_{j}_{k}',
                               pos=(center[0]+i*size_x/2,
                                    center[1]+j*size_y/2,
                                    center[2]+k*size_z/2))
                cmd.show('dots', f'box_vertice_{i}_{j}_{k}')
                cmd.color('green', f'box_vertice_{i}_{j}_{k}')
    
    
    

# Load the protein
structure_name = structure_path.partition('.')[0]
cmd.load(structure_path, structure_name)
cmd.hide('everything', structure_name)
cmd.show('surface', structure_name)
cmd.color('bluewhite', structure_name)
cmd.set('transparency', '0.3')

create_initial_box()

# Allow functions to be used in PyMOL command line
cmd.extend('create_initial_box', create_initial_box)
cmd.extend('move_box', move_box)
cmd.extend('change_size', change_size)
