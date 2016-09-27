$fn=100;
radius_fudge_factor=0; //.4*2;

sensor_r=16/2+radius_fudge_factor;
cap_r=2*25/2;

heights=1*25;

sensor_gap=9.35+2*sensor_r-2*radius_fudge_factor;

sensor_board=[46,22,20];
sensor_board_offset=[-46/2,-22/2,heights];
sensor_plug=[15,24,20];
sensor_plug_offset=[-15/2,0,heights+5];
    
    
    union(){
                    translate([sensor_gap/2,0,0])
                        cylinder(r=sensor_r, h=heights+2);
                    translate([-sensor_gap/2,0,0])
                        cylinder(r=sensor_r, h=heights+2);
                    translate(sensor_board_offset)
                        cube(sensor_board);
                    translate(sensor_plug_offset)
                        cube(sensor_plug);
    }