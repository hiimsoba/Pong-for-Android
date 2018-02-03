
// first text
String text = "DiciPong" ;
// second text
String text2 = "touch to begin!" ;

// font size. 
int fontSize = 0 ;

// upper bound
int upr = 230 ;

// lower bound
int lwr = 170 ;

// increase fontsize
// if up is true, decrease otherwise
boolean up = true ;

// alpha of the second text
int touchAlpha = 0 ;

// allow to touch if touchAlpha is reaching
// a certain value
boolean touched = false ;

void intro() {
  // black background
  background(0) ; 
  
  // setup for the first font
  textSize(fontSize) ;
  textFont(myFont) ;
  fill(0, 255, 200) ;
  text(text, width * 0.5, height * 0.45) ;
  
  // increase alpha
  if(touched) {
    touchAlpha += 2 ;
  }
  
  // setup for the second text
  fill(255, touchAlpha) ;
  textSize(82) ;
  text(text2, width * 0.5, height * 0.6) ;
  
  // check boundaries
  if(fontSize == upr) {
    up = false ;
  }
  else if(fontSize == lwr) {
    up = true ;
  }
  if(!touched && fontSize >= lwr * 0.65) {
    touched = true ;
  }
  if(up) {
    fontSize++ ;
  }
  else {
    fontSize-- ;
  } 
  // fade if conditions are met
  if(mousePressed && touched) {
    fadeInIntroMenu = true ;
  }
}