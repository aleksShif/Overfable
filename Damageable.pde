public class Damageable{
  int AT;
  float hitboxX, hitboxY, x, y;
  float xSpeed = 0;
  float ySpeed = 0;
  String filename; 
  
  public Damageable(){
    AT = 3;
  }
  
  public Damageable(int at, float X, float Y){
    AT = at;
    x = X;
    y = Y;
  }
  
  int getAT(){
    return AT;
  }
  void setAT(int at){
    AT = at;
  }
  float getHitboxX(){
    return hitboxX;
  }
  
  void setHitboxX(float hb){
    hitboxX = hb;
  }
  float getHitboxY(){
    return hitboxY;
  }
  
  void setHitboxY(float hb){
    hitboxY = hb;
  }
  
  void move(float X, float Y){
    x += X;
    y += Y;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  void setX(float X){
    x = X;
  }
  void setY(float Y){
    y = Y;
  }
  void setXSpeed(float x_) {
    xSpeed = x_;
  }
  void setYSpeed(float y_) {
    ySpeed = y_; 
  }

  boolean inside() {
    return (x > ourDisplayX/3.36 && x < ourDisplayX/3.36 + ourDisplayX/2.46 && y > ourDisplayY/2.4 && y < ourDisplayY/2.4 + ourDisplayY/2.57);
  }

  void inside(int filler){
    if (x <= ourDisplayX/3.36 || x >= ourDisplayX/3.36 + ourDisplayX/2.46 || y <= ourDisplayY/2.4 || y >= ourDisplayY/2.4 + ourDisplayY/2.57) {
     if (x <= ourDisplayX/3.36) {
       xSpeed *= -1;   
     }
     if (x >= ourDisplayX/3.36 + ourDisplayX/2.46) {
       xSpeed *= -1;   
     }
     if (y <= ourDisplayY/2.4) {
       ySpeed *= -1;
     }
     if (y >= ourDisplayY/2.4 + ourDisplayY/2.57) {
       ySpeed *= -1;
     }
    }         //rect(W/3.36, H/2.4, W/2.46, H/2.57);
  }
}
