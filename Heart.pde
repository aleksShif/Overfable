public class Heart {
  float x,y;  
  int xSpeed = ourDisplayX / 160;
  int ySpeed = ourDisplayY / 90; 
  boolean inv; 
  boolean dead;
  int currentHP; 
  float hitboxX, hitboxY;   
  int hitTime;
  int combatFlash = 10; 
  final int NORM = 0;
  final int TRAP = 1;
  final int SHOOT = 2;
  final int GRAVITY = 3;
  int mode = NORM;
  
  public Heart(float x_, float y_) {
    dead = false; 
    inv = false;
    x = x_; 
    y = y_; 
    currentHP = 20;
    hitboxX = 10;
    hitboxY = 5;
  }
  public Heart() {
    dead = false; 
    inv = false;
    currentHP = getCurrentHP();
    hitboxX = 10;
    hitboxY = 5;
  }
  
  float getHitboxX(){
    return hitboxX;
  }
  float getHitboxY(){
    return hitboxY;
  }
  
  void display(float x, float y, float varW, float varH, int Mode) {
    if(inv && (millis() - hitTime) % 2 == 0){
      if(Mode == 0){
        fill(255,0,0,75);
      }
      else if(Mode == 1){
        fill(237, 245, 7);
      }
    }
    else if(p.preCombat && h.combatFlash > 0) {
      if(Mode == 0){
        fill(255,0,0,75);
      }      
      else if(Mode == 1){
        fill(237, 245, 7);
      }
      combatFlash -= 1; 
    }else{
      if(Mode == 0){
        fill(255, 0, 0);
      }
      else if(Mode == 1){
        fill(237, 245, 7);
      }
    }
    noStroke();
    if (dead && !inv) {
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
      vertex (x+9*varW/16, y+13*varH/16);  
      vertex (x+8*varW/16, y+11*varH/16);  
      vertex (x+10*varW/16, y+9*varH/16);  
      vertex (x+8*varW/16, y+7*varH/16);  
      vertex (x+9*varW/16, y+5*varH/16);  
      endShape (CLOSE); 
      
      beginShape (POLYGON); 
      vertex (x+12*varW/16, y+5*varH/16); 
      vertex (x+11*varW/16, y+7*varH/16); 
      vertex (x+12*varW/16, y+9*varH/16); 
      vertex (x+10*varW/16, y+11*varH/16); 
      vertex (x+12*varW/16, y+13*varH/16); 
      vertex (x+11*varW/16, y+15*varH/16); 
      vertex (x+15*varW/16, y+12*varH/16); 
      vertex (x+15*varW/16, y+11*varH/16); 
      vertex (x+16*varW/16, y+11*varH/16); 
      vertex (x+16*varW/16, y+10*varH/16); 
      vertex (x+17*varW/16, y+10*varH/16); 
      vertex (x+17*varW/16, y+9*varH/16); 
      vertex (x+18*varW/16, y+9*varH/16); 
      vertex (x+18*varW/16, y+5*varH/16); 
      vertex (x+17*varW/16, y+5*varH/16); 
      vertex (x+17*varW/16, y+4*varH/16); 
      vertex (x+16*varW/16, y+4*varH/16); 
      vertex (x+16*varW/16, y+3*varH/16); 
      vertex (x+12*varW/16, y+3*varH/16); 
      vertex (x+12*varW/16, y+4*varH/16); 
      vertex (x+10*varW/16, y+4*varH/16); 
      endShape (CLOSE); 
    }
    else {
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
  }
  
  void move() {
    if(COMBAT && which == 2){
      if (!t.getHeartIM()) {
        if (Up) {y -= ySpeed;}
        if (Down) {y += ySpeed;}
        if (Right) {x -= xSpeed;}
        if (Left) {x += xSpeed;}
      }
    }
    else{
      if (Up) {y -= ySpeed;}
      if (Down) {y += ySpeed;}
      if (Right) {x -= xSpeed;}
      if (Left) {x += xSpeed;}
    } 
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
    //if (d.filename != null) {
    //  topLeft = d.getY() ; 
    //  lowerLeft = d.getY() + d.getHitboxY();
    //  topRight = d.getY();
    //}
    

    if(COMBAT && which == 2){
      if (t.getFile().equals("bigGlass.png")) {
        if ((lowerEdgeH < upperEdgeD || lowerEdgeD < upperEdgeH || rightEdgeH < leftEdgeD || rightEdgeD < leftEdgeH) && !inv){
          currentHP -= d.getAT();
          currentHP += p.getDF();
          inv = true;
          hitTime = millis(); 
        }
      }
      else {
        if (!(lowerEdgeH < upperEdgeD || lowerEdgeD < upperEdgeH || rightEdgeH < leftEdgeD || rightEdgeD < leftEdgeH) && !inv){
          currentHP -= d.getAT();
          currentHP += p.getDF();
          inv = true;
          hitTime = millis(); 
        }
      }
    }
    else if(COMBAT && which == 3 && !j.at2){
      leftEdgeD = d.getX();
      rightEdgeD = d.getX() + 2 * d.getHitboxX();
      lowerEdgeD = d.getY() + 2 * d.getHitboxY();
      upperEdgeD = d.getY();
      if (!(lowerEdgeH < upperEdgeD || lowerEdgeD < upperEdgeH || rightEdgeH < leftEdgeD || rightEdgeD < leftEdgeH) && !inv){
        currentHP -= d.getAT();
        currentHP += p.getDF();
        inv = true;
        hitTime = millis(); 
      }
      lowerEdgeH = h.y + h.hitboxY;
      upperEdgeD = j.sharkFin.y+ 2*j.sharkFin.hitboxY + ourDisplayY/200;
      if (!(lowerEdgeH < upperEdgeD) && !inv){
        currentHP -= j.getSharkFin().getAT() - 3;
        currentHP += p.getDF();
        inv = true;
        hitTime = millis(); 
      }
    }
    else if(COMBAT && which == 3 && j.at2){
      leftEdgeD = j.rectX + 470;
      rightEdgeD = j.rectX + 530;
      lowerEdgeD = j.rectY +250;
      upperEdgeD = j.rectY;
      if (!(lowerEdgeH < upperEdgeD || lowerEdgeD < upperEdgeH || rightEdgeH < leftEdgeD || rightEdgeD < leftEdgeH) && !inv){
        currentHP -= d.getAT();
        currentHP += p.getDF();
        inv = true;
        hitTime = millis(); 
      }
    }
    else {
      if (!(lowerEdgeH < upperEdgeD || lowerEdgeD < upperEdgeH || rightEdgeH < leftEdgeD || rightEdgeD < leftEdgeH) && !inv){
        currentHP -= d.getAT();
        currentHP += p.getDF();
        inv = true;
        hitTime = millis(); 
      }
    }
    strokeWeight(5);
    stroke(255);
    noFill();
    rect(leftEdgeD, upperEdgeD, rightEdgeD - leftEdgeD, lowerEdgeD - upperEdgeD);
  }
  
  
  void damaged(Damageable d, float leftEdgeD, float rightEdgeD, float lowerEdgeD, float upperEdgeD){
    float leftEdgeH = x + hitboxX;
    float rightEdgeH = x + 2 * hitboxX;
    float lowerEdgeH = y + hitboxY;
    float upperEdgeH = y - hitboxY;
    if (!(lowerEdgeH < upperEdgeD || lowerEdgeD < upperEdgeH || rightEdgeH < leftEdgeD || rightEdgeD < leftEdgeH) && !inv){
        currentHP -= d.getAT();
        currentHP += p.getDF();
        inv = true;
        hitTime = millis(); 
    }
    strokeWeight(5);
    stroke(255);
    noFill();
    rect(leftEdgeD, upperEdgeD, rightEdgeD - leftEdgeD, lowerEdgeD - upperEdgeD);
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
