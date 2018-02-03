class button {
 // position vector
 PVector pos = new PVector() ;
 // active alpha
 float onAlpha = 50 ;
 // inactive alpha
 float offAlpha = 150 ;
 // text to be shown
 String text ;
 
 // width and height
 float w = 360 ;
 float h = 80 ;
 
 // constructor
 button(float x, float y, String txt) {
  pos.x = x ;
  pos.y = y ;
  text = txt ;
 }
 
 // check if mouse is over the button
 boolean isOver(float x, float y) {
  return (
    x > pos.x - w * 0.5 &&
    x < pos.x + w * 0.5 &&
    y > pos.y - h * 0.5 &&
    y < pos.y + h * 0.5 ) ;
 }

 // check if button is being clicked
 boolean isClicked() {
  return (
    mousePressed && 
    isOver(mouseX, mouseY)
    ) ;
 }
  
 // update
 void update() {
   if(isOver(mouseX, mouseY)) {
     fill(235, onAlpha) ;
   }
   else {
     fill(235, offAlpha) ;
   }
 }
 
 // update and show button
 void show() {
   update() ;
   strokeWeight(4) ;
   stroke(255) ;
   textFont(settFont) ;
   rect(pos.x, pos.y, w, h, 50) ;
   fill(255) ;
   textSize(38) ;
   pushMatrix() ;
   rectMode(CENTER) ;
   textAlign(CENTER, CENTER) ;
   text(text, pos.x, pos.y) ;
   popMatrix() ;
 }
}