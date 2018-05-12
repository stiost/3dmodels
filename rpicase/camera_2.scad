$fn=100;

board_w=23.862;
board_d=25;
board_h=1.25; // not specified in spec
hole_d=2.2;
corner_radius=2;
cable_d=19; // measured todo
cable_h_offset=0.5;

box_h=10;
bottom_t=2;
wall_lw=0.5;
wall_t=1+wall_lw;
wall_cr=corner_radius+wall_t;
rest_h=5;
rest_d=3;

module rounded_square(w,d,r) {
      minkowski() {
        translate([r,r]) square([w-r*2,d-r*2]);
        circle(r=r);
    }
}

module inside() {
    union() {
        linear_extrude(box_h-bottom_t+1) {
            rounded_square(board_w,board_d,corner_radius);
        }
        lense_d=8;
        lense_h=bottom_t+2;
        cam_x=14.5;
        cam_y=12.5;
        translate([cam_x,cam_y,-lense_h+1]) cylinder(d=lense_d,h=lense_h);
    }
}

module holders() {
    linear_extrude(box_h-bottom_t) {
        translate([2,2]) circle(d=hole_d);
        translate([2,board_d-2]) circle(d=hole_d);
        translate([14.5,2]) circle(d=hole_d);
        translate([14.5,board_d-2]) circle(d=hole_d);
    }
    linear_extrude(rest_h) {
        translate([2,2]) circle(d=rest_d);
        translate([2,board_d-2]) circle(d=rest_d);
        translate([14.5,2]) circle(d=rest_d);
        translate([14.5,board_d-2]) circle(d=rest_d);
    }
}

difference() {
    // cabinet
    linear_extrude(box_h) {
        rounded_square(board_w+wall_t*2,board_d+wall_t*2,wall_cr);
    }
    
    // leeway
    x = wall_t-wall_lw;
    #translate([x,x,bottom_t]) linear_extrude(box_h-bottom_t) {
        rounded_square(board_w+wall_lw*2,board_d+wall_lw*2,wall_cr-wall_lw);
    }
    
    // inside
    translate([wall_t,wall_t,bottom_t]) inside();
    
    // cable slot
    translate([board_w+wall_t-1,wall_t+board_d/2-cable_d/2,rest_h+board_h+cable_h_offset]) 
        cube([wall_t+2,cable_d,5]);
}

translate([wall_t,wall_t,bottom_t]) holders();
