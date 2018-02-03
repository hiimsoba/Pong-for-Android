boolean fadeInMenuGame = false ;
float fadeInMenuGameAlpha = 0 ;

boolean fadeOutMenuGame = false ;
float fadeOutMenuGameAlpha = 256 ;

void MenuGameFade() {
  if(fadeInMenuGame) {
    noStroke() ;
    fill(0, fadeInMenuGameAlpha) ;
    pushMatrix() ;
    rectMode(CORNER) ;
    rect(0, 0, displayWidth * 2, displayHeight * 2) ;
    popMatrix() ;
    if(fadeInMenuGameAlpha >= 256) {
      fadeInMenuGame = false ;
      playMenu = false ;
      playGame = true ;
      fadeOutMenuGame = true ;
      fadeInMenuGameAlpha = 0 ;
    }
    fadeInMenuGameAlpha += 5 ;
  }
  else if(fadeOutMenuGame) {
    noStroke() ;
    fill(0, fadeOutMenuGameAlpha) ;
    rect(0, 0, displayWidth * 2, displayHeight * 2) ;
    if(fadeOutMenuGameAlpha <= 0) {
      fadeOutMenuGame = false ;
      fadeOutMenuGameAlpha = 256 ;
    }
  fadeOutMenuGameAlpha -= 5 ;
  }
}

boolean fadeInGameMenu = false ;
float fadeInGameMenuAlpha = 0 ;

boolean fadeOutGameMenu = false ;
float fadeOutGameMenuAlpha = 256 ;

void GameMenuFade() {
  if(fadeInGameMenu) {
    noStroke() ;
    fill(0, fadeInGameMenuAlpha) ;
    pushMatrix() ;
    rectMode(CORNER) ;
    rect(0, 0, displayWidth * 2, displayHeight * 2) ;
    popMatrix() ;
    if(fadeInGameMenuAlpha >= 256) {
      fadeInGameMenu = false ;
      playMenu = true ;
      playGame = false ;
      fadeOutGameMenu = true ;
      gamePaused = false ;
      b.reset(1) ;
      oscore = 0 ;
      pscore = 0 ;
      player.pos.x = width * 0.5 ;
      opponent.pos.x = width * 0.5 ;
      ballFixed = false ;
      fadeInGameMenuAlpha = 0 ;
    }
    fadeInGameMenuAlpha += 5 ;
  }
  else if(fadeOutGameMenu) {
    noStroke() ;
    fill(0, fadeOutGameMenuAlpha) ;
    rect(0, 0, displayWidth * 2, displayHeight * 2) ;
    if(fadeOutGameMenuAlpha <= 0) {
      fadeOutGameMenu = false ;
      fadeOutGameMenuAlpha = 256 ;
    }
  fadeOutGameMenuAlpha -= 5 ;
  }
}

boolean fadeInIntroMenu = false ;
float fadeInIntroMenuAlpha = 0 ;

boolean fadeOutIntroMenu = false ;
float fadeOutIntroMenuAlpha = 256 ;

void IntroMenuFade() {
  if(fadeInIntroMenu) {
    noStroke() ;
    fill(0, fadeInIntroMenuAlpha) ;
    pushMatrix() ;
    rectMode(CORNER) ;
    rect(0, 0, displayWidth * 2, displayHeight * 2) ;
    popMatrix() ;
    if(fadeInIntroMenuAlpha >= 256) {
      fadeInIntroMenu = false ;
      playMenu = true ;
      playIntro = false ;
      fadeOutIntroMenu = true ;
      fadeInIntroMenuAlpha = 0 ;
    }
    fadeInIntroMenuAlpha += 5 ;
  }
  else if(fadeOutIntroMenu) {
    noStroke() ;
    fill(0, fadeOutIntroMenuAlpha) ;
    rect(0, 0, displayWidth * 2, displayHeight * 2) ;
    if(fadeOutIntroMenuAlpha <= 0) {
      fadeOutIntroMenu = false ;
      fadeOutIntroMenuAlpha = 256 ;
    }
  fadeOutIntroMenuAlpha -= 5 ;
  }
}