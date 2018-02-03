boolean paused = false ;
boolean bgm = true ;

void draw() {
  // play whichever stage is currently active
  if(playIntro) intro() ;
  else if(playMenu) menu() ;
  else if(playGame) game() ;
  // fade between stages, if called
  IntroMenuFade() ;
  MenuGameFade() ;
  GameMenuFade() ;
  // stop the bg sound if "bgm" is false
  if(!bgm && !paused) {
    gamebg.stop() ;
    paused = true ;
  }
  // play the bg sound if bgm is true and the bg has been paused previously
  else if(bgm && paused) {
    gamebg = new SoundFile(this, "bg_game.mp3") ;
    gamebg.loop() ;
    paused = false ;
  }
}