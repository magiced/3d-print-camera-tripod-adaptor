/* Camera Quick Release Plate */

/* NOTE: 
	width = x
	length = y
	height/depth = z)
*/

/* Base Plate Variables */
base_width = 50;
base_length = 60;
base_height = 3;

/* Clamp Variables */

clamp_width = 44.5;
clamp_length = 44;
clamp_height = 9;
clamp_slope_height = 9;

/* Hole Variables */
bolt_hole_dia = 7;
spot_face_dia = clamp_width-5;
spot_face_depth = 10;
wall_thickness = 2;

module base()
{
	cube([base_width,base_length,base_height]);
}

module clamp()
{

union()
{
	cube([clamp_width,clamp_length,clamp_height]);
//translate and rotate these so that they are on each end and lying flat and triangly
	translate([0,0,clamp_height - clamp_slope_height/4]) rotate([0,90,0])
	cylinder( d = clamp_slope_height, h = clamp_width, $fn = 3);
	translate([0,clamp_length,clamp_height - clamp_slope_height/4]) rotate([0,90,0])
	cylinder( d = clamp_slope_height, h = clamp_width, $fn = 3);
}

}

module hole()
{
rotate([0,180,0]) //rotates it round to act like a drill
{
	cylinder(d = bolt_hole_dia, h = clamp_height+base_height+2, $fn = 24);
	//cylinder(d = spot_face_dia, h = spot_face_depth+1);

}

}


/* Main Code  # */

difference()
{
union()
	{
		base();
		translate([(base_width-clamp_width)/2,(base_length-clamp_length)/2, base_height])
			{
				clamp();
			}
	
}
// hole
translate([base_width/2, base_length/2, base_height+clamp_height+1])
	{
		hole();
	}

#translate([(base_width-clamp_width)/2 + wall_thickness,(base_length-clamp_length)/2 + wall_thickness, base_height])
	cube([clamp_width-2*wall_thickness,clamp_length-2*wall_thickness,base_height+clamp_height-wall_thickness+1]);
}