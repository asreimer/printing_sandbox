thickness=4;

/////////////////////
//saddle for fence
/////////////////////
fench_width=22;
height=50;
overhang=50;
//back
translate([-(fench_width/2+thickness/2),0,height/2]) {
    cube([thickness,overhang,height],center=true);
}
//top
translate([0,overhang/2-thickness/2,height/2]) {
    cube([fench_width,thickness,height],center=true);
}
//front
translate([(fench_width/2+thickness/2),0,height/2]) {
    cube([thickness,overhang,height],center=true);
}
/////////////////////
//socket
/////////////////////
socket_depth=20;
socket_width=51;
socket_height=20;
stem_width=17;
stem_height=overhang-thickness; //-socket_height;
screw_depth=10;

translate([(fench_width/2+thickness+socket_depth/2-0.1),0,overhang/2]) {
    difference(){
        union(){
            // socket plate from which we'll subtract
            cube([socket_depth,overhang,height],center=true);
            
            // top plate to cover socket
            translate([socket_depth,0,0]){
                cube([thickness,overhang,height],center=true);
            }
        }
        union(){
            // remove ears piece from socket plate
            translate([0,overhang/2-socket_height/2-thickness,0])  cube([socket_depth+0.1,socket_height,socket_width+0.1],center=true);
            // remove stem piece from socket plate
            translate([0,-stem_height/2+1,0]) cube([socket_depth+0.1,stem_height+0.1,stem_width],center=true);
            //remove for screw holes from socket plate
            translate([socket_depth/2-screw_depth/2+0.1,-overhang/4,height/2-height/6]) {
                rotate([0,90,0]) cylinder(r=1.5,h=screw_depth,center=true,$fn=11);
            }
            translate([socket_depth/2-screw_depth/2+0.1,-overhang/4,-(height/2-height/6)]) {
                rotate([0,90,0]) cylinder(r=1.5,h=screw_depth,center=true,$fn=11);
            }
            //remove for screw holes from top plate
            translate([socket_depth,-overhang/4,height/2-height/6]) {
                rotate([0,90,0]) cylinder(r=2,h=screw_depth,center=true,$fn=11);
            }
            translate([socket_depth,-overhang/4,-(height/2-height/6)]) {
                rotate([0,90,0]) cylinder(r=2,h=screw_depth,center=true,$fn=11);
            }
        }
    }
}