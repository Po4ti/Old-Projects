///scrDeliriumDebugSpawnPortal(room)
var roomChooser,rr;

roomChooser = argument0;
switch (roomChooser) {
    case rPronin1:
        rr = 0;
        break;
    case rPronin2:
        rr = 1;
        break;
    case rPronin4:
        rr = 2;
        break;
    default:
        exit;
        break;
}

portal = instance_create(144,choose(16,544),objDeliriumPortal);
portal.roomTo = roomChooser;
portal.warpX = portalCoords[rr,0];
portal.warpY = portalCoords[rr,1];

//teleport
event_user(0);
//waiting 
inst = instance_create(0,0,objDeliriumSlowSpawner);
if(portal.y == 544) {
    inst.patt = 1;
}
sprite_index=sprDelirium;
//immune = true;

for(i=0;i<5;i++) {
    alarm[i] = -1;
}

scrDeliriumWarningMessage("Portal Spawned!");
//scrScreenShake(550,4,4);

alarm[6] = 550;
