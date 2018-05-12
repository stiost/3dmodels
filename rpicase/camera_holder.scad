$fn=100;

module camboard() {
    board_w=23.862;
    board_d=25;
    case_wall=1.25; // not specified in spec
    hole_d=2.2;
    corner_radius=2;
    
    lense_d=8;
    cam_x=14.5;
    cam_y=12.5;
    
    difference() {
        linear_extrude(case_wall) {
            rounded_square(board_w,board_d,corner_radius);
        }
        translate([cam_x,cam_y,-case_wall/2]) cylinder(d=lense_d,h=case_wall*2);
    }
    linear_extrude(10) {
        translate([2,2]) circle(d=hole_d);
        translate([2,board_d-2]) circle(d=hole_d);
        translate([14.5,2]) circle(d=hole_d);
        translate([14.5,board_d-2]) circle(d=hole_d);
    }
}

module rounded_square(w,d,r) {
      minkowski() {
        translate([r,r]) square([w-r*2,d-r*2]);
        circle(r=r);
    }
}

camboard();
