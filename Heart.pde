public class Heart {
  float x,y;  
  int xSpeed = displayWidth / 160;
  int ySpeed = displayHeight / 90; 
  boolean inv; 
  int currentHP; 
  float hitbox; 
  
  public Heart() {
    inv = false;
    x = displayWidth / 2.13 ; 
    y = displayHeight / 1.64; 
  }
  
  void display() {
    fill(255, 0, 0);
    noStroke(); 
    beginShape (POLYGON);
    vertex (x+8*100/16, y+4*100/16);
    vertex (x+8*100/16, y+3*100/16);
    vertex (x+4*100/16, y+3*100/16);
    vertex (x+4*100/16, y+4*100/16);
    vertex (x+3*100/16, y+4*100/16);
    vertex (x+3*100/16, y+5*100/16);
    vertex (x+2*100/16, y+5*100/16);
    vertex (x+2*100/16, y+9*100/16);
    vertex (x+3*100/16, y+9*100/16);
    vertex (x+3*100/16, y+10*100/16);
    vertex (x+4*100/16, y+10*100/16);
    vertex (x+4*100/16, y+11*100/16);
    vertex (x+5*100/16, y+11*100/16);
    vertex (x+5*100/16, y+12*100/16);
    vertex (x+6*100/16, y+12*100/16);
    vertex (x+6*100/16, y+13*100/16);
    vertex (x+7*100/16, y+13*100/16);
    vertex (x+7*100/16, y+14*100/16);
    vertex (x+8*100/16, y+14*100/16);
    vertex (x+8*100/16, y+15*100/16);
    vertex (x+10*100/16, y+15*100/16);
    vertex (x+10*100/16, y+14*100/16);
    vertex (x+11*100/16, y+14*100/16);
    vertex (x+11*100/16, y+13*100/16);
    vertex (x+12*100/16, y+13*100/16);
    vertex (x+12*100/16, y+12*100/16);
    vertex (x+13*100/16, y+12*100/16);
    vertex (x+13*100/16, y+11*100/16);
    vertex (x+14*100/16, y+11*100/16);
    vertex (x+14*100/16, y+10*100/16);
    vertex (x+15*100/16, y+10*100/16);
    vertex (x+15*100/16, y+9*100/16);
    vertex (x+16*100/16, y+9*100/16);
    vertex (x+16*100/16, y+5*100/16);
    vertex (x+15*100/16, y+5*100/16);
    vertex (x+15*100/16, y+4*100/16);
    vertex (x+14*100/16, y+4*100/16);
    vertex (x+14*100/16, y+3*100/16);
    vertex (x+10*100/16, y+3*100/16);
    vertex (x+10*100/16, y+4*100/16);
    vertex (x+8*100/16, y+4*100/16);
    endShape (CLOSE);
    //ellipseMode(RADIUS); 
    //ellipse(x, y, 50, 50); 
    //PImage 100eart = loadImage("redSoul.png"); 
    //image(100eart, 1000, 1000); 
  }
  
  void move() {
    if (Up) {y -= ySpeed;}
    if (Down) {y += ySpeed;}
    if (Right) {x -= xSpeed;}
    if (Left) {x += xSpeed;}
  }
}
