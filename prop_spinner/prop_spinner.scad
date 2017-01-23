//Print with hexagoal infil at

resolution=150;

backing_plate_r=71/2;
backing_plate_wall=2;
backing_plate_slot=2;
backing_plate_h=6;
backing_plate_grove_depth=2;
backing_plate_grove_tab_length=65;
backing_plate_grove_tab_offset=19/2;

prop_shaft_r=10 /2 - 0.5;
prop_shaft_h=20;

screw_posts_bottom_r=8/2;
screw_posts_top_r=6/2;
screw_posts_h=11;
screw_posts_offset_r=53/2;
screw_hole_r=1;
screw_hole_h=10;

difference() {
	cylinder(r=backing_plate_r, h=backing_plate_h, $fn=resolution);
	union(){
		translate([0,0,-1])
			cylinder(r=prop_shaft_r, h=prop_shaft_h, $fn=resolution);

		translate([0,0,backing_plate_h-backing_plate_grove_depth+0.001])
	//	color("red")
			difference() {
				cylinder(r=backing_plate_r-backing_plate_wall, h=2,  $fn=resolution);
				translate([0,0,-1])
					cylinder(r=backing_plate_r-backing_plate_wall-backing_plate_slot, h=backing_plate_grove_depth+2,  $fn=resolution);
			}
	}
}
//Extra groves
color("blue"){
translate([backing_plate_grove_tab_offset,
				-backing_plate_grove_tab_length/2,
				backing_plate_h-backing_plate_grove_depth])
cube([2,backing_plate_grove_tab_length,backing_plate_grove_depth]);

translate([-backing_plate_grove_tab_offset-2,
				-backing_plate_grove_tab_length/2,
				backing_plate_h-backing_plate_grove_depth])
cube([2,backing_plate_grove_tab_length,backing_plate_grove_depth]);
}

color("purple")
for (x = [-1, 1])
{
	translate([screw_posts_offset_r*x,0,backing_plate_h]) {
		difference(){
			cylinder(r1=screw_posts_bottom_r, r2=screw_posts_top_r, h=screw_posts_h, $fn=resolution);
			cylinder(screw_hole_r, h=screw_hole_h+2 , $fn=resolution);
		}
	}
}

//#cylinder(r=53/2, h=20);