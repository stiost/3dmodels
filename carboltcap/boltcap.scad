$fn=100;

difference() {
    hull() {
        cylinder(d=20,h=15);
        translate([0,0,15]) cylinder(d=10, h=3);
    }
    translate([0,0,-2]) bolt(17,15);
    translate([0,0,10]) cylinder(d=5,h=10);
}

module bolt(w=17, h=15, cr=1) {
    hull() {
        radius = w/2 - cr;
        cp = [radius, 0, 0];
        translate(cp) cylinder(r=cr, h=h);
        rotate([0,0,60]) translate(cp) cylinder(r=cr, h=h);
        rotate([0,0,120]) translate(cp) cylinder(r=cr, h=h);
        rotate([0,0,180]) translate(cp) cylinder(r=cr, h=h);
        rotate([0,0,240]) translate(cp) cylinder(r=cr, h=h);
        rotate([0,0,300]) translate(cp) cylinder(r=cr, h=h);
        translate([0,0,h]) cylinder(d=5,h=3);
    }
}
