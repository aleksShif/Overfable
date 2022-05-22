public class Heart {
  int x,y;  
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
  
  void move(float x_, float y_) {
    x += x_; 
    y += y_; 
  }
}
