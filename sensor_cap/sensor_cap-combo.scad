$fn=100;
radius_fudge_factor=0; //.4*2;

sensor_r=16/2+radius_fudge_factor;
cap_r=2*25/2;

heights=1*25;

sensor_gap=9.35+2*sensor_r-2*radius_fudge_factor;


intersection(){
	difference(){
		union(){
            !intersection(){
             //   minkowski(){
               import("./hsm-bung-meshed.stl", convexity = 20);
                //}
                translate([0,0,-3.166])
                    cube([50,50,50]);
            }
      #      color("green")
               translate([0,0,-3.16])
                cylinder(r=cap_r+3,h=0.2);
			//cylinder(r=cap_r, h=heights);
		}
        rotate([0,0,-360/16])
            translate([0,0,-heights/2])
                union(){
                    translate([sensor_gap/2,0,-1])
                        cylinder(r=sensor_r, h=heights+2);
                    translate([-sensor_gap/2,0,-1])
                        cylinder(r=sensor_r, h=heights+2);
		}
	}
        translate([0,0,-20])
            //cylinder(r=cap_r*2, h=50);
    cube([60,60,60]);
}
