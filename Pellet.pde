public class Pellet extends Damageable{
  float size;
  boolean isAt1 = false; 
  
  Pellet(int at, float X, float Y, float Size){
    size = Size;
    setX(X);
    setY(Y);
    setAT(at);
  }
  
  Pellet(boolean _isAt1, int at, float X, float Y){
    isAt1 = _isAt1; 
    size = 1;
    setX(X);
    setY(Y);
    setAT(at);
  }
  
  void display(){
    if (isAt1) {
      fill(255);
      noStroke();
      float x_ = getX();
      float y_ = getY(); 
      triangle(x_, y_, x_, y_+20, x_+20, y_+10); 
      triangle(x_+20, y_+10, x_+10, y_+30, x_+30, y_+30); 
      triangle(x_+20, y_+10, x_+40, y_+20, x_+40, y_); 
    }
    else {
      fill(255);
      ellipseMode(RADIUS);
      ellipse(getX(),getY(), size * displayWidth/150, size * displayWidth/90);
    }
  }
  
  //void move(float X, float Y){
  //  setX(x+X);
  //  setY(y+Y);
  //  rotate(PI/12);
  //}

}
