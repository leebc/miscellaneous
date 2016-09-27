$fn=100;
radius_fudge_factor=0; //.4*2;

sensor_r=16/2+radius_fudge_factor;
cap_r=2*25/2;

heights=1*25;

sensor_gap=9.35+2*sensor_r-2*radius_fudge_factor;


intersection(){
	difference(){
		union(){
			import("./hsm-bung.stl", convexity = 5);
			//cylinder(r=cap_r, h=heights);
		}
		union(){
			translate([sensor_gap/2,0,-1])
				cylinder(r=sensor_r, h=heights+2);
			translate([-sensor_gap/2,0,-1])
				cylinder(r=sensor_r, h=heights+2);
		}
	}
	cylinder(r=cap_r, h=2);
}
