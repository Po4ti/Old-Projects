///restarts the game
global.curTime = 0;
if (surface_exists(global.pauseSurf))
    surface_free(global.pauseSurf);  //free pause surface in case the game is currently paused
game_restart();
