base_x = 10;
base_y = 15;
base_z = 20;
hole_dia = 20;


difference(){
cube([base_x,base_y,base_z]);
translate([base_x/2, base_y/2, base_z/2])	cylinder(h = base_z*2, d = 30);
}