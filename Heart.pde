public class Heart {
  float x,y;  
  int xSpeed = displayWidth / 160;
  int ySpeed = displayHeight / 90; 
  boolean inv; 
  int currentHP; 
  float hitbox;   
  
  public Heart(float x_, float y_) {
    inv = false;
<<<<<<< HEAD
    x = x_; 
    y = y_; 
=======
    currentHP = 20;
    x = displayWidth / 2.13 ; 
    y = displayHeight / 1.64; 
>>>>>>> ad0b71b3deb6b593c7c72daf67297b4c4cfe1391
  }
  
  void display(float x, float y, float varW, float varH) {
    fill(255, 0, 0);
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
  
  int getCurrentHP(){
    return currentHP;
  }
}
