public class Damageable{
  int AT;
  float hitbox, xSpeed, ySpeed, x, y;
  
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
  
  void display(){
    int W = displayWidth; 
    int H = displayHeight; 
    fill(255);
    ellipseMode(RADIUS); 
    ellipse(x, y, W/75, W/75); 
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
}
