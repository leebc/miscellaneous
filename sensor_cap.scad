$fn=100;
radius_fudge_factor=0.4*2;

sensor_r=16+radius_fudge_factor;
cap_r=2*25;

heights=1*25;

sensor_gap=9.35+2*sensor_r;

intersection(){
	difference(){
		cylinder(r=cap_r, h=heights);
		union(){
			translate([sensor_gap/2,0,-1])
				cylinder(r=sensor_r, h=heights+2);
			translate([-sensor_gap/2,0,-1])
				cylinder(r=sensor_r, h=heights+2);
		}
	}
	cylinder(r=cap_r, h=2);
}
