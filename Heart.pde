public class Heart {
  int x,y;  
  int xSpeed = 20;
  int ySpeed = 20; 
  boolean inv; 
  int currentHP; 
  float hitbox; 
  
  public Heart() {
    inv = false;
    x = 1500; 
    y = 1100; 
  }
  
  void display() {
    fill(255, 0, 0);
    noStroke(); 
    ellipseMode(RADIUS); 
    ellipse(x, y, 50, 50); 
    //PImage heart = loadImage("heart.png"); 
    //image(heart, 1000, 1000); 
  }
  
  void move() {
    if (UP) {y -= ySpeed;}
    if (DOWN) {y += ySpeed;}
    if (RIGHT) {x -= xSpeed;}
    if (LEFT) {x += xSpeed;}
  }
}
