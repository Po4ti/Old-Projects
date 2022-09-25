/// @desc scrMakeStar(x,y,angle,edges,numprojectiles,speed,obj)
/// @arg x
/// @arg y
/// @arg angle
/// @arg egdes
/// @arg numprojectiles
/// @arg speed
/// @arg obj

var spawnX = argument0;
var spawnY = argument1;
var spawnAngle = argument2;
var spawnEdges = argument3;
var spawnNum = argument4;
var spawnSpeed = argument5;
var spawnObj = argument6;
var th, xx, yy, ddx, ddy, dx, dy, a;

th = degtorad (spawnAngle);

for (var i = 0; i < spawnEdges; i ++) {
    xx[i] = cos(th + 2*pi * i/spawnEdges);
    yy[i] = sin(th + 2*pi * i/spawnEdges);
}

for (var i = 0; i < spawnEdges; i ++) {
    ddx = xx[(i+2)%spawnEdges]-xx[i];
    ddy = yy[(i+2)%spawnEdges]-yy[i];
    for(var j = 0; j < spawnNum; j ++) { 
        dx = xx[i]+ddx*j/spawnNum;
        dy = yy[i]+ddy*j/spawnNum;
        
        a = instance_create(spawnX+dx,spawnY+dy,spawnObj) ;
        a.direction = point_direction(0,0,dx,dy);        
        a.speed = spawnSpeed*point_distance (0,0,dx,dy);
        a.tag = 1;
    }
}
