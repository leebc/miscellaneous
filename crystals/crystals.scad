crystal1_b_h=20;
crystal1_b_r=7;
crystal1_facets=6;
crystal1_t_h=crystal1_b_r;

color_layer_h=3;
offset=0;
//offset=color_layer_h;

//difference()
intersection()
	{
	union()
		{
		cylinder(h=crystal1_b_h, r=crystal1_b_r,$fn=crystal1_facets);
		translate([0,0,crystal1_b_h])
			cylinder( h=crystal1_t_h, r2=0, r1=crystal1_b_r, $fn=crystal1_facets);
		}
	
	union()
		{
		translate([])
			rotate ([15,10,0])
		 		for (z = [0,1,2,3,4,5,6,7,8,9])
	 			{
				translate ([2,-5,z*3*color_layer_h-offset])
					cube([60,20,color_layer_h],center=true);
				}
			
		translate([0,0,3])
			rotate([-20,-20,0])
				cylinder(r=crystal1_b_r, h=crystal1_t_h, $fn=crystal1_facets);
		}
	}