PImage entranceScene, cliffEntranceScene, forestScene, forestScrollScene, snowyScene, snowyScrollScene, prim, secon;
PImage TeddyJr; 
Heart h, item;
Monster m;
Screen s; 
Player p;
Teddy b; 
Jaws j;
JFK f;
Snake k;
BirdLock t;
MonKing mk; 
Pellet p0;
Pellet p1;
Pellet p2;
Pellet p3;
Pellet p4;
Pellet p5;
Pellet p6;
Pellet p7;
//move to class 
int heartMode = 0;
int which = 0; 
int count = 0;
int attack = 0; 
int rounds = 0; 
int n = 1; 
int stagger = 5;
int ourDisplayX = 1400;
int ourDisplayY = 800; 
int LimgShift = (int)(-1 * (ourDisplayX/71.111)); 
int RimgShift = (int)(ourDisplayX/71.111); 
float texSiz; 
boolean justLeft = false; 
boolean justRight = false; 
boolean scroll = false; 
boolean notLoop = false; 
boolean keyHeld; 
boolean Up,Down,Right,Left;
boolean arrowPress = false; 
boolean enPress = false;
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

void setup() { 
  size(1400, 800); 
  COMBAT = true; 
  entranceScene = loadImage("pixil-frame-1.png");
  entranceScene.resize(ourDisplayX, ourDisplayY);
  forestScene = loadImage("pixil-frame-0 (3).png"); 
  forestScene.resize(ourDisplayX, ourDisplayY); 
  prim = forestScene;
  forestScrollScene = loadImage("pixil-frame-0 (3).png"); 
  forestScrollScene.resize(ourDisplayX, ourDisplayY); 
  secon = forestScrollScene; 
  snowyScene = loadImage("pixil-frame-2.png"); 
  snowyScene.resize(ourDisplayX, ourDisplayY); 
  snowyScrollScene = loadImage("pixil-frame-2.png");
  snowyScrollScene.resize(ourDisplayX, ourDisplayY); 
  cliffEntranceScene = loadImage("pixil-frame-3.png");
  cliffEntranceScene.resize(ourDisplayX, ourDisplayY); 
  s = new Screen("entrance", 15); 
  h = new Heart(ourDisplayX / 2.13, ourDisplayY / 1.714);
  TeddyJr = loadImage("TeddyJr.png");
  TeddyJr.resize(TeddyJr.width, TeddyJr.height); 
  item = new Heart(ourDisplayX / 3.902, ourDisplayY / 1.111);
  p = new Player(true);
  m = new Monster(); 
  mk = new MonKing(); 
  cFirst = color(229, 209, 19);  
  cSec = color(216, 110, 28);
  int W = ourDisplayX; 
  int H = ourDisplayY; 
  p0 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p1 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p2 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p3 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p4 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p5 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p6 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  p7 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
  //fullScreen();   
}

void draw() {     
  int W = ourDisplayX; 
  int H = ourDisplayY;
  if (which == 0) {
    which = (int)(Math.random() * 5) + 1; 
    which = 5;
    if (which == 1) {
      b = new Teddy(); 
    }
    else if (which == 2) {
      t = new BirdLock();
    }
    else if(which == 3){
      j = new Jaws();
    }
    else if (which == 4){
      f = new JFK();
    }
    else if (which == 5){
      k = new Snake();
    }
  }
  else if (COMBAT) {
    fightSetup();
    if (h.dead) {
      fightDead();
    }
    else if (ITEM_SCREEN) { 
      fightItem();
    }
    else if (FIGHT_SCREEN) { 
      fightFight();
    }
    else if (TEXT_SCREEN) {
      if (s.getScene().equals("cliffEntrance")){
        fightText(mk);
      }
      else if(which == 1){
        fightText(b);
      }
      else if(which == 2){
        fightText(t);
      }
      else if(which == 3){
        fightText(j);
      }
      else if(which == 4){
        fightText(f);
      }
      else if(which == 5){
        fightText(k);
      }
    }
    else if (ENEMY_SCREEN) {
      stroke(255); 
      strokeWeight(20); 
      noFill(); 
      rect(W/3.36, H/2.4, W/2.46, H/2.57);
      h.display(h.x, h.y, ourDisplayX/38.4, ourDisplayY/21.6,heartMode);  
      if (s.getScene().equals("cliffEntrance")){
       
      }
      else if(which == 1){
        fightEnemyTeddy(b);
      }
      else if(which == 2){
        fightEnemyBirdLock(t);
      }
      else if(which == 3){
         fightEnemyJaws(j);
      }
      else if(which == 4){ //<>// //<>// //<>//
        fightEnemyJFK(f);
      }
      else if(which == 5){
        fightEnemySnake(k);
      }
    }
    else{
      if (s.getScene().equals("cliffEntrance")){
        fightElse(mk); 
      }
      else if(which == 1){
        fightElse(b);
      }
      else if(which == 2){
        fightElse(t);
      }
      else if(which == 3){ //<>// //<>//
        fightElse(j); //<>// //<>//
      }
      else if(which == 4){
        fightElse(f);
      }
      else if(which == 5){
        fightElse(k);
      }
    } 
    h.xSpeed = W/160; 
    h.ySpeed = H/90;
    if (!h.dead) {
      if (s.getScene().equals("cliffEntrance")){
        mk.display();
      }
      else if(which == 1){
        b.display();
      }
      else if(which == 2){
        t.display();
      }
      else if(which == 3){
        j.display();
      }
      else if(which == 4){
        f.display();
      }
      else if(which == 5){
        k.display();
      }
    }
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
  else if (!COMBAT) {
    TEXT_SCREEN = false; 
    SPEECH_SCREEN = false; 
    ITEM_SCREEN = false; 
    ENEMY_SCREEN = false; 
    FIGHT_SCREEN = false;
    which = 0;  
    enPress = false;
    if (p.noDisplay) {
      p.display(); 
    }
    else { 
      if (s.getScene().equals("entrance") || s.getScene().equals("cliffEntrance")) {
        if (p.x >= W - W/160) {
          p.xSpeed = 0; 
          p.ySpeed = 0; 
          background(0); 
          s.loading(); 
          if (s.loadTime <= 0) {
            if (s.getScene().equals("entrance")) {
              s = new Screen("forest", 15);  
              p.x = W/3.5; 
              p.y = H/1.5;
            }
            else {
              s = new Screen("cliff", 15);
              p.x = W/3.5; 
              p.y = H/1.895; 
            } 
            p.xSpeed = W/160;
            p.ySpeed = H/90; 
          }
        }
        else {
          if (s.getScene().equals("entrance")) {      
            image(entranceScene, 0, 0);
            image(TeddyJr, W/7.9, H/1.5); 
          }
          else if (s.getScene().equals("cliffEntrance")) {
            image(cliffEntranceScene, 0, 0); 
          }
          p.display();
          p.move(); 
        }
      }
      else if (s.getScene().equals("forest") || s.getScene().equals("snowy")) {
        if (s.screenTime <= 0) {
          if (p.x >= W - W/160) {
            p.xSpeed = 0; 
            p.ySpeed = 0; 
            background(0); 
            s.loading(); 
            if (s.loadTime <= 0) {
              if (s.getScene().equals("forest")) {
                s = new Screen("snowy", 15); 
                prim = snowyScene;
                secon = snowyScrollScene;  
              }
              else {
                s = new Screen("cliffEntrance", 15); 
              }
              p.x = W/3.5; 
              p.y = H/1.5; 
              p.xSpeed = W/160;
              p.ySpeed = H/90; 
              }
          }
          else {
            scroll = false; 
            p.display(); 
            if (justLeft) {
                image(prim, LimgShift, 0); 
                image(secon, W+LimgShift-(W/64), 0); 
               }  
            if (justRight) {        
              image(prim, RimgShift, 0); 
              image(secon, RimgShift-W+(W/64), 0);
             }
             p.move(); 
             p.display(); 
          }
        }
        else { 
          if (p.x < W/2 && !scroll) {
            if (s.getScene().equals("forest")) {
              image(forestScene, 0, 0); 
            }
            else if (s.getScene().equals("snowy")) {
              image(snowyScene, 0, 0); 
            }
            p.display(); 
            p.move(); 
          }
          else if ((p.x >= W/2 && p.walking) || (scroll)) {
            scroll = true;
            if (p.walking) {
              s.screenTime -= 1;
            }
            if ((Up || Down) && !Right && !Left) {
              p.display();
              if (justLeft) {
                image(prim, LimgShift, 0); 
                image(secon, W+LimgShift-(W/64), 0); 
               }  
              if (justRight) {        
                image(prim, RimgShift, 0); 
                image(secon, RimgShift-W+(W/64), 0);
               }
              p.move(); 
              p.display(); 
            }
            else {
              p.display(); 
              if (Left && !Right) {
                justRight = false;
                if (Up || Down) {
                  p.move(); 
                }
                if (LimgShift <= (-1)*(W - (W/32))) {
                  LimgShift = 0;
                  PImage tempA = prim; 
                  PImage tempB = secon; 
                  prim = tempB; 
                  secon = tempA; 
                  }
                image(prim, LimgShift, 0); 
                image(secon, W+LimgShift-(W/64), 0);
                LimgShift -= W/71.111; 
                justLeft = true; 
               }
               else if (Right && !Left) { 
                 justLeft = false; 
                 if (Up || Down) {          
                   p.move(); 
                  }
                 if (RimgShift >= (W - (W/32))) {
                   RimgShift = 0;
                   PImage tempA = prim; 
                   PImage tempB = secon; 
                   prim = tempB;
                   secon = tempA; 
                  }
                 image(prim, RimgShift, 0); 
                 image(secon, RimgShift-W+(W/64), 0); 
                 RimgShift += W/71.111;
                 justRight = true; 
               }
               p.display(); 
              }
            }
          }
        }
      }
    }
  }




void fightSetup(){
  int W = ourDisplayX;
  int H = ourDisplayY;
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
    item.display(W/1.576, H/1.111, ourDisplayX/38.4, ourDisplayY/21.6,heartMode);
  }
  else if (!arrowPress && !ITEM_SCREEN && !FIGHT_SCREEN && !TEXT_SCREEN && !ENEMY_SCREEN) {
    item.display(item.x, item.y, ourDisplayX/38.4, ourDisplayY/21.6,heartMode);
  }
}

void fightDead(){
  int W = ourDisplayX;
  int H = ourDisplayY;
  background(0); 
  h.display(h.x, h.y, ourDisplayX/38.4, ourDisplayY/21.6,heartMode); 
  if(millis() - h.getHitTime() > 1500){
    h.setInv(false);
   }
  if (!h.inv) {
    h.display(h.x, h.y, ourDisplayX/38.4, ourDisplayY/21.6,heartMode); 
  }
   textSize(H/20); 
   texSiz = H/20; 
   text("GAME OVER", W/2.667, H/9);     
}

void fightItem(){
  int W = ourDisplayX;
  int H = ourDisplayY;
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
    item.display(W/10.667, H/2.209, ourDisplayX/38.4, ourDisplayY/21.6,heartMode);
  }
  else{item.display(W/10.667, H/1.865, ourDisplayX/38.4, ourDisplayY/21.6,heartMode);}
}


void fightFight(){
  int W = ourDisplayX;
  int H = ourDisplayY;
  stroke(255); 
  strokeWeight(20); 
  noFill(); 
  rect(W/16, H/2.4, W/1.14, H/2.57);
  textSize(H/40); 
  texSiz = H/40; 
  fill(255); 
  text("           * Fart", W/12.8, H/2);
  item.display(W/10.667, H/2.209, ourDisplayX/38.4, ourDisplayY/21.6,heartMode);
}


void fightText(Monster mon){
  int W = ourDisplayX;
  int H = ourDisplayY;
  stroke(255);
  strokeWeight(20);
  noFill(); 
  rect(W/16, H/2.4, W/1.14, H/2.57);
  textSize(H/40); 
  texSiz = H/40; 
  fill(255); 
  if (mon.dead) {
    tex = "You killed " + mon.getName() + "! Why would you do that??? Okay killer, you gained " + mon.exp * rounds + " EXP and " + mon.gold * rounds + " GOLD. Happy?"; 
    addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
  }
  else{
    tex = "You farted on " + mon.getName() + "! It was so foul that it dealt damage! Dealt " + p.getAT() + " AT and " + mon.getName() + " now has " + mon.getHP() + " HP left."; 
    addText(tex, W/53.333, H/2.4, W/16, W/1.063);
  }
}



void fightEnemyTeddy(Teddy ted){
  int W = ourDisplayX;
  int H = ourDisplayY;
  if (SPEECH_SCREEN) {
    if (ted.currentSentence == " ") {
      int randSen = (int)(Math.random() * 3); 
       ted.currentSentence = ted.dialogue[randSen]; 
     }
    noStroke(); 
    fill(255);
    textSize(H/85);
    texSiz = H/85;
    rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
    triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
    fill(0);  
    addText(ted.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
  }
  
  else if (!SPEECH_SCREEN) {
    if (attack == 0) {
      attack = (int)(Math.random() * 2) + 1;
    }
    if (attack == 1) {
      ted.attack1();
      if (ted.countdown < 400) {
        for (int i = 0; i < ted.pellets.size(); i++) {
          Pellet p = ted.pellets.get(i); 
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
      ted.countdown--; 
      if (ted.countdown <= 0) {
        ENEMY_SCREEN = false;
        ted.currentSentence = " ";
        ted.countdown = 400;
        attack = 0;  
        ted.pellets = new ArrayList<Pellet>();  
        enPress = false; 
      }
    }
   
    else if (attack == 2) {
      if(!ted.attack2(p0,p1,p2,p3,p4,p5,p6,p7)){
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
        p5.setX((float)(Math.random() * W/2.46 + W/3.36));
        p5.setY(H/2.3);
        p6.setX((float)(Math.random() * W/2.46 + W/3.36));
        p6.setY(H/2.3);
        p7.setX((float)(Math.random() * W/2.46 + W/3.36));
        p7.setY(H/2.3);
        count++;
      }
      h.damaged(p0);
      h.damaged(p1);
      h.damaged(p2);
      h.damaged(p3);
      h.damaged(p4);
      h.damaged(p5);
      h.damaged(p6);
      h.damaged(p7);
      if(millis() - h.getHitTime() > 800){
        h.setInv(false);
      }
      if(count >= 5){
        ENEMY_SCREEN = false;
        ted.currentSentence = " ";
        attack = 0; 
        count = 0;
        enPress = false; 
        ted.at2 = false;
      } 
    }
    if (!ENEMY_SCREEN) {
      rounds += 1; 
    }
  }
}
   
    
void fightEnemyBirdLock(BirdLock bir){
  int W = ourDisplayX;
  int H = ourDisplayY;
  if (SPEECH_SCREEN) {
    if (bir.currentSentence == " ") {
      int randSen = (int)(Math.random() * 3); 
      bir.currentSentence = bir.dialogue[randSen]; 
     }
    noStroke(); 
    fill(255);
    textSize(H/85);
    texSiz = H/85;
    rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
    triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
    fill(0);  
    addText(bir.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
  }
  
  else if (!SPEECH_SCREEN) {
    if (attack == 0) {
      attack = (int)(Math.random() * 2) + 1;
    }
    if (attack == 1) {
          t.attack1();
          h.damaged(bir.getHawkson(), bir.hawk.x, bir.hawk.x + bir.hawk.hawk.width, bir.hawk.y + bir.hawk.hawk.height, bir.hawk.y);
          if (h.getCurrentHP() <= 0) {
            h.dead = true;
            }
          if(millis() - h.getHitTime() > 1500){
            h.setInv(false);
            }
          if(bir.phase >= 65){
            if (!bir.getTurn()) {
              bir.phase = 0;
              bir.setTurn(true);
              bir.setHawkY(ourDisplayY/2.7);
            }
            else {
              attack = 0;
              bir.phase = 0;
              bir.setTurn(false);
              bir.resetHawk();
              ENEMY_SCREEN = false;
              bir.currentSentence = " "; 
              enPress = false; 
            }
          }
        }
    else if (attack == 2) {
      bir.attack2();
      if (bir.phase >= 135 && bir.phase < 260) {
        h.damaged(bir.getSmoke(), bir.smokeGlass.x+50, bir.smokeGlass.x+50 + bir.smokeGlass.smokeGlass.width-130, bir.smokeGlass.y-20 + bir.smokeGlass.smokeGlass.height-100, bir.smokeGlass.y-20);
      }
      if (h.getCurrentHP() <= 0) {
        h.dead = true;
       }
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
       }
      if (bir.phase >= 280 && !h.inv) {
        bir.setFile("smoke1.png");
        attack = 0; 
        bir.phase = 0; 
        ENEMY_SCREEN = false;
        bir.currentSentence = " ";
        enPress = false;
      }
    }
    if (!ENEMY_SCREEN) {
      rounds += 1; 
    }
   }
}
    
void fightEnemyJaws(Jaws jaw){
  int W = ourDisplayX;
  int H = ourDisplayY;
  if (SPEECH_SCREEN) {
    if (jaw.currentSentence == " ") {
      int randSen = (int)(Math.random() * 3); 
      jaw.currentSentence = jaw.dialogue[randSen]; 
     }
    noStroke(); 
    fill(255);
    textSize(H/85);
    texSiz = H/85;
    rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
    triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
    fill(0);  
    addText(jaw.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
  }
  
  else if (!SPEECH_SCREEN) {
    if (attack == 0) {
      attack = (int)(Math.random() * 2) + 1;
    }
    if (attack == 1) {
      jaw.attack1();
      h.damaged(jaw.getSharkFin());
      if (h.getCurrentHP() <= 0) {
        h.dead = true;
       }
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
      }
      if(jaw.getFinFinished()){
        attack = 0;
        ENEMY_SCREEN = false;
        enPress = false; 
        jaw.currentSentence = " "; 
        jaw.phase = 0;
      }
    }
    else if(attack == 2){
      jaw.attack2();
      h.damaged(jaw.getSharkFin());
      if (h.getCurrentHP() <= 0) {
        h.dead = true;
       }
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
      }
      if(jaw.getWhipFinished()){
        attack = 0;
        ENEMY_SCREEN = false;
        enPress = false; 
        jaw.currentSentence = " "; 
        jaw.phase = 0;
      }
    }
    if (!ENEMY_SCREEN) {
      rounds += 1; 
    }
  }
}

void fightEnemyJFK(JFK fox) {
  int W = ourDisplayX;
  int H = ourDisplayY;
  if (SPEECH_SCREEN) {
    if (fox.currentSentence == " ") {
      int randSen = (int)(Math.random() * 3); 
      fox.currentSentence = fox.dialogue[randSen]; 
     }
    noStroke(); 
    fill(255);
    textSize(H/85);
    texSiz = H/85;
    rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
    triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
    fill(0);  
    addText(fox.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
  }
  
  else if (!SPEECH_SCREEN) {
    if (attack == 0) {
      attack = (int)(Math.random() * 2) + 1;
    }
    if (attack == 1) {
      f.attack1();
      for (int i = 0; i < f.pellets.size(); i++) {
        Pellet kat = f.pellets.get(i); 
        h.damaged(kat, kat.x+65, kat.x + kat.katana.width-65, kat.y + kat.katana.height, kat.y);
        if (h.getCurrentHP() <= 0) {
            h.dead = true;
        }
        if(millis() - h.getHitTime() > 1500){
          h.setInv(false);
        }
      }
      f.countdown--; 
      if (f.countdown <= 0) {
        ENEMY_SCREEN = false;
        f.currentSentence = " ";
        f.countdown = 400;
        f.count = 0;
        attack = 0;  
        f.pellets = new ArrayList<Pellet>();  
        enPress = false; 
      }
    }
    else if(attack == 2){
      f.attack2();
      h.damaged(f.getHat(), f.getHat().x+140, f.getHat().x+140 + f.getImg().width-280, f.getHat().y+120 + f.getImg().height-280, f.getHat().y+120);      
      if (h.getCurrentHP() <= 0) {
          h.dead = true;
      }
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
      }
      if (f.phase >= 20) {
        ENEMY_SCREEN = false;
        f.currentSentence = " ";
        f.count = 0;
        f.hat.count = 0; 
        f.phase = 0; 
        attack = 0;  
        enPress = false;  
        f.setTurn(false); 
      }
    }
    if (!ENEMY_SCREEN) {
      rounds += 1; 
    }
  }  
}


void fightEnemySnake(Snake sna) {
  int W = displayWidth;
  int H = displayHeight;
  if (SPEECH_SCREEN) {
    if (sna.currentSentence == " ") {
      int randSen = (int)(Math.random() * 3); 
      sna.currentSentence = sna.dialogue[randSen]; 
     }
    noStroke(); 
    fill(255);
    textSize(H/85);
    texSiz = H/85;
    rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
    triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
    fill(0);  
    addText(sna.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
  }
  
  else if (!SPEECH_SCREEN) {
    if (attack == 0) {
      attack = (int)(Math.random() * 2) + 1;
      attack = 1; 
    }
    if (attack == 1) {
      k.attack1();
      for (int i = 0; i < k.pellets.size(); i++) {
        Pellet snak = k.pellets.get(i); 
        //h.damaged(snak, snak.x+65, snak.x + snak.katana.width-65, snak.y + snak.katana.height, snak.y);
        if (h.getCurrentHP() <= 0) {
            h.dead = true;
        }
        if(millis() - h.getHitTime() > 1500){
          h.setInv(false);
        }
      } 
      if (k.countdown <= 0) {
        ENEMY_SCREEN = false;
        k.currentSentence = " ";
        k.countdown = 400;
        k.phase = 0;
        attack = 0;  
        k.pellets = new ArrayList<Pellet>();  
        enPress = false; 
      }      
    }
    else if(attack == 2){
      
    }
    if (!ENEMY_SCREEN) {
      rounds += 1; 
    }
  }  
}
    

void fightElse(Monster mon){
  int W = ourDisplayX;
  int H = ourDisplayY;
  stroke(255); 
  strokeWeight(20); 
  noFill(); 
  rect(W/16, H/2.4, W/1.14, H/2.57);
  textSize(H/40);
  texSiz = H/40; 
  fill(255);
  h.x = ourDisplayX / 2.13; 
  h.y = ourDisplayY / 1.714; 
  if (rounds < mon.update.length) {
    String temp = mon.update[rounds];
    tex = "* " + temp; 
    addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
  }
  else {
    tex = "* " + mon.update[mon.update.length - 1]; 
    addText(tex, W/53.333, H/2.4, W/16, W/1.063);  
  }
}


void keyPressed() {
  keyHeld = true; 
  if (keyCode == ENTER) {
    TEXT_SCREEN = true; 
    if (which == 1) {
      b.dead = true; 
    }
    else if (which == 2) {
      t.dead = true; 
    }
    else if (which == 3) {
      j.dead = true; 
    }
    else if (which == 4) {
      f.dead = true; 
    }
    else if (which == 5) {
      k.dead = true; 
    }
  }
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
  if (keyCode == RIGHT && !arrowPress && !enPress && COMBAT) { 
    loop();
    notLoop = false; 
    keyHeld = false; 
    arrowPress = true; 
    color tempF = cFirst; 
    color tempS = cSec; 
    cFirst = tempS; 
    cSec = tempF;
  }
  if (keyCode == LEFT && arrowPress && !enPress && COMBAT) {
    loop(); 
    notLoop = false;
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
      if (which == 2) {
        t.damaged(p.getAT());
        t.countdown = 3; 
        if (t.getHP() <= 0) {
          t.HP = 0; 
          t.dead = true; 
        }
      }
      else if (which == 1) {
        b.damaged(p.getAT());
        b.countdown = 3; 
        if (b.getHP() <= 0) {
          b.HP = 0; 
          b.dead = true; 
        }
      }
      else if (which == 3) {
        j.damaged(p.getAT());
        j.countdown = 3; 
        if (j.getHP() <= 0) {
          j.HP = 0; 
          j.dead = true; 
        }
      }
      else if (which == 4) {
        f.damaged(p.getAT());
        f.countdown = 3; 
        if (f.getHP() <= 0) {
          f.HP = 0; 
          f.dead = true; 
        }
      }
      else if (which == 5) {
        k.damaged(p.getAT());
        k.countdown = 3; 
        if (k.getHP() <= 0) {
          k.HP = 0; 
          k.dead = true; 
        }
      }
    }
    else if (TEXT_SCREEN) {
      if (n > 1 && COMBAT) {
        n = tex.length(); 
      }
      if (n == 1 && (which == 2 && t.dead) || (which == 1 && b.dead) || (which == 3 && j.dead) || (which == 4 && f.dead) || (which == 5 && k.dead)) {
        loop(); 
        notLoop = false; 
        background(0); 
        enPress = true; 
        COMBAT = false;
        rounds = 0; 
        p.xSpeed = ourDisplayX / 160; 
        p.ySpeed = ourDisplayY / 90;
        p.noDisplay = false; 
       } 
      else if (n == 1 && (!(which == 2 && t.dead) || !(which == 1 && b.dead) || !(which == 3 && j.dead) || !(which == 4 && f.dead) || !(which == 5 && k.dead)) && COMBAT) { 
        TEXT_SCREEN = false;
        SPEECH_SCREEN = true; 
        ENEMY_SCREEN = true; 
        if (which == 2) {
          t.countdown = 400; 
        }
        else if (which == 1) {
          b.countdown = 400;
        }else if (which == 3){
          j.countdown = 400;
        }
        else if (which == 4) {
          f.countdown = 400;
        }else if (which == 5){
          k.countdown = 400;
        }
        loop();
        notLoop = false; 
      }
    }
    else if (SPEECH_SCREEN) {
      if (n > 1) {
        if (which == 2) {
          n = t.currentSentence.length(); 
          t.countdown = 400;  
        }
        else if (which == 1) {
          n = b.currentSentence.length(); 
          b.countdown = 400;
        }
        else if (which == 3) {
          n = j.currentSentence.length(); 
          j.countdown = 400;
        }
        else if (which == 4) {
          n = f.currentSentence.length(); 
          f.countdown = 400;
        }
        else if (which == 5) {
          n = k.currentSentence.length(); 
          k.countdown = 400;
        }
      }
    }
    else if (COMBAT){
      if (n > 1) {
        n = tex.length();   
        enPress = false; 
       }
      if (n == 1 && !enPress && !ENEMY_SCREEN && !TEXT_SCREEN && COMBAT) { 
        if (cFirst == color(216, 110, 28)) {
          loop(); 
          notLoop = false; 
          ITEM_SCREEN = true;
          FIGHT_SCREEN = false; 
        }
        else if (cFirst == color(229, 209, 19)) {
          loop(); 
          notLoop = false; 
          FIGHT_SCREEN = true; 
          ITEM_SCREEN = false; 
        }
        enPress = true; 
      }
    }
  }
  if (keyCode == 88 && COMBAT) {
    if (enPress && !ENEMY_SCREEN && !TEXT_SCREEN) {
      FIGHT_SCREEN = false; 
      ITEM_SCREEN = false; 
      enPress = false; 
    }
  }
    if (keyCode == DOWN && ITEM_SCREEN && COMBAT) {
      switchItem = true; 
    }
    if (keyCode == UP && ITEM_SCREEN && COMBAT) {
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
  int W = ourDisplayX;
  int H = ourDisplayY;
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
    noLoop(); 
    n = 1; 
    notLoop = true; 
    if (SPEECH_SCREEN) {
      SPEECH_SCREEN = false; 
      loop(); 
      notLoop = false; 
    }
  }
}
