resolution=100;

shape_tube_d=30;

puncture_tube_d=shape_tube_d/2;
puncture_tube_r=puncture_tube_d/2;

puncture_tube_h=puncture_tube_r/tan(12);

venturi_r=puncture_tube_r/2;
venturi_h=puncture_tube_h/2.25;

echo (puncture_tube_r, puncture_tube_h);

//S=o/h
//c=a/h
//t=o/a
//a=o/t

difference() {
	cylinder(r2=0, r1=puncture_tube_r, h=puncture_tube_h, $fn=resolution);

	union(){
		translate([0,0,-0.005])
			cylinder(r=venturi_r, h=venturi_h, $fn=resolution);
		translate([0,0,venturi_h-venturi_r])
			rotate([0,90,0])
				cylinder(r=venturi_r, h=venturi_h, $fn=resolution);
		}
}