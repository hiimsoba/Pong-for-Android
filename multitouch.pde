// multitouch module

import android.view.MotionEvent ; 

float xTouch[] ; 
float yTouch[] ; 

public boolean surfaceTouchEvent(MotionEvent event) { 
  int TouchEvents = event.getPointerCount() ;
  for (int i = 0 ; i < TouchEvents ; i++) { 
    int pointerId = event.getPointerId(i) ; 
    xTouch[pointerId] = event.getX(i) ; 
    yTouch[pointerId] = event.getY(i) ; 
  }
  return super.surfaceTouchEvent(event) ; 
}