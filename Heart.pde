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
    ellipseMode(RADIUS); 
    ellipse(x, y, 50, 50); 
    PImage heart = loadImage("heart.png"); 
    image(heart, 1000, 1000); 
  }
  
  void move() {
    if (Up) {y -= ySpeed;}
    if (Down) {y += ySpeed;}
    if (Right) {x -= xSpeed;}
    if (Left) {x += xSpeed;}
  }
}
