// game stages variables
boolean playIntro = true ;
boolean playMenu = false ;
boolean playGame = false ;

boolean gamePaused = false ;

boolean goPause = false ;

void game() {
  // check if animations are to be drawn
  if(particles) {
    updateBackground(bg, bginc, 1) ;
  }
  background(bg[0], bg[1], bg[2]) ;
  drawElements() ;
  // check if particles are to be drawn
  if(particles) {
    doTheStars() ;
    doTheCircles() ;
  }
  // show the game elements
  player.show() ;
  opponent.show() ;
  b.show() ;
  if(!gamePaused && dist(mouseX, mouseY, width * 0.5, height * 0.5) < midR * 0.5) {
    //gamePaused = true ;
    goPause = true ;
    //gamePause() ;
    fill(255, 40) ;
    ellipse(width * 0.5, height * 0.5, midR, midR) ;
  }
  if(gamePaused) {
    pausedMenu() ;
  }
}

PVector ballPos ;
PVector ballVel ;
PVector playerPos ;
PVector oppPos ;

button resume ;
button quit ;

boolean goResume = false ;

boolean goQuit = false ;

boolean ballFixed = false ;

void gamePause() {
  if(sounds) pauseonfx.play() ;
  pausedMenu() ;
}

void pausedMenu() {
  fill(0, 150) ;
  rect(0, 0, displayWidth * 2, displayHeight * 2) ;
  if(!ballFixed) {
    ballVel = new PVector(b.vel.x, b.vel.y) ;
    ballFixed = true ;
  }
  b.vel.x = 0 ;
  b.vel.y = 0 ;
  
  rectMode(CENTER) ;
  resume.show() ;
  quit.show() ;
  psfx.show() ;
  pvfx.show() ;
  pbgm.show() ;
  rectMode(CORNER) ;
  strokeWeight(4) ;
  stroke(255) ;
  fill(255, 125) ;
  rect(width * 0.15, height * 0.15, width * 0.7, height * 0.7, 30) ;
  
  textSize(96) ;
  textFont(settFont) ;
  stroke(255) ;
  strokeWeight(2) ;
  fill(70, 150) ;
  text("PAUSE", width * 0.5, height * 0.25) ;
  
  if(resume.isClicked()) {
      goResume = true ;
  }
  else if(quit.isClicked()) {
      goQuit = true ;
  }
  else if(pbgm.isClicked()) {
    pbutton = 1 ;
    goPSettings = true ;
  }
  else if(psfx.isClicked()) {
    pbutton = 2 ;
    goPSettings = true ;
  }
  else if(pvfx.isClicked()) {
    pbutton = 3 ;
    goPSettings = true ;
  }
}

int pbutton ;


// check if there have been any clicks
boolean menuClick = false ;

// AI mode ( single player )
boolean ai = false ;

// settings variables
boolean particles = true ;
boolean sounds = true ;
boolean animatedbg = true ;

// poor little back button
// for about and settings
button back ;

// for mouseReleased event
// covers about and settings
boolean goOthers = false ;

void menu() {
  // display animated background if setting is active
  if(particles) {
    updateBackground(bg, bginc, 1) ;
  }
  background(bg[0], bg[1], bg[2]) ;
  // check if particle setting is active
  if(particles) {
    doTheStars() ;
  }
  // display menu if none of about or settings are active
  if(!about && !options) {
  pushMatrix() ;
  textSize(128) ;
  fill(255, 200) ;
  text("D I C I", width * 0.5, height * 0.15) ;
  textSize(80) ;
  text("p o n g", width * 0.5, height * 0.25) ;
  popMatrix() ;
  rectMode(CENTER) ;
  // show the buttons and check some stuff
  for(button bt : buttons) {
    bt.show() ;
    if((fadeOutIntroMenuAlpha <= 200 || !fadeOutIntroMenu) && !menuClick && bt.isClicked()) {
      if(bt.text == "ONE PLAYER" || bt.text == "TWO PLAYERS") {
        // go in mouseReleased
        goPlay = true ;
      }
      else if(bt.text == "SETTINGS") {
        // go in mouseReleased
        goOthers = true ;
      }
      else if(bt.text == "ABOUT") {
        // go in mouseReleased
        goOthers = true ;
      }
      menuClick = true ;
    }
  }
  // reset it to false
  if(!mousePressed) {
    menuClick = false ;
  }
  // play sfx if mouse is still over a button
  }
  // show settings / about if they are being called
  pushMatrix() ;
  options() ;
  about() ;
  popMatrix() ;
}

boolean goPlay = false ;

void mouseReleased() {
  if(goPause) {
    if(dist(mouseX, mouseY, width * 0.5, height * 0.5) < midR) {
      gamePaused = true ;
      gamePause() ;
      goPause = false ;
    }
  }
  
  goPlayReleased() ;
  goOthersReleased() ;
  goBackReleased() ;
  goResumeReleased() ;
  goQuitReleased() ;
  goPSettingsReleased() ;
  goMSettingsReleased() ;
  resetMultitouch() ;
}

boolean goBack = false ;