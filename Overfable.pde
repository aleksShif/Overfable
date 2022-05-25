Heart h, item;
Monster m;
Player p;
Pellet p0;
Pellet p1;
Pellet p2;
Pellet p3;
Pellet p4;
int count = 0;
boolean keyHeld; 
boolean Up,Down,Right,Left;
boolean arrowPress = false; 
boolean enPress = false;
boolean switchItem = false;
boolean ITEM_SCREEN = false; 
boolean FIGHT_SCREEN = false; 
boolean ENEMY_SCREEN = false; 
color cFirst; 
color cSec; 

void setup() {
  h = new Heart(displayWidth / 2.13, displayHeight / 1.64);
  item = new Heart(displayWidth / 3.902, displayHeight / 1.111);
  p = new Player(true);
  m = new Monster();
  cFirst = color(229, 209, 19);  
  cSec = color(216, 110, 28);
  int W = displayWidth; 
  int H = displayHeight; 
  p0 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p1 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p2 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p3 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p4 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  print(displayWidth); 
  print(displayHeight); 
  fullScreen();   
}

void draw() {   
  int W = displayWidth; 
  int H = displayHeight; 
  background(0); 
  fill(255); 
  PFont font = createFont("undertale-attack-font.ttf", H/40); 
  textFont(font); 
  text("TOMMY WOLF", W/16, H/1.16); 
  text("LV " + p.getLV(), W/4, H/1.16); 
  textSize(H/60); 
  text("HP", W/2.46, H/1.16); 
  noStroke(); 
  fill(223, 252, 8); 
  rect(W/2.29, H/1.2, W/49.2, H/36); 
  fill(255); 
  textSize(H/40); 
  text(h.getCurrentHP() + " / " + p.getHP(), W/2.1, H/1.16); 
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
  if (arrowPress && !ITEM_SCREEN) {
    item.display(W/1.576, H/1.111, displayWidth/38.4, displayHeight/21.6);
  }
  else if (!arrowPress && !ITEM_SCREEN) {
    item.display(item.x, item.y, displayWidth/38.4, displayHeight/21.6);
  }
  if (ITEM_SCREEN) { 
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/16, H/2.4, W/1.14, H/2.57);
    textSize(H/40); 
    fill(255); 
    text("           * Butterscotch Pie", W/12.8, H/2); 
    text("           * Steak", W/12.8, H/1.714); 
    if (!switchItem) {
      item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6);
    }
    else{item.display(W/10.667, H/1.865, displayWidth/38.4, displayHeight/21.6);}
  }
  else if (FIGHT_SCREEN) { 
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/16, H/2.4, W/1.14, H/2.57);
    textSize(H/40); 
    fill(255); 
    text("           * Fart", W/12.8, H/2);
    item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6);
  } 
  else if (ENEMY_SCREEN) {
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/3.36, H/2.4, W/2.46, H/2.57);
    h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6);
    if(!m.attack2(p0,p1,p2,p3,p4)){
      p0.setX((float)(Math.random() * W/2.46 + W/3.36));
      p0.setY(H/2.3);
      p1.setX((float)(Math.random() * W/2.46 + W/3.36));
      p1.setY(H/2.3);
      p2.setX((float)(Math.random() * W/2.46 + W/3.36));
      p2.setY(H/2.3);
      p3.setX((float)(Math.random() * W/2.46 + W/3.36));
      p3.setY(H/2.3);
      p4.setX((float)(Math.random() * W/2.46 + W/3.36));
      p4.setY(H/2.3);
      count++;
    }
    h.damaged(p0);
    h.damaged(p1);
    h.damaged(p2);
    h.damaged(p3);
    h.damaged(p4);
    if(millis() - h.getHitTime() > 1000){
      h.setInv(false);
    }
    if(count >= 5){
      ENEMY_SCREEN = false;
      count = 0;
    }
  }
  else{
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/16, H/2.4, W/1.14, H/2.57);
    textSize(H/40); 
    fill(255); 
    text("* Dummy skedaddled into your personal space!", W/12.8, H/2); 
    //rect(W/3.36, H/2.4, W/2.46, H/2.57);   
  }
  
  h.xSpeed = W/160; 
  h.ySpeed = H/90; 
  m.display();
  if (h.x >= W/1.51) {
    h.x = W/1.52; 
  }
  if (h.x <= W/3.27) {
    h.x = W/3.25; 
  }
  if (h.y >= H/1.35) {
    h.y = H/1.37;
  }
  if (h.y <= H/2.35) {
    h.y = H/2.33; 
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
  if (keyCode == RIGHT && !arrowPress && !enPress) { 
    keyHeld = false; 
    arrowPress = true; 
    color tempF = cFirst; 
    color tempS = cSec; 
    cFirst = tempS; 
    cSec = tempF;
  }
  if (keyCode == LEFT && arrowPress && !enPress) {
    keyHeld = false; 
    arrowPress = false; 
    color tempF = cFirst; 
    color tempS = cSec; 
    cFirst = tempS; 
    cSec = tempF;
  }
  if (keyCode == ENTER) {
    if (FIGHT_SCREEN) {
      ENEMY_SCREEN = true; 
      FIGHT_SCREEN = false; 
    }
    else {
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
    if (keyCode == DOWN && ITEM_SCREEN) {
      switchItem = true; 
    }
    if (keyCode == UP && ITEM_SCREEN) {
      switchItem = false; 
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
