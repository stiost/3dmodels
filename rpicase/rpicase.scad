$fn=100;

//cylinder(d=20,h=15);
//translate([0,0,15]) cylinder(d=10, h=3);
//board_dim = [85, 56, 1.25];

/* Plate holes */
//hole_d = 2.75;
//hole_orig = [board_dim[0], board_dim[1]] * -.5;
//ring_off = 6.2 - hole_d;
//hole_pad = 3.5;
//holes_pos =  [[-39, -24.5], [19, -24.5], [-39, 24.5], [19, 24.5]];

/* Components bounding box dimensions */
ethernet_dim    = [   21, 16, 13.5];
gpio_dim        = [   51,  5,  8.5];
hdmi_dim        = [ 11.5, 15,  6.5];
jack_dim        = [ 14.5,  7,    6];
microsdcard_dim = [   15, 11,    1];
microsdslot_dim = [ 11.5, 12, 1.25];
microusb_dim    = [    6,  8,    3];
serialcon_dim   = [  2.5, 22,  5.5];

//ethusb_dim      = [17.25, 3.25, 13.5]; // cleanup box
//usbusb_dim      = [17.25,    3, 16.5]; // cleanup box
//

module rpi_board() {
    board_w=85;
    board_d=56;
    board_h=1.25;
    linear_extrude(board_h) {
        difference() {
            // board
            corner_radius=3;
            translate([corner_radius - board_w/2, corner_radius - board_d/2]) {
                minkowski() {
                    square([board_w - corner_radius*2, board_d - corner_radius*2]);
                    circle(r=corner_radius);
                }
            }
            // holes
            hole_d = 2.75;
            translate([-19,-24.5]) circle(d=hole_d);
            translate([-19, 24.5]) circle(d=hole_d);
            translate([39, -24.5]) circle(d=hole_d);
            translate([39, 24.5]) circle(d=hole_d);
        }
    }
    
    // usb
    usb_w=17.25;
    usb_d=15;
    usb_h=16.5;
    translate([-board_w/2,-board_d/2+2]) cube([usb_w,usb_d,usb_h]);
    translate([-board_w/2,-board_d/2+2+usb_d+3]) cube([usb_w,usb_d,usb_h]);
    
    // ethernet
    eth_w=21;
    eth_d=16;
    eth_h=13.5;
    translate([-board_w/2,-board_d/2+2+usb_d+3+usb_d+3.25]) cube([eth_w,eth_d,eth_h]);
     
}

rpi_board();

    

//difference() {
//plate_2d(board_dim[0], board_dim[1], 3);
//translate([-39,-24.5]) circle(hole_d);
//translate([19,-24.5]) circle(hole_d);
//translate([-39,24.5]) circle(hole_d);
//translate([19,24.5]) circle(hole_d);
//}
