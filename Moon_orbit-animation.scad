
$fn=60;
scale_factor=1000;

// Animate with Steps=27.322, the number of days in the moon's orbit of Earth


moon_radius=1737.1  /scale_factor ;
moon_duration=27.322;
moon_orbit_r=385000  /scale_factor /5;
moon_orbit_tilt_plane=5.14;
moon_orbit_period=27.322 ;

earth_radius=6371.0 /scale_factor ;
earth_tilt=23.44;

earth_orbit_radius=152100000  /scale_factor;

// Put a pin somewhere:  (East and South are negative)
	// Tampa Florida, home of the Tampa Hackerspace
	pin1_latitude=27.968055555555555; pin1_longitude=-82.47638888888889;

//	The moon's orbit
rotate([moon_orbit_tilt_plane,0,0])	{
	rotate([0,0,$t*360]) 
		translate([moon_orbit_r,0,0]) 
			difference()	{
				sphere(moon_radius);		/// The moon
				rotate([0,90,$t*-360])
					cylinder(r=moon_radius+1,h=moon_radius);	// Self shadow
			}
	// Moon's orbital plane
%	color("light_blue")
		cylinder(r=moon_orbit_r,h=moon_radius/40);
}

//	Earth, with axis
rotate([0,earth_tilt,0])	{
	color("blue")
		sphere(earth_radius);

	// Earth's axis of rotation
	translate([0,0,-earth_radius*2])
		color("white")
			cylinder(r=earth_radius/20, h=earth_radius*4);

	// Prime meridian/Hemisphere divider
	rotate([90,0,0])
		cylinder(r=earth_radius*1.025, h=earth_radius/20, center=true);

	
	// Put a pin in a place
	rotate([0,90-pin1_latitude,pin1_longitude])
		cylinder(r=earth_radius/40, h=earth_radius*1.1);
}


// Shadow from the Sun
%rotate([0,90,0])
	color("yellow")
		cylinder(r=earth_radius, h= moon_orbit_r*2);




