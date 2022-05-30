if (instance_number(objBullet) < 4)
{
    if instance_exists(objBoss) {
        if objBoss.t > 2786 {
            objBoss.dir -= 3;
        }
    }
    instance_create(x,y,objBullet);
    audio_play_sound(sndShoot,0,false);
}

