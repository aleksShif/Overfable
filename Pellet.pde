public class Pellet extends Damageable{
  String side; 
  float size;
  boolean isAt1 = false; 
  int immobileTime = 0; 
  int xSpeed, ySpeed; 
  
  Pellet(int at, float X, float Y, float Size){
    size = Size;
    setX(X);
    setY(Y);
    setAT(at);
    setHitboxX(displayWidth/150);
    setHitboxY(displayWidth/90);
  }
  
  Pellet(boolean _isAt1, int at, float X, float Y){
    isAt1 = _isAt1; 
    size = 1;
    setX(X);
    setY(Y);
    setAT(at); 
    xSpeed = 0; 
    ySpeed = 0; 
  }
  
  void display(){
    int W = displayWidth; 
    int H = displayHeight; 
    if (isAt1) {
      fill(255);
      noStroke();
      float x_ = getX();
      float y_ = getY(); 
      triangle(x_, y_, x_, y_+H/90, x_+W/160, y_+H/180); 
      triangle(x_+W/160, y_+H/180, x_+W/320, y_+H/60, x_+W/106.667, y_+H/60); 
      triangle(x_+W/160, y_+H/180, x_+W/80, y_+H/90, x_+W/80, y_); 
    }
    else {
      fill(255);
      ellipseMode(RADIUS);
      ellipse(getX(),getY(), size * displayWidth/150, size * displayWidth/90);
    }
  }
  
  void setSide(String s) {
    side = s; 
  }
  
  String getSide() {
    return side; 
  }
  //void move(float X, float Y){
  //  setX(x+X);
  //  setY(y+Y);
  //  rotate(PI/12);
  //}

}
