import cassette.audiofiles.* ;

// game elements declarations

pad player ;
pad opponent ;
ball b ;

// easing of the AI player ( single player mode )

float opponentEasing = 0.06 ;

// font resources declarations

PFont settFont ;
PFont menuTitle ;
PFont myFont ; // btw, best name for a variable

// sound resources declarations

SoundFile gamebg ;
SoundFile buttonfx ;
SoundFile pauseofffx ;
SoundFile pauseonfx ;

// particles declarations

ArrayList<circle> circles ;
ArrayList<star> stars ;
int starCount = 100 ;

// button arraylist declaration

ArrayList<button> buttons ;

// background arrays declaring

int[] bg ;
boolean[] bginc ;

// score variables declaring & initializing

int pscore = 0 ;
int oscore = 0 ;

void setup() {
  // canvas size
  size(displayWidth, displayHeight) ;
  
  // screen orientation
  orientation(PORTRAIT) ;
  
  // initializing players' pads
  player = new pad(new PVector(width * 0.5, height * 0.9)) ;
  opponent = new pad(new PVector(width * 0.5, height * 0.1)) ;
  
  // initializing ball
  b = new ball() ;
  
  // initializing button arraylist
  buttons = new ArrayList<button> () ;
  
  // initializing button arraylist elements
  buttons.add(new button(width * 0.5, height * 0.4, "ONE PLAYER")) ;
  buttons.add(new button(width * 0.5, height * 0.55, "TWO PLAYERS")) ;
  buttons.add(new button(width * 0.5, height * 0.70, "SETTINGS")) ;
  buttons.add(new button(width * 0.5, height * 0.85, "ABOUT")) ;
  
  // initializing star particles arraylist
  stars = new ArrayList<star> () ;
  
  // initializing star particles arraylist elements
  for(int i = 0 ; i < starCount ; i++) {
    stars.add(new star()) ;
  }
  
  // initializing circle particles arraylist
  circles = new ArrayList<circle> () ;
  
  // initializing background arrays ( value, increment )
  bg = new int[3] ;
  bginc = new boolean[3] ;
  
  // setting up background arrays elements
  for(int i = 1 ; i < 4 ; i++) {
    bg[i - 1] = 50 * i ;
    if(random(1) < 0.5) {
      bginc[i - 1] = true ;
    }
    else {
      bginc[i - 1] = false ;
    }
  }
  
   // initializing multitouch x, y arrays
   xTouch = new float [5]; 
   yTouch = new float [5];
   
   // setting initial value of multitouch array elements
   xTouch[0] = width * 0.5 ;
   xTouch[1] = width * 0.5 ;
   yTouch[0] = height * 0.5 ;
   yTouch[1] = height * 0.5 ;
   
  // loading soundfiles
  gamebg = new SoundFile(this, "bg_game.mp3") ;
  buttonfx = new SoundFile(this, "button1.mp3") ;
  pauseonfx = new SoundFile(this, "pause_on.mp3") ;
  pauseofffx = new SoundFile(this, "pause_off.mp3") ;

  // play game background sound
  gamebg.loop() ;

  // initializing about and settings button
  // updating back button alpha
  back = new button(width * 0.5, height * 0.875, "BACK") ;
  back.onAlpha = 30 ;
  back.offAlpha = 100 ;
  
  // initializing resume button
  // updating resume button alpha
  resume = new button(width * 0.5, height * 0.75, "RESUME") ;
  resume.onAlpha = 30 ;
  resume.offAlpha = 100 ;
  
  // initializing quit button
  // updating quit button alpha
  quit = new button(width * 0.5, height * 0.65, "MENU") ;
  quit.onAlpha = 30 ;
  quit.offAlpha = 100 ;
 
  psfx = new button(width * 0.5, height * 0.45, "SOUND FX : ON") ;
  psfx.onAlpha = 30 ;
  psfx.offAlpha = 100 ;
  
  pbgm = new button(width * 0.5, height * 0.35, "BG MUSIC : ON") ;
  pbgm.onAlpha = 30 ;
  pbgm.offAlpha = 100 ;
  
  pvfx = new button(width * 0.5, height * 0.55, "VISUAL FX : ON") ;
  pvfx.onAlpha = 30 ;
  pvfx.offAlpha = 100 ;
  
  msfx = new button(width * 0.5, height * 0.5, "SOUND FX : ON") ;
  msfx.onAlpha = 30 ;
  msfx.offAlpha = 100 ;
  msfx.w = 440 ;
  
  mbgm = new button(width * 0.5, height * 0.3, "BG MUSIC : ON") ;
  mbgm.onAlpha = 30 ;
  mbgm.offAlpha = 100 ;
  mbgm.w = 440 ;
  
  mvfx = new button(width * 0.5, height * 0.7, "VISUAL FX : ON") ;
  mvfx.onAlpha = 30 ;
  mvfx.offAlpha = 100 ;
  mvfx.w = 440 ;
  
  // loading fonts
  myFont = createFont("Gasalt-Thin.ttf", 16) ;
  settFont = createFont("SF Atarian System Extended Bold.ttf", 16) ;
  menuTitle = createFont("bit9x9.ttf", 16) ;
  
  // setting up initial state of fonts
  textFont(myFont) ;
  textAlign(CENTER) ;
}