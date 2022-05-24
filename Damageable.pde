public class Damageable{
  int AT;
  float hitboxX, hitboxY, xSpeed, ySpeed, x, y;
  
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
  
  boolean inside(){
    return x > displayWidth/3.36 && x < displayWidth/3.36 + displayWidth/2.46 && y > displayHeight/2.4 && y < displayHeight/2.4 + displayHeight/2.57;
          //rect(W/3.36, H/2.4, W/2.46, H/2.57);

  }
}
