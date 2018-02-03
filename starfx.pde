class star {
  // position vector
  PVector pos = new PVector(random(width), random(height)) ;
  // velocity vector
  PVector vel = new PVector(random(-3, 3), random(-3, 3)) ;
  // radius
  float r = random(6) ;
  
  void update() {
    // if the game is playing 
    // and the dist between the ball and the star
    // is small enough
    // change the star velocity to 
    // IMPROVISE. ADAPT. OVERCOME.
    // to the ball velocity
    if(!gamePaused && particles && playGame && dist(pos.x, pos.y, b.pos.x, b.pos.y) < b.r * 1.5) {
      vel = new PVector(b.vel.x * random(0.5), b.vel.y * random(0.5)) ;
      vel.mult(random(0.7)) ;
    }
    pos.add(vel) ;
  }
  
  // check if a star hits an edge
  // reset its position
  void edges() {
    if(pos.x - r * 0.5 > width) {
      pos.x = - r * 0.5 ;
    }
    else if(pos.x + r * 0.5 < 0) {
      pos.x = width + r * 0.5 ;
    }
    if(pos.y - r * 0.5 > height) {
      pos.y = - r ;
    }
    else if(pos.y + r * 0.5 < 0) {
      pos.y = height + r * 0.5 ;
    }
  }
  
  void show() {
    // update and show the star
    update() ;
    edges() ;
    stroke(255) ;
    strokeWeight(r) ;
    point(pos.x, pos.y) ;
  }
}