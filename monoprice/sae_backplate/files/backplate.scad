difference(){
//cube([50,50,4],center=true);
cylinder(h=4,r=35,center=true);
translate([12.5,12.5,0]) {
   cylinder(h=5,r=1,center=true,$fn=11);
   }
translate([-12.5,12.5,0]) {
   cylinder(h=5,r=1,center=true,$fn=11);
   }
translate([-12.5,-12.5,0]) {
   cylinder(h=5,r=1,center=true,$fn=11);
   }
translate([12.5,-12.5,0]) {
   cylinder(h=5,r=1,center=true,$fn=11);
   }
cylinder(h=5,r=10,center=true);
}