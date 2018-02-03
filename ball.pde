class ball {
  // position vector
  PVector pos = new PVector(width * 0.5, height * 0.5) ;
  // radius
  float r = 18 ;
  // current amplitude
  float amp = 15 ;
  // initial amplitude
  float initAmp = 15 ;
  // max amplitude
  float maxAmp = 38 ;
  // velocity vector
  PVector vel = new PVector(0, amp) ;

  void update() {
    // raise the current amp
    // in other words, accelerate the ball
    if(!gamePaused) amp *= 1.000175 ;
    // calculate the AI easing based on the current amp
    if(ai) opponentEasing = map(amp, initAmp, maxAmp, 0.06, 0.08) ;
    // limit the max amp to avoid gameplay issues
    vel.limit(maxAmp) ;
    // add the velocity to the current position
    pos.add(vel) ;
    // check if any edge has been hit
    checkEdges() ;
  }

  void reset(int k) {
    // reset the amp, the position and the velocity
    // "k" is -1 or 1, depending on the last point scored
    amp = initAmp ;
    pos = new PVector(width * 0.5, height * 0.5) ;
    vel = new PVector(0, k * amp) ;
  }

  void checkEdges() {
    // if the ball's current position
    // is beyond the left edge
    if(pos.x <= r * 0.5 - vel.x) {
      // change the x direction
      vel.x *= -1 ;
      // add a circle particle
      if(particles) circles.add(new circle(0, pos.y)) ;
    }
    // if the ball's current position
    // is beyond the right edge
    else if(pos.x >= width - r * 0.5 - vel.x) {
      // change the x direction
      vel.x *= -1 ;
      // add a circle particle
      if(particles) circles.add(new circle(width, pos.y)) ;
    }
    // if ball is beyond the upper edge
    else if(pos.y <= 0 - r * 0.5) {
       // increment the player's score
       pscore++ ;
       // reset ball with inversed y velocity
       reset(-1) ;
    }
    // if ball is beyond the lower edge
    else if(pos.y >= height + r * 0.5) {
       // increment the opponent's score
       oscore++ ;
       // reset ball 
       reset(1) ;
     }
  }

  void show() {
    // update and show the ball
    update() ;
    fill(255) ;
    ellipse(pos.x, pos.y, r * 2, r * 2) ;
  }
}