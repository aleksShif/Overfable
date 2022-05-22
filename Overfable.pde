Heart h;
boolean keyHeld; 
boolean UP,DOWN,RIGHT,LEFT = false; 

void setup() {
  h = new Heart(); 
  fullScreen();  
}

void draw() { 
  background(0);
  stroke(255); 
  strokeWeight(20); 
  noFill(); 
  rect(950, 750, 1300, 700); 
  fill(255); 
  PFont font = createFont("C:/Users/sasha/Downloads/processing-3.5.4-windows64/processing-3.5.4/lib/fonts/undertale-attack-font.ttf", 45);
  textFont(font); 
  text("TOMMY WOLF", 200, 1550); 
  text("LV 1", 800, 1550); 
  textSize(30); 
  text("HP", 1300, 1550); 
  noStroke(); 
  fill(223, 252, 8); 
  rect(1400, 1500, 65, 50); 
  fill(255); 
  textSize(45); 
  text("20 / 20", 1500, 1550); 
  noFill(); 
  stroke(216, 110, 28); 
  strokeWeight(10); 
  rect(800, 1600, 500, 150);
  rect(2000, 1600, 500, 150);
  fill(216, 110, 28);
  textSize(60); 
  text("FIGHT", 925, 1710); 
  text("ITEM", 2195, 1710); 
  set(2125, 1710, #D86E1C);
  
  h.xSpeed = 20; 
  h.ySpeed = 20; 
  h.display(); 
  if (h.x >= 2170) {
    h.x = 2135; 
    h.xSpeed = 0;
  }
  if (h.x <= 1025) {
    h.x = 1060; 
    h.xSpeed = 0; 
  }
  if (h.y >= 1375) {
    h.y = 1340;
    h.ySpeed = 0;
  }
  if (h.y <= 825) {
    h.y = 860; 
    h.ySpeed = 0; 
  }
  h.move(); 
}

void keyPressed() {
  keyHeld = true; 
  if (keyCode == 87) {
    UP = true; 
  }
  if (keyCode == 65) {
    RIGHT = true; 
  }
  if (keyCode == 83) {
    DOWN = true; 
  }
  if (keyCode == 68) {
    LEFT = true;  
  }
}

void keyReleased() {
  keyHeld = false; 
  if (keyCode == 87) {
    UP = false; 
  }
  if (keyCode == 65) {
    RIGHT = false; 
  }
  if (keyCode == 83) {
    DOWN = false; 
  }
  if (keyCode == 68) {
    LEFT = false;  
  }
}

//void swordSymbol() {
//  for (int i = 
//}
