Heart h;
boolean keyHeld; 
boolean Up,Down,Right,Left;
color cFirst; 
color cSec; 

void setup() {
  h = new Heart();
  cFirst = color(229, 209, 19); 
  cSec = color(216, 110, 28);
  print(displayWidth); 
  print(displayHeight); 
  fullScreen();   
}

void draw() { 
  int W = displayWidth; 
  int H = displayHeight; 
  background(0);
  stroke(255); 
  strokeWeight(20); 
  noFill(); 
  rect(W/3.36, H/2.4, W/2.46, H/2.57); 
  fill(255); 
  PFont font = createFont("undertale-attack-font.ttf.vlw", 45); 
  //PFont font = createFont("C:/Users/sasha/Downloads/processing-3.5.4-windows64/processing-3.5.4/lib/fonts/undertale-attack-font.ttf", 45);
  textFont(font); 
  text("TOMMY WOLF", W/16, H/1.16); 
  text("LV 1", W/4, H/1.16); 
  textSize(H/60); 
  text("HP", W/2.46, H/1.16); 
  noStroke(); 
  fill(223, 252, 8); 
  rect(W/2.29, H/1.2, W/49.2, H/36); 
  fill(255); 
  textSize(H/40); 
  text("20 / 20", W/2.1, H/1.16); 
  noFill(); 
  stroke(cFirst); 
  strokeWeight(10); 
  rect(W/4, H/1.125, W/6.4, H/12);
  stroke(cSec); 
  rect(W/1.6, H/1.125, W/6.4, H/12);
  textSize(H/30); 
  fill(cFirst);
  text("FIGHT", W/3.46, H/1.05);
  fill(cSec);
  text("ITEM", W/1.46, H/1.05); 
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
    //keyHeld = true; 
    Up = true; 
  }
  if (keyCode == 65) {
    //keyHeld = true; 
    Right = true; 
  }
  if (keyCode == 83) {
    //keyHeld = true; 
    Down = true; 
  }
  if (keyCode == 68) {
    //keyHeld = true; 
    Left = true;  
  }
  if (keyCode == RIGHT) {
    keyHeld = false; 
    color tempF = cFirst; 
    color tempS = cSec; 
    cFirst = tempS; 
    cSec = tempF;
  }
}

void keyReleased() {
  keyHeld = false; 
  if (keyCode == 87) {
    Up = false; 
  }
  if (keyCode == 65) {
    Right = false; 
  }
  if (keyCode == 83) {
    Down = false; 
  }
  if (keyCode == 68) {
    Left = false;  
  }
}

//void swordSymbol() {
//  for (int i = 
//}
