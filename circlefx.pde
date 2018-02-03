class circle { 
  // position vector
  PVector pos ;
  // alpha
  int alpha = 255 ;
  // radius
  float r = 0 ;
  // radius incrementing rate
  float incR = random(3, 5) ;
  // alpha decrementing rate
  float decA = random(4, 12) ;
  
  // constructor
  circle(float x, float y) {
    pos = new PVector(x, y) ;
  }
  
  // remove if circle ain't showing anymore
  boolean toRemove() {
    return alpha < 0 ;
  }
  
  // increment current radius
  // decrement current alpha
  void update() {
    r += incR ;
    alpha -= decA ;
  }
  
  void show() {
    // show the circle
    noFill() ;
    strokeWeight(3) ;
    stroke(255, alpha) ;
    ellipse(pos.x, pos.y, r * 2, r * 2) ;
  }
}