Heart h, item;
Monster m;
Player p;
Pellet p0;
Pellet p1;
Pellet p2;
Pellet p3;
Pellet p4;
//move to class 
int count = 0;
int attack = 0; 
int n = 1; 
boolean keyHeld; 
boolean Up,Down,Right,Left;
boolean arrowPress = false; 
boolean enPress = false;
boolean switchItem = false;
boolean ITEM_SCREEN = false; 
boolean FIGHT_SCREEN = false; 
boolean TEXT_SCREEN = false; 
boolean ENEMY_SCREEN = false; 
color cFirst; 
color cSec; 

void setup() {
  h = new Heart(displayWidth / 2.13, displayHeight / 1.8);
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
  else if (!arrowPress && !ITEM_SCREEN && !FIGHT_SCREEN) {
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
  else if (TEXT_SCREEN) {
    stroke(255);
    strokeWeight(20); 
    noFill(); 
    rect(W/16, H/2.4, W/1.14, H/2.57);
    textSize(H/40); 
    fill(255); 
    if (m.dead) {
      text("  You killed the dummy! Why would you do that???", W/12.8, H/2); 
      text("  Okay killer, you gained " + m.exp + " EXP and " + m.gold + " GOLD. Happy?", W/12.8, H/1.636);
    }
    else{
      text("  You farted on the dummy! It was so foul that it dealt damage!", W/12.8, H/2);
      
      text(" (for testing purposes: dealt " + p.getAT() + " AT and dummy now has " + m.getHP() + " HP left.", W/12.8, H/1.636); 
      
      strokeWeight(5); 
      fill(255); 
      rect(1850, 380, 500, 300, 7, 7, 7, 7); 
      fill(0); 
      strokeWeight(7); 
      textSize(H/85); 
      if (m.currentSentence == " ") {
        int randSen = (int)(Math.random() * 3); 
        m.currentSentence = m.dialogue[randSen]; 
      }
      float w_ = 1900;
      float h_ = 440; 
      for (int i = 0; i < n; i++) { 
        if (w_ >= 2250 && i != 0 && m.currentSentence.charAt(i-1) == ' ') { 
          w_ = 1900; 
          h_ += 38; 
        }
        char temp = m.currentSentence.charAt(i); 
        text(temp, w_, h_); 
        w_ += 20; 
      }
      m.countdown--; 
      if (m.countdown <= 0) {
        n++; 
        m.countdown = 5; 
      }
      if (n > m.currentSentence.length()) {
        n = 1; 
        noLoop();
      }
    }
  }
  else if (ENEMY_SCREEN) {
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    rect(W/3.36, H/2.4, W/2.46, H/2.57);

    h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6);
    
    if (attack == 0) {
      attack = (int)(Math.random() * 2) + 1;
    }
    if (attack == 1) {
      m.attack1();
      if (m.countdown < 400) {
        for (int i = 0; i < m.pellets.size(); i++) {
          Pellet p = m.pellets.get(i); 
          p.display(); 
         }
      }
      m.countdown--; 
      if (m.countdown == 0) {
        ENEMY_SCREEN = false;
        m.currentSentence = " ";
        m.countdown = 400; 
        attack = 0; 
        h = new Heart(displayWidth / 2.13, displayHeight / 1.8); 
        m.pellets = new ArrayList<Pellet>(); 
        enPress = false; 
      }
    }
    
    else if (attack == 2) {
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
        m.currentSentence = " "; 
        attack = 0; 
        count = 0;
        enPress = false; 
      } 
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
  if (keyCode == 90) {
    if (FIGHT_SCREEN) {
      TEXT_SCREEN = true; 
      FIGHT_SCREEN = false; 
      m.damaged(p.getAT());
      m.countdown = 5; 
      if (p.getHP() <= 0) {
        m.HP = 0; 
        m.dead = true; 
      }
    }
    else if (TEXT_SCREEN) {
      TEXT_SCREEN = false; 
      ENEMY_SCREEN = true; 
      m.countdown = 400; 
      loop(); 
    }
    else {
      if (!enPress && !ENEMY_SCREEN && !TEXT_SCREEN) {      
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
    }
  }
  if (keyCode == 88) {
    if (enPress && !ENEMY_SCREEN && !TEXT_SCREEN) {
      FIGHT_SCREEN = false; 
      ITEM_SCREEN = false; 
      enPress = false; 
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
