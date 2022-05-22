Heart h;
boolean keyHeld; 

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
  text("16 / 20", 1500, 1550); 
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
  h.display(); 
}

void keyPressed() {
  keyHeld = true; 
  if (keyCode == 87) {
    if (keyCode == 65) {
      h.move(-10, 10); 
    }
    if (keyCode == 68) {
      h.move(10, -10);
    }
    else{h.move(0, -10);} 
  }
  if (keyCode == 65) {
    if (keyCode == 87) {
      h.move(-10, 10);
    }
    if (keyCode == 83) {
      h.move(-10, 10);
    }
    else{h.move(-10, 0);} 
  }
  if (keyCode == 83) {
    if (keyCode == 65) {
      h.move(-10, 10); 
    }
    if (keyCode == 68) {
      h.move(10, 10); 
    }
    else{h.move(0, 10);} 
  }
  if (keyCode == 68) {
    if (keyCode == 87) {
      h.move(10, -10); 
    }
    if (keyCode == 83) {
      h.move(10, 10); 
    }
    else{h.move(10, 0);} 
  }
}

void keyReleased() {
  keyHeld = false; 
}

//void swordSymbol() {
//  for (int i = 
//}
