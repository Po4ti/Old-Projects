//kills the player

if (instance_exists(objPlayerSTG) && (!global.noDeath && !global.debugNoDeath))
{
    instance_create(x,y,objDeathEffectSTG);
    if(global.STGlives > 0) {
        global.STGlives--;
        audio_play_sound(sndDeathSTG,0,0);
        with (objPlayerSTG)
        {
            instance_destroy();
        }
        instance_create(400,640,objPlayerSTGStart);
        instance_create(0,0,objSTGBulletKiller);
    }
    else {
        global.deathSound = audio_play_sound(sndDeath,0,false);
        
        if (!global.muteMusic)  //play death music
        {
            if (global.deathMusicMode == 1) //instantly pause the current music
            {
                audio_pause_sound(global.currentMusic);
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
            else if (global.deathMusicMode == 2)    //fade out the current music
            {                
                with (objWorld)
                    event_user(0);  //fades out and stops the current music
                
                global.gameOverMusic = audio_play_sound(musOnDeath,1,false);
            }
        }
        
        with (objPlayerSTG)
        {
            instance_create(x,y,objBloodEmitter);
            instance_destroy();
        }
        
        instance_create(0,0,objGameOver);
        
        global.death += 1; //increment deaths
        scrSaveGame(false); //save death/time
    }
}
