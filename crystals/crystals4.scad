crystal1_h=40;
crystal1_r=8;
crystal1_facets=6;
crystal1_angles=[-30,0,0];

crystal2_h=30;
crystal2_r=6;
crystal2_facets=6;
crystal2_angles=[20,0,0];

crystal3_h=20;
crystal3_r=3;
crystal3_facets=6;
crystal3_angles=[20,0,0];

crystal4_h=10;
crystal4_r=8;
crystal4_facets=6;
crystal4_angles=[5,-20,0];

crystal5_h=20;
crystal5_r=3;
crystal5_facets=6;
crystal5_angles=[-10,-10,0];

crystal6_h=25;
crystal6_r=6;
crystal6_facets=6;
crystal6_angles=[-10,-20,0];



difference()
	{
		difference()
//		union()
	{
	color("blue")
	union()
		{
		translate([0,0,-5])
			rotate(crystal1_angles)
				cylinder(h=crystal1_h, r=crystal1_r,$fn=crystal1_facets);
		translate([crystal2_r/2,2*crystal2_r,0])	
			rotate(crystal2_angles)
				cylinder(h=crystal2_h, r=crystal2_r,$fn=crystal2_facets);
		translate([crystal1_r,crystal3_r,0])
			rotate(crystal3_angles)
				cylinder(h=crystal3_h, r=crystal3_r,$fn=crystal3_facets);		
		}
	!color("black")
	difference()
		{
		union()
			{
				translate([0,0,0	])
					rotate(crystal4_angles)
						cylinder(h=crystal4_h, r=crystal4_r,$fn=crystal4_facets);
				translate([crystal1_r*1.5,crystal1_r,0])
					rotate(crystal5_angles)
						cylinder(h=crystal5_h, r=crystal5_r,$fn=crystal5_facets);	
				translate([0*crystal1_r,2*crystal6_r,0])
					rotate(crystal6_angles)
						cylinder(h=crystal6_h, r=crystal6_r,$fn=crystal6_facets);	
			}
		translate([0,0,-7])
			cube([50,50,15], center=true);
		}
	}
	translate([0,0,-7])
		cube([50,50,15], center=true);
	}