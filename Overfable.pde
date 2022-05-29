PImage entrance, forest, forestScroll, prim, secon;
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
int rounds = 0; 
int n = 1; 
int stagger = 5;
int LimgShift = -45; 
int RimgShift = 45; 
float texSiz; 
boolean keyHeld; 
boolean Up,Down,Right,Left;
boolean arrowPress = false; 
boolean enPress = true;
boolean switchItem = false;
boolean COMBAT = false; 
boolean ITEM_SCREEN = false; 
boolean FIGHT_SCREEN = false; 
boolean TEXT_SCREEN = false; 
boolean SPEECH_SCREEN = false; 
boolean ENEMY_SCREEN = false; 
String tex;
color cFirst; 
color cSec; 
Controller keyboardInput;

void setup() {
  COMBAT = false; 
  entrance = loadImage("pixil-frame-1.png");
  entrance.resize(displayWidth, displayHeight);
  forest = loadImage("pixil-frame-0 (3).png"); 
  forest.resize(displayWidth, displayHeight); 
  prim = forest;
  forestScroll = loadImage("pixil-frame-0 (3).png"); 
  forestScroll.resize(displayWidth, displayHeight); 
  secon = forestScroll; 
  h = new Heart(displayWidth / 2.13, displayHeight / 1.714);
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
  fullScreen();   
}

void draw() {   
  int W = displayWidth; 
  int H = displayHeight; 
  if (COMBAT) {
    background(0); 
    fill(255); 
    PFont font = createFont("undertale-attack-font.ttf", H/40); 
    textFont(font); 
    text("TOMMY WOLF", W/16, H/1.16); 
    text("LV " + p.getLV(), W/4, H/1.16); 
    textSize(H/60); 
    texSiz = H/60;
    text("HP", W/2.46, H/1.16); 
    noStroke(); 
    fill(223, 252, 8); 
    float max = W / 49.2; 
    rect(W/2.29, H/1.2, (max / p.getHP()) * h.getCurrentHP(), H/36);
    fill(255, 0, 0); 
    rect(W/2.29 + (max / p.getHP()) * h.getCurrentHP(), H/1.2, W/49.2 - (max / p.getHP()) * h.getCurrentHP(), H/36); 
    fill(255); 
    textSize(H/40); 
    texSiz = H/40; 
    text(h.getCurrentHP() + " / " + p.getHP(), W/2.1, H/1.16); 
    noFill(); 
    rect(W/3.36, H/2.4, W/2.46, H/2.57);
    stroke(cFirst); 
    strokeWeight(10); 
    rect(W/4, H/1.125, W/6.4, H/12);
    stroke(cSec); 
    rect(W/1.6, H/1.125, W/6.4, H/12);
    textSize(H/30); 
    texSiz = H/30; 
    fill(cFirst);
    text("FIGHT", W/3.46, H/1.05);
    fill(cSec);
    text("ITEM", W/1.46, H/1.05); 
    set(2125, 1710, #D86E1C);
    if (arrowPress && !ITEM_SCREEN && !TEXT_SCREEN && !ENEMY_SCREEN) {
      item.display(W/1.576, H/1.111, displayWidth/38.4, displayHeight/21.6);
    }
    else if (!arrowPress && !ITEM_SCREEN && !FIGHT_SCREEN && !TEXT_SCREEN && !ENEMY_SCREEN) {
      item.display(item.x, item.y, displayWidth/38.4, displayHeight/21.6);
    }
    if (h.dead) {
      background(0); 
      
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6); 
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
       }
      
      if (!h.inv) {
        h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6); 
      }
       
       textSize(H/20); 
       texSiz = H/20; 
       text("GAME OVER", W/2.667, H/9); 
       
      
    }
    else if (ITEM_SCREEN) { 
      stroke(255); 
      strokeWeight(20); 
      noFill(); 
      rect(W/16, H/2.4, W/1.14, H/2.57);
      textSize(H/40); 
      texSiz = H/40; 
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
      texSiz = H/40; 
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
      texSiz = H/40; 
      fill(255); 
      if (m.dead) {
        tex = "You killed Teddy Grizzlevelt! Why would you do that??? Okay killer, you gained " + m.exp * rounds + " EXP and " + m.gold * rounds + " GOLD. Happy?"; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else{
        tex = "You farted on Mr. Grizzlevelt! It was so foul that it dealt damage! Dealt " + p.getAT() + " AT and Teddy now has " + m.getHP() + " HP left."; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);
      }
    }
    else if (ENEMY_SCREEN) {
      stroke(255); 
      strokeWeight(20); 
      noFill(); 
      rect(W/3.36, H/2.4, W/2.46, H/2.57);
  
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6);
      
      if (SPEECH_SCREEN) {
        if (m.currentSentence == " ") {
          int randSen = (int)(Math.random() * 3); 
          m.currentSentence = m.dialogue[randSen]; 
         }
        noStroke(); 
        fill(255);
        textSize(H/85);
        texSiz = H/85;
        rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
        triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
        fill(0);  
        addText(m.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
      }
      
      else if (!SPEECH_SCREEN) {
        if (attack == 0) {
          attack = (int)(Math.random() * 2) + 1;
        }
        if (attack == 1) {
          m.attack1();
          if (m.countdown < 400) {
            for (int i = 0; i < m.pellets.size(); i++) {
              Pellet p = m.pellets.get(i); 
              p.display(); 
              h.damaged(p);
              if (h.getCurrentHP() <= 0) {
                h.dead = true;
                break; 
              }
              if(millis() - h.getHitTime() > 1500){
                h.setInv(false);
              }
            }
          }
          m.countdown--; 
          if (m.countdown <= 0) {
            ENEMY_SCREEN = false;
            m.currentSentence = " ";
            m.countdown = 400;
            attack = 0;  
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
          if(millis() - h.getHitTime() > 800){
            h.setInv(false);
          }
          if(count >= 5){
            ENEMY_SCREEN = false;
            m.currentSentence = " ";
            attack = 0; 
            count = 0;
            enPress = false; 
            m.at2 = false;
          } 
        }
        if (!ENEMY_SCREEN) {
          rounds += 1; 
        }
      }
    }
    else{
      stroke(255); 
      strokeWeight(20); 
      noFill(); 
      rect(W/16, H/2.4, W/1.14, H/2.57);
      textSize(H/40);
      texSiz = H/40; 
      fill(255);
      h.x = displayWidth / 2.13; 
      h.y = displayHeight / 1.714; 
      if (rounds < m.update.length) {
        String temp = m.update[rounds];
        tex = "* " + temp; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else {
        tex = "* " + m.update[m.update.length - 1]; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);  
      }  
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
  else {
    //image(forest, -50, 0);
    //image(forestScroll, 200, 0);
    if (p.x < W/2) {
      image(forest, 0, 0); 
      p.display(); 
      p.move(); 
    }
    else if (p.x >= W/2 && p.walking) {
      p.display(); 
      if (Left) {
        if (LimgShift <= -3100) {
          LimgShift = 0;
          PImage tempA = prim; 
          PImage tempB = secon; 
          prim = tempB; 
          secon = tempA; 
        }
        image(prim, LimgShift, 0); 
        image(secon, 3200+LimgShift-50, 0);  
        if ((Up || Down) && !Right && !Left) {
          p.display(); 
          p.move(); 
        }
        else {
          LimgShift -= 45; 
        }
       }
       else if (Right) { 
         if (RimgShift >= 3100) {
          RimgShift = 0;
          PImage tempA = prim; 
          PImage tempB = secon; 
          prim = tempB; 
          secon = tempA; 
        }
        image(prim, RimgShift, 0); 
        image(secon, RimgShift-3200+50, 0); 
        if ((Up || Down) && !Right && !Left) {
          p.display(); 
          p.move(); 
        }
        else {
          RimgShift += 45;
        } 
       }
       p.display(); 
    }
  //h.move();
  }
 }


void keyPressed() {
  keyHeld = true; 
  if (keyCode == 87 && !h.dead) {
    //keyHeld = true; 
    Up = true; 
  }
  if (keyCode == 65 && !h.dead) {
    //keyHeld = true; 
    Right = true; 
  }
  if (keyCode == 83 && !h.dead) {
    //keyHeld = true; 
    Down = true; 
  }
  if (keyCode == 68 && !h.dead) {
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
      m.countdown = 3; 
      if (m.getHP() <= 0) {
        m.HP = 0; 
        m.dead = true; 
      }
    }
    else if (TEXT_SCREEN) {
      if (n > 1) {
        n = tex.length();
        loop(); 
      }
      else if (m.dead) {
        COMBAT = false;
      }
      else{
        TEXT_SCREEN = false;
        SPEECH_SCREEN = true; 
        ENEMY_SCREEN = true; 
        m.countdown = 400; 
        loop();
      }
    }
    else if (SPEECH_SCREEN) {
      if (n > 1) {
        n = m.currentSentence.length(); 
        m.countdown = 400;  
      }
    }
    else {
      if (n > 1) {
          n = tex.length();  
          loop(); 
          enPress = false; 
       }
      else if (!enPress && !ENEMY_SCREEN && !TEXT_SCREEN) {
        if (cFirst == color(216, 110, 28)) {
          loop(); 
          ITEM_SCREEN = true;
          FIGHT_SCREEN = false; 
        }
        else if (cFirst == color(229, 209, 19)) {
          loop(); 
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

void addText(String t, float wInc, float upBounds, float leftBounds, float rightBounds) {
  int W = displayWidth;
  int H = displayHeight;
  float w_ = leftBounds + W/32;
  float h_ = upBounds + H/18;  
  for (int i = 0; i < n; i++) { 
    if (w_ >= rightBounds - texSiz*9 && i != 0 && t.charAt(i-1) == ' ') { 
      w_ = leftBounds + W/32; 
      h_ += texSiz*2.222; 
    }
    char temp = t.charAt(i); 
    text(temp, w_, h_); 
    w_ += wInc; 
  }
  stagger--; 
  if (stagger <= 0) {
    n++; 
    stagger = 3; 
  }
  if (n > t.length()) {
    n = 1; 
    noLoop(); 
    if (SPEECH_SCREEN) {
      SPEECH_SCREEN = false; 
      loop(); 
    }
  }
}



//void swordSymbol() {
//  for (int i = 
//}
