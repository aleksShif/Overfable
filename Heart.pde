public class Heart {
  float x,y;  
  int xSpeed = displayWidth / 160;
  int ySpeed = displayHeight / 90; 
  boolean inv; 
  int currentHP; 
  float hitboxX, hitboxY;   
  int hitTime;
  
  public Heart(float x_, float y_) {
    inv = false;
    x = x_; 
    y = y_; 
    currentHP = 20;
    hitboxX = 10;
    hitboxY = 5;
  }
  
  float getHitboxX(){
    return hitboxX;
  }
  float getHitboxY(){
    return hitboxY;
  }
  
  void display(float x, float y, float varW, float varH) {
    if(inv && (millis() - hitTime) % 2 == 0){
      fill(255,0,0,75);
    }else{
      fill(255, 0, 0);
    }
    noStroke(); 
    beginShape (POLYGON);
    vertex (x+8*varW/16, y+4*varH/16);
    vertex (x+8*varW/16, y+3*varH/16);
    vertex (x+4*varW/16, y+3*varH/16);
    vertex (x+4*varW/16, y+4*varH/16);
    vertex (x+3*varW/16, y+4*varH/16);
    vertex (x+3*varW/16, y+5*varH/16);
    vertex (x+2*varW/16, y+5*varH/16);
    vertex (x+2*varW/16, y+9*varH/16);
    vertex (x+3*varW/16, y+9*varH/16);
    vertex (x+3*varW/16, y+10*varH/16);
    vertex (x+4*varW/16, y+10*varH/16);
    vertex (x+4*varW/16, y+11*varH/16);
    vertex (x+5*varW/16, y+11*varH/16);
    vertex (x+5*varW/16, y+12*varH/16);
    vertex (x+6*varW/16, y+12*varH/16);
    vertex (x+6*varW/16, y+13*varH/16);
    vertex (x+7*varW/16, y+13*varH/16);
    vertex (x+7*varW/16, y+14*varH/16);
    vertex (x+8*varW/16, y+14*varH/16);
    vertex (x+8*varW/16, y+15*varH/16);
    vertex (x+10*varW/16, y+15*varH/16);
    vertex (x+10*varW/16, y+14*varH/16);
    vertex (x+11*varW/16, y+14*varH/16);
    vertex (x+11*varW/16, y+13*varH/16);
    vertex (x+12*varW/16, y+13*varH/16);
    vertex (x+12*varW/16, y+12*varH/16);
    vertex (x+13*varW/16, y+12*varH/16);
    vertex (x+13*varW/16, y+11*varH/16);
    vertex (x+14*varW/16, y+11*varH/16);
    vertex (x+14*varW/16, y+10*varH/16);
    vertex (x+15*varW/16, y+10*varH/16);
    vertex (x+15*varW/16, y+9*varH/16);
    vertex (x+16*varW/16, y+9*varH/16);
    vertex (x+16*varW/16, y+5*varH/16);
    vertex (x+15*varW/16, y+5*varH/16);
    vertex (x+15*varW/16, y+4*varH/16);
    vertex (x+14*varW/16, y+4*varH/16);
    vertex (x+14*varW/16, y+3*varH/16);
    vertex (x+10*varW/16, y+3*varH/16);
    vertex (x+10*varW/16, y+4*varH/16);
    vertex (x+8*varW/16, y+4*varH/16);
    endShape (CLOSE); 
  }
  
  void move() {
    if (Up) {y -= ySpeed;}
    if (Down) {y += ySpeed;}
    if (Right) {x -= xSpeed;}
    if (Left) {x += xSpeed;}
  }
  
  void damaged(Damageable d){
    float leftEdgeH = x + hitboxX;
    float rightEdgeH = x + 2 * hitboxX;
    float lowerEdgeH = y + hitboxY;
    float upperEdgeH = y - hitboxY;
    float leftEdgeD = d.getX() - d.getHitboxX();
    float rightEdgeD = d.getX() + d.getHitboxX();
    float lowerEdgeD = d.getY() + d.getHitboxY();
    float upperEdgeD = d.getY() - d.getHitboxY();
    if (!(lowerEdgeH < upperEdgeD || lowerEdgeD < upperEdgeH || rightEdgeH < leftEdgeD || rightEdgeD < leftEdgeH) && !inv){
      currentHP -= d.getAT();
      currentHP += p.getDF();
      inv = true;
      hitTime = millis(); 
    }
  }
  
  int getHitTime(){
    return hitTime;
  }
  
  void setInv(boolean b){
    inv = b;
  }
  
  int getCurrentHP(){
    return currentHP;
  }
}
