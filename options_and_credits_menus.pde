
void options() {
  if(options) {
    rectMode(CENTER) ;
    back.show() ;
    msfx.show() ;
    mvfx.show() ;
    mbgm.show() ;
    strokeWeight(4) ;
    stroke(255) ;
    fill(255, 125) ;
    pushMatrix() ;
    rectMode(CORNER) ;
    rect(width * 0.1, height * 0.05, width - width * 0.2, height - height * 0.1, 30) ;
    popMatrix() ;
    textSize(96) ;
    textFont(settFont) ;
    stroke(255) ;
    strokeWeight(2) ;
    fill(100, 150) ;
    text("SETTINGS", width * 0.5, height * 0.15) ;
    if(back.isClicked()) {
      goBack = true ;
      isOptions = false ;
    }
    else if(mbgm.isClicked()) {
    mbutton = 1 ;
    goMSettings = true ;
  }
  else if(msfx.isClicked()) {
    mbutton = 2 ;
    goMSettings = true ;
  }
  else if(mvfx.isClicked()) {
    mbutton = 3 ;
    goMSettings = true ;
  }
  }
}

boolean isOptions = false ;
boolean options = false ;

int mbutton ;

void about() {
  if(about) {
    rectMode(CENTER) ;
    back.show() ;
    strokeWeight(4) ;
    stroke(255) ;
    fill(255, 125) ;
    pushMatrix() ;
    rectMode(CORNER) ;
    rect(width * 0.1, height * 0.05, width - width * 0.2, height - height * 0.1, 30) ;
    popMatrix() ;
    textSize(96) ;
    textFont(settFont) ;
    stroke(255) ;
    strokeWeight(2) ;
    fill(100, 150) ;
    text("ABOUT", width * 0.5, height * 0.15) ;
    
    // and now the content!! 
     
    // name list
    
    showTitle(width * 0.5, height * 0.25, "DEVELOPED BY", 52) ;
    showName(width * 0.5, height * 0.325, "Alexandru Dicianu", 64) ;
    showTitle(width * 0.5, height * 0.4, "MUSIC AND SFX", 52) ;
    showName(width * 0.5, height * 0.475, "Dragos Mihai", 64) ;
    showTitle(width * 0.5, height * 0.55, "TESTERS & SUPPORT", 52) ;
    showName(width * 0.5, height * 0.61, "Lavinia Lipan", 64) ;
    showName(width * 0.5, height * 0.665, "Dragos Iamandi", 64) ;
    showTitle(width * 0.5, height * 0.74, "CONTACT", 52) ;
    showName(width * 0.5, height * 0.8, "alexx.dropbox@gmail.com", 58) ;
 
    // end of content 
    
    if(back.isClicked()) {
      goBack = true ;
      isAbout = false ;
    }
  }
}

boolean about = false ;
boolean isAbout = false ;

button psfx ;
button pbgm ;
button pvfx ;

boolean goPSettings = false ;

void goPSettingsReleased() {
  if(goPSettings) {
    if(psfx.isOver(mouseX, mouseY) || pbgm.isOver(mouseX, mouseY) || pvfx.isOver(mouseX, mouseY)) {
      if(sounds) pauseofffx.play() ;
      switch(pbutton) {
        case 1 : bgm = !bgm ; if(bgm) pbgm.text = "BG MUSIC : ON" ; else pbgm.text = "BG MUSIC : OFF" ; break ; 
        case 2 : sounds = !sounds ; if(sounds) psfx.text = "SOUND FX : ON" ; else psfx.text = "SOUND FX : OFF" ; break ; 
        case 3 : particles = !particles ; if(particles) pvfx.text = "VISUAL FX : ON" ; else pvfx.text = "VISUAL FX : OFF" ; break ; 
      }
    }
  }
  goPSettings = false ;
}

button msfx ;
button mbgm ;
button mvfx ;

boolean goMSettings = false ;

void goMSettingsReleased() {
  if(goMSettings) {
    if(msfx.isOver(mouseX, mouseY) || mbgm.isOver(mouseX, mouseY) || mvfx.isOver(mouseX, mouseY)) {
      if(sounds) pauseofffx.play() ;
      switch(mbutton) {
        case 1 : bgm = !bgm ; if(bgm) mbgm.text = "BG MUSIC : ON" ; else mbgm.text = "BG MUSIC : OFF" ; break ; 
        case 2 : sounds = !sounds ; if(sounds) msfx.text = "SOUND FX : ON" ; else msfx.text = "SOUND FX : OFF" ; break ; 
        case 3 : particles = !particles ; if(particles) mvfx.text = "VISUAL FX : ON" ; else mvfx.text = "VISUAL FX : OFF" ; break ; 
      }
    }
  }
  goMSettings = false ;
}