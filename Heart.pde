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
    float varW = displayWidth/32;
    float varH = displayHeight/18;
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
    //ellipseMode(RADIUS); 
    //ellipse(x, y, 50, 50); 
    //PImage varWeart = loadImage("redSoul.png"); 
    //image(varWeart, varW0, varW0); 
    //ellipseMode(RADIUS); 
    //ellipse(x, y, 50, 50); 
    //PImage heart = loadImage("heart.png"); 
    //image(heart, varW0, varW0); 
  }
  
  void move() {
    if (Up) {y -= ySpeed;}
    if (Down) {y += ySpeed;}
    if (Right) {x -= xSpeed;}
    if (Left) {x += xSpeed;}
  }
}
