class pad {
  // position vector
  PVector pos = new PVector() ;
  // initial y coordinate
  float initY ;
  // bounce variable
  boolean bnc = false ;
  // bounce easing
  float easing = 0.215 ;
  
  // constructor function
  pad(PVector p) {
    pos.x = p.x ;
    pos.y = p.y ;
    initY = p.y ;
  }
  
  // width and height
  int w = 200 ;
  int h = 40 ;

  void move() {
    // set player's x coordinate
    for(int i = 0 ; i < 2 ; i++) {
      if(yTouch[i] > height * 0.5) {
        player.pos.x = constrain(xTouch[i], w * 0.5, width - w * 0.5) ;
      }
    } 
    // set opponent's x coordinate  
    if(!ai) {
      for(int i = 0 ; i < 2 ; i++) {
        if(yTouch[i] < height * 0.5) {
          opponent.pos.x = constrain(xTouch[i], w * 0.5, width - w * 0.5) ;
        }
      }
    }
    // calculate opponent's x coordinate if it's AI
    else if(ai) {
      float tX = b.pos.x ;
      float dx = tX - opponent.pos.x ;
      float vel = dx * opponentEasing ;
      opponent.pos.x += vel ;
      opponent.pos.x = constrain(opponent.pos.x, w * 0.5, width - w * 0.5) ;
    }
  }

  void checkHit() {
    // if ball hits the player pad
    // calculate new ball velocity vector
    // bounce the player pad
    if(this == player) {
      if(b.pos.y + b.r * 0.5 + b.vel.y >= pos.y - h * 0.5 && b.pos.y + b.r * 0.5 + b.vel.y <= pos.y + h * 0.5) {
        if(b.pos.x + b.r >= pos.x - w * 0.5 && b.pos.x - b.r <= pos.x + w * 0.5) {
          float angle = map(b.pos.x, pos.x - w * 0.5, pos.x + w * 0.5, 30, 150) ;
          b.vel.x = - b.amp * cos(radians(angle)) ;
          b.vel.y = - b.amp * sin(radians(angle)) ;
          if(particles) circles.add(new circle(b.pos.x, pos.y)) ;
          bnc = true ;
        }
      }
    }
    // if ball hits the opponent pad
    // calculate new ball velocity vector
    // bounce the opponent pad
    else if(this == opponent) {
      if(b.pos.y - b.r * 0.5 + b.vel.y <= pos.y + h * 0.5 && b.pos.y - b.r * 0.5 + b.vel.y >= pos.y - h * 0.5) {
        if(b.pos.x + b.r >= pos.x - w * 0.5 && b.pos.x - b.r <= pos.x + w * 0.5) {
          float angle = map(b.pos.x, pos.x - w * 0.5,  pos.x + w * 0.5, 30, 150) ;
          b.vel.x = - b.amp * cos(radians(angle)) ;
          b.vel.y = b.amp * sin(radians(angle)) ;
          if(particles) circles.add(new circle(b.pos.x, pos.y)) ;
          bnc = true ;
        }
      }
    }
  }
  
  // boing boing
  void bounce() {
    if(bnc) {
      float currY = pos.y ;
      if(this == player) {
        float ty = initY + 12 ;
        float dy = ty - pos.y ;
        float vel = dy * easing ;
        pos.y += vel ;
      }
      else if(this == opponent) {
        float ty = initY - 12 ;
        float dy = ty - pos.y ;
        float vel = dy * easing ;
        pos.y += vel ;
      }
      if((this == player && pos.y - currY <= 0.2) || (this == opponent && currY - pos.y <= 0.2)) {
        bnc = false ;
      }
    }
    else {
      pos.y += easing * ( initY - pos.y ) ;
    }
  }

  void show() {
    // update and show the pad
    bounce() ;
    if(!gamePaused) move() ;
    checkHit() ;
    fill(230) ;
    noStroke() ;
    rectMode(CENTER) ;
    rect(pos.x, pos.y, w, h, 25) ;
  }
}