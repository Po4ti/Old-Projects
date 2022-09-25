///gets which song is supposed to be playing for the current room and plays it

var roomSong;

switch (room)                       //determines which song to play
{
    case rTitle:                    //add rooms here, if you have several rooms that play the same song they can be put together
    case rMenu:
    case rOptions:
    case rDifficultySelect:             
        roomSong = musTitle;
        break;         
    case rStage01:
        roomSong = musSelect;
        break;
    case rStage02:
        roomSong = musAnticipation;
        break;
    case rRationality:
        roomSong = musGuyRock;
        break;
    case rDestination:
    case rCrimson:
    case rNue:
    case rPronin:
    case rPronin1:
    case rPronin2:
    case rPronin3:
    case rPronin4:
    case rBattleCats:
    case rBattleCatsIntro:        
        roomSong = -2;
        break;
        
    case rEnd:
        roomSong = musEnd;
        break;
        
    default:                        //default option in case the room does not have a song set
        roomSong = -1;
        break;
}

if (roomSong != -2) {
    scrPlayMusic(roomSong,true); //play the song for the current room
}
