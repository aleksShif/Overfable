public class Damageable{
  int AT;
  float hitbox, xSpeed, ySpeed, x, y;
  
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
  float getHitbox(){
    return hitbox;
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
}
