resolution=100;

shape_tube_d=30;

puncture_tube_d=shape_tube_d/2;
puncture_tube_r=puncture_tube_d/2;
puncture_tube_h=5+puncture_tube_r/tan(12.25);

venturi_r=puncture_tube_r/4;
venturi_h=puncture_tube_h/2.5;

tube_tube_r=puncture_tube_r;
tube_tube_h=puncture_tube_h/2;

echo (puncture_tube_r, puncture_tube_h);

//S=o/h
//c=a/h
//t=o/a
//a=o/t

difference() {
//	cylinder(r=2*puncture_tube_r, h=2*puncture_tube_h, $fn=resolution);

	union(){
#		translate([0,0,tube_tube_h])
			difference(){
				cylinder( r=puncture_tube_r, h=puncture_tube_h, $fn=resolution);
				translate([puncture_tube_d/-2,8,-1])
					rotate([45/2,0,0])
						cube([puncture_tube_d,puncture_tube_d,100]);
			}
			difference() {
				cylinder(r=tube_tube_r, h=tube_tube_h, $fn=resolution);
				union(){
					translate([0,0,-0.005])
						cylinder(r=venturi_r, h=venturi_h, $fn=resolution);
					translate([0,0,venturi_h-venturi_r])
						rotate([0,90,0])
							cylinder(r=venturi_r, h=venturi_h, $fn=resolution);
				}
			}
				
			 rotate([0,180,180])
			difference()  {
				cylinder(r=tube_tube_r, h=tube_tube_h, $fn=resolution);
				union(){
					translate([0,0,0.005])
						cylinder(r=venturi_r, h=venturi_h, $fn=resolution);
					translate([0,0,venturi_h-venturi_r])
						rotate([0,90,0])
							cylinder(r=venturi_r, h=venturi_h, $fn=resolution);
				}
			}
		
	}	// end difference union
}	// end outer difference