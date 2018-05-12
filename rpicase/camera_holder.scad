$fn=100;

module camboard() {
    board_w=23.862;
    board_d=25;
    board_h=1.25; // not specified in spec
    hole_d=2.2;
    corner_radius=2;
    
    linear_extrude(board_h) {
            rounded_square(board_w,board_d,corner_radius);
    }
    linear_extrude(5) {
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
