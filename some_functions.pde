// show and update circle particles
void doTheCircles() {
  ArrayList<circle> removedCircles = new ArrayList<circle> () ;
  for(circle c : circles) {
    c.update() ;
    c.show() ;
    if(c.toRemove()) {
      removedCircles.add(c) ;
    }
  }
  circles.removeAll(removedCircles) ;
}

// show and update star particles
void doTheStars() {
  for(star s : stars) {
    s.show() ; 
  }
}

// radius of the in-game pause button
float midR = 100 ;

// draw style in-game elements
void drawElements() { 
  noFill() ;
  
  strokeWeight(12) ;
  stroke(220, 180) ;
  
  // middle lines
  line(0, height * 0.5, width * 0.5 - midR / 2, height * 0.5) ;
  line(width * 0.5 + midR / 2, height * 0.5, width, height * 0.5) ;
  
  // pause button style elements
  
  // ellipse 
  ellipse(width * 0.5, height * 0.5, midR, midR) ;
  
  // pause lines
  line(width * 0.5 - midR * 0.15, height * 0.5 - midR * 0.15, width * 0.5 - midR * 0.15, height * 0.5 + midR * 0.15) ;
  line(width * 0.5 + midR * 0.15, height * 0.5 - midR * 0.15, width * 0.5 + midR * 0.15, height * 0.5 + midR * 0.15) ;
  // pause lines
  
  pushMatrix() ;
  // draw the score
  textAlign(CENTER) ;
  textSize(48) ;
  textFont(settFont) ;
  fill(255, 200) ;
  text(pscore, width * 0.94, height * 0.55) ;
  text(oscore, width * 0.06, height * 0.475) ;
  popMatrix() ;
  
  strokeWeight(14) ;
  //top
  line(0, 0, width, 0) ;
  //bottom
  line(0, height, width, height) ;
  //left
  line(0, 0, 0, height) ;
  //right
  line(width, 0, width, height) ;
}

// make sure sound stops if app is being closed
// ONLY BY BACK BUTTON
void keyPressed() {
  if(key == CODED){
   if(keyCode == MENU || keyCode == BACK) {
     gamebg.stop();
   }
  }  
}

// update the background
void updateBackground(int[] v, boolean[] vinc, int val) {
  for(int i = 0 ; i < 3 ; i++) {
    if(v[i] == 20 || v[i] == 190) {
      vinc[i] = !vinc[i] ;
    }
    if(vinc[i]) {
      v[i] += val ;
    }
    else {
      v[i] -= val ;
    }
  }
}

void goPlayReleased() {
  if(goPlay) {
    for(button bt : buttons) {
      if(bt.isOver(mouseX, mouseY)) {
        fadeInMenuGame = true ;
        if(sounds) buttonfx.play() ;
        if(bt.text == "TWO PLAYERS") {
          ai = false ;
        }
        else if(bt.text == "ONE PLAYER") {
          ai = true ;
        }
      }
    }
  }
  goPlay = false ;
}

void goOthersReleased() {
  if(goOthers) {
    for(button bt : buttons) {
      if(bt.isOver(mouseX, mouseY)) {
        if(sounds) buttonfx.play() ;
        if(bt.text == "SETTINGS") {
          options = true ;
        }
        else if(bt.text == "ABOUT") {
          about = true ;
        }
      }
    }
  }
  goOthers = false ;
}

void goBackReleased() {
  if(goBack) {
    if(back.isOver(mouseX, mouseY)) {
      if(sounds) buttonfx.play() ;
      if(!isOptions) {
        options = false ;
        isOptions = true ;
      }
      if(!isAbout) {
        about = false ;
        isAbout = true ;
      }
    }
  }
  goBack = false ;
}

void goResumeReleased() {
  if(goResume) {
    if(resume.isOver(mouseX, mouseY)) {
      if(sounds) pauseofffx.play() ;
      b.vel.x = ballVel.x ;
      b.vel.y = ballVel.y ;
      gamePaused = false ;
      ballFixed = false ;
    }
  }
  goResume = false ;
}

void goQuitReleased() {
  if(goQuit) {
    if(quit.isOver(mouseX, mouseY)) {
      if(sounds) pauseofffx.play() ;
      fadeInGameMenu = true ;
    }
  }
  goQuit = false ;
}

void resetMultitouch() {
  for(int i = 0 ; i < 2 ; i++) 
  {
    yTouch[i] = height / 2 ;
  }
  mouseX = 0 ;
  mouseY = 0 ;
}

void showTitle(float x, float y, String text, float size) {
  textFont(settFont) ;
  textSize(size) ;
  fill(50, 150) ;
  textAlign(CENTER) ;
  text(text, x, y) ;
}

void showName(float x, float y, String text, float size) {
  textFont(myFont) ;
  textSize(size) ;
  fill(0) ;
  text(text, x, y) ;
}