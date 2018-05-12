$fn=100;

module camboard() {
    board_w=23.862;
    board_d=25;
    board_h=1.25; // not specified in spec
    hole_d=2.2;
    corner_radius=2;
    
    // board
    linear_extrude(board_h) {
        difference() {
            rounded_square(board_w,board_d,corner_radius);
            translate([2,2]) circle(d=hole_d);
            translate([2,board_d-2]) circle(d=hole_d);
            translate([14.5,2]) circle(d=hole_d);
            translate([14.5,board_d-2]) circle(d=hole_d);
        }
    }
    
    // cable
    con_h=3.82; // measured from top of board
    con_d=20.8;
    con_w=6.4; // measured
    cable_d=19; // measured todo
    cable_w=5;
    cable_h=1;
    translate([board_w-con_w,board_d/2-con_d/2,-con_h+board_h]) cube([con_w,con_d,con_h]);
    translate([board_w,board_d/2-cable_d/2,-board_h]) cube([cable_w,cable_d,cable_h]);
 
    // lense
    lense_d=7.25; // measured
    lense_h=10; // measured from base of board
    cam_d=8;
    cam_h=5; // measured
    cam_x=14.5;
    cam_y=12.5;
    translate([cam_x,cam_y,cam_h/2]) cube([cam_d,cam_d,cam_h],center=true);
    translate([cam_x,cam_y]) cylinder(d=lense_d,h=lense_h);
    
}

module rounded_square(w,d,r) {
      minkowski() {
        translate([r,r]) square([w-r*2,d-r*2]);
        circle(r=r);
    }
}

camboard();
