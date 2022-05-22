Heart h;
boolean keyHeld; 
boolean Up,Down,Right,Left;
boolean arrowPress = false; 
boolean enPress = false; 
boolean ITEM_SCREEN = false; 
boolean FIGHT_SCREEN = false; 
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
  if (ITEM_SCREEN) {
    background(0, 0, 255); 
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/3.36, H/2.4, W/2.46, H/2.57);
  }
  if (FIGHT_SCREEN) {
    background(0, 255, 0); 
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/3.36, H/2.4, W/2.46, H/2.57);
  } 
  else{
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/3.36, H/2.4, W/2.46, H/2.57); 
    fill(255); 
    PFont font = createFont("undertale-attack-font.ttf", H/40); 
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
  }
  
  h.xSpeed = W/160; 
  h.ySpeed = H/90; 
  h.display(); 
  if (h.x >= W/1.47) {
    h.x = W/1.499; 
    h.xSpeed = 0;
  }
  if (h.x <= W/3.12) {
    h.x = W/3.02; 
    h.xSpeed = 0; 
  }
  if (h.y >= H/1.31) {
    h.y = H/1.34;
    h.ySpeed = 0;
  }
  if (h.y <= H/2.18) {
    h.y = H/2.09; 
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
  if (keyCode == RIGHT && !arrowPress) { 
    keyHeld = false; 
    arrowPress = true; 
    color tempF = cFirst; 
    color tempS = cSec; 
    cFirst = tempS; 
    cSec = tempF;
  }
  if (keyCode == LEFT && arrowPress) {
    keyHeld = false; 
    arrowPress = false; 
    color tempF = cFirst; 
    color tempS = cSec; 
    cFirst = tempS; 
    cSec = tempF; 
  }
  if (keyCode == ENTER) {
    if (!enPress) {      
      if (cFirst == color(216, 110, 28)) {
        ITEM_SCREEN = true;
        FIGHT_SCREEN = false; 
      }
      else if (cFirst == color(229, 209, 19)) {
        FIGHT_SCREEN = true; 
        ITEM_SCREEN = false; 
      }
      enPress = true; 
    }
    else {
      ITEM_SCREEN = false;
      FIGHT_SCREEN = false;
      enPress = false;
    }
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
