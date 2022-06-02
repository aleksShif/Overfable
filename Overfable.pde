PImage entranceScene, cliffEntranceScene, forestScene, forestScrollScene, snowyScene, snowyScrollScene, prim, secon;
PImage TeddyJr; 
Heart h, item;
Monster m;
Screen s; 
Player p;
Teddy b; 
BirdLock t;
MonKing mk; 
Pellet p0;
Pellet p1;
Pellet p2;
Pellet p3;
Pellet p4;
BirdPellet bp0;
BirdPellet bp1;
BirdPellet bp2;
BirdPellet bp3;
BirdPellet bp4;
BirdPellet bp5;
//move to class 
int heartMode = 1;
int hawkPhase = 1;
int which = 0; 
int count = 0;
int attack = 0; 
int rounds = 0; 
int n = 1; 
int stagger = 5;
int LimgShift = (int)(-1 * (displayWidth/71.111)); 
int RimgShift = (int)(displayWidth/71.111); 
float texSiz; 
boolean justLeft = false; 
boolean justRight = false; 
boolean scroll = false; 
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
  entranceScene = loadImage("pixil-frame-1.png");
  entranceScene.resize(displayWidth, displayHeight);
  forestScene = loadImage("pixil-frame-0 (3).png"); 
  forestScene.resize(displayWidth, displayHeight); 
  prim = forestScene;
  forestScrollScene = loadImage("pixil-frame-0 (3).png"); 
  forestScrollScene.resize(displayWidth, displayHeight); 
  secon = forestScrollScene; 
  snowyScene = loadImage("pixil-frame-2.png"); 
  snowyScene.resize(displayWidth, displayHeight); 
  snowyScrollScene = loadImage("pixil-frame-2.png");
  snowyScrollScene.resize(displayWidth, displayHeight); 
  cliffEntranceScene = loadImage("pixil-frame-3.png");
  cliffEntranceScene.resize(displayWidth, displayHeight); 
  s = new Screen("entrance", 15); 
  h = new Heart(displayWidth / 2.13, displayHeight / 1.714);
  TeddyJr = loadImage("TeddyJr.png");
  TeddyJr.resize((int)(displayWidth/4.571), (int)(displayHeight/2.25)); 
  item = new Heart(displayWidth / 3.902, displayHeight / 1.111);
  p = new Player(true);
  m = new Monster(); 
  mk = new MonKing(); 
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
  if (which == 0) {
    which = (int)(Math.random() * 2) + 1; 
    //which = 0; //DELETE LATER DELETE LATER DELETE LATER DELETE LATER DELETE LATER DELETE LATER DELETE LATER DELETE LATER 
    if (which == 1) {
      b = new Teddy(); 
    }
    else if (which == 2) {
      t = new BirdLock();
    }
  }
  if (COMBAT && s.getScene().equals("cliffEntrance")) { //used to have && s.getScene().equals("cliffEntrance")
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
      item.display(W/1.576, H/1.111, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    else if (!arrowPress && !ITEM_SCREEN && !FIGHT_SCREEN && !TEXT_SCREEN && !ENEMY_SCREEN) {
      item.display(item.x, item.y, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    mk.display(); 
    stroke(255); 
    strokeWeight(20); 
    noFill(); 
    textSize(H/40);
    texSiz = H/40; 
    fill(255);
    h.x = displayWidth / 2.13; 
    h.y = displayHeight / 1.714; 
    tex = "* This is the first boss that the player will encounter, MonKing, and he will have multiple phases which will set apart from the regular monsters."; 
    addText(tex, W/53.333, H/2.4, W/16, W/1.063);  
    if (h.dead) {
      background(0); 
      
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
       }
      
      if (!h.inv) {
        h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
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
        item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6,heartMode);
      }
      else{item.display(W/10.667, H/1.865, displayWidth/38.4, displayHeight/21.6,heartMode);}
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
      item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    else if (TEXT_SCREEN) {
      stroke(255);
      strokeWeight(20);
      noFill(); 
      rect(W/16, H/2.4, W/1.14, H/2.57);
      textSize(H/40); 
      texSiz = H/40; 
      fill(255); 
      if (mk.dead) {
        tex = "You killed BirdLock Holmes! Why would you do that??? Okay killer, you gained " + t.exp * rounds + " EXP and " + t.gold * rounds + " GOLD. Happy?"; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else{
        tex = "You farted on BirdLock Holmes! It was so foul that it dealt damage! Dealt " + p.getAT() + " AT and BirdLock now has " + mk.getHP() + " HP left."; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);
      }
    }
    else if (ENEMY_SCREEN) {
      stroke(255); 
      strokeWeight(20); 
      noFill(); 
      rect(W/3.36, H/2.4, W/2.46, H/2.57);
  
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode);
      stroke(237, 245, 7);
      strokeWeight(2);
      line(W/3.01, H/1.99, W/1.5, H/1.99);
      line(W/3.01, H/1.65, W/1.5, H/1.65);
      line(W/3.01, H/1.39, W/1.5, H/1.39);
      
      if (SPEECH_SCREEN) {
        if (mk.currentSentence == " ") {
          int randSen = (int)(Math.random() * 3); 
          mk.currentSentence = mk.dialogue[randSen]; 
         }
        noStroke(); 
        fill(255);
        textSize(H/85);
        texSiz = H/85;
        rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
        triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
        fill(0);  
        addText(mk.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
      }
      
      else if (!SPEECH_SCREEN) {
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
      if (rounds < mk.update.length) {
        String temp = mk.update[rounds];
        tex = "* " + temp; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else {
        tex = "* " + t.update[t.update.length - 1]; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);  
      }  
    }
    
    h.xSpeed = W/160; 
    h.ySpeed = H/90; 
    mk.display(); 
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
  else if (COMBAT && which == 2) { //BIRDLOCK
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
      item.display(W/1.576, H/1.111, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    else if (!arrowPress && !ITEM_SCREEN && !FIGHT_SCREEN && !TEXT_SCREEN && !ENEMY_SCREEN) {
      item.display(item.x, item.y, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    if (h.dead) {
      background(0); 
      
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
       }
      
      if (!h.inv) {
        h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
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
        item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6,heartMode);
      }
      else{item.display(W/10.667, H/1.865, displayWidth/38.4, displayHeight/21.6,heartMode);}
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
      item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    else if (TEXT_SCREEN) {
      stroke(255);
      strokeWeight(20);
      noFill(); 
      rect(W/16, H/2.4, W/1.14, H/2.57);
      textSize(H/40); 
      texSiz = H/40; 
      fill(255); 
      if (t.dead) {
        tex = "You killed BirdLock Holmes! Why would you do that??? Okay killer, you gained " + t.exp * rounds + " EXP and " + t.gold * rounds + " GOLD. Happy?"; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else{
        tex = "You farted on BirdLock Holmes! It was so foul that it dealt damage! Dealt " + p.getAT() + " AT and BirdLock now has " + t.getHP() + " HP left."; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);
      }
    }
    else if (ENEMY_SCREEN) {
      stroke(255); 
      strokeWeight(20); 
      noFill(); 
      rect(W/3.36, H/2.4, W/2.46, H/2.57);
  
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode);
      
      if (SPEECH_SCREEN) {
        if (t.currentSentence == " ") {
          int randSen = (int)(Math.random() * 3); 
          t.currentSentence = t.dialogue[randSen]; 
         }
        noStroke(); 
        fill(255);
        textSize(H/85);
        texSiz = H/85;
        rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
        triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
        fill(0);  
        addText(t.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
      }
      
      else if (!SPEECH_SCREEN) {
        if (attack == 0) {
          //attack = (int)(Math.random() * 2) + 1;
          attack = 1;
        }
        if (attack == 1) {
          t.attack1(hawkPhase);
          if(hawkPhase < 15){
            t.moveHawk(W/100,W/200);
          }
          else if(hawkPhase < 30){
            t.moveHawk(W/100,-W/200);
          }
          hawkPhase++;
          h.damaged(t.getHawkson());
          if(hawkPhase >= 30){
            attack = 0;
            hawkPhase = 0;
            ENEMY_SCREEN = false;
            t.resetHawk();
            t.currentSentence = " "; 
            enPress = false; 
          }
        }
        
        //else if (attack == 2) {
        //  if(!t.attack2(bp0,bp1,bp2,bp3,bp4,bp5)){
        //    bp0.setX(W/3.3);
        //    bp0.setY((float)(Math.random() * H/2.57 + H/2.4));
        //    bp1.setX(W/3.3);
        //    bp1.setY((float)(Math.random() * H/2.57 + H/2.4));
        //    bp2.setX(W/3.3);
        //    bp2.setY((float)(Math.random() * H/2.57 + H/2.4));
        //    bp3.setX(W/3.3);
        //    bp3.setY((float)(Math.random() * H/2.57 + H/2.4));
        //    bp4.setX(W/3.3);
        //    bp4.setY((float)(Math.random() * H/2.57 + H/2.4));
        //    bp5.setX(W/3.3);
        //    bp5.setY((float)(Math.random() * H/2.57 + H/2.4));
        //    count++;
        //  }
        //  h.damaged(bp0);
        //  h.damaged(bp1);
        //  h.damaged(bp2);
        //  h.damaged(bp3);
        //  h.damaged(bp4);
        //  if(millis() - h.getHitTime() > 800){
        //    h.setInv(false);
        //  }
        //  if(count >= 5){
        //    ENEMY_SCREEN = false;
        //    t.currentSentence = " ";
        //    attack = 0; 
        //    count = 0;
        //    enPress = false; 
        //    t.at2 = false;
        //  } 
        //}
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
      if (rounds < t.update.length) {
        String temp = t.update[rounds];
        tex = "* " + temp; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else {
        tex = "* " + t.update[t.update.length - 1]; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);  
      }  
    }
    
    h.xSpeed = W/160; 
    h.ySpeed = H/90; 
    t.display(); 
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
  else if (COMBAT && which == 1) { //TEDDY 
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
      item.display(W/1.576, H/1.111, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    else if (!arrowPress && !ITEM_SCREEN && !FIGHT_SCREEN && !TEXT_SCREEN && !ENEMY_SCREEN) {
      item.display(item.x, item.y, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    if (h.dead) {
      background(0); 
      
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
      if(millis() - h.getHitTime() > 1500){
        h.setInv(false);
       }
      
      if (!h.inv) {
        h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
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
        item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6,heartMode);
      }
      else{item.display(W/10.667, H/1.865, displayWidth/38.4, displayHeight/21.6,heartMode);}
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
      item.display(W/10.667, H/2.209, displayWidth/38.4, displayHeight/21.6,heartMode);
    }
    else if (TEXT_SCREEN) {
      stroke(255);
      strokeWeight(20); 
      noFill(); 
      rect(W/16, H/2.4, W/1.14, H/2.57);
      textSize(H/40); 
      texSiz = H/40; 
      fill(255); 
      if (b.dead) {
        tex = "You killed Teddy Grizzlevelt! Why would you do that??? Okay killer, you gained " + b.exp * rounds + " EXP and " + b.gold * rounds + " GOLD. Happy?"; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else{
        tex = "You farted on Mr. Grizzlevelt! It was so foul that it dealt damage! Dealt " + p.getAT() + " AT and Teddy now has " + b.getHP() + " HP lefb."; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);
      }
    }
    else if (ENEMY_SCREEN) {
      stroke(255); 
      strokeWeight(20); 
      noFill(); 
      rect(W/3.36, H/2.4, W/2.46, H/2.57);
  
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode);
      
      if (SPEECH_SCREEN) {
        if (b.currentSentence == " ") {
          int randSen = (int)(Math.random() * 3); 
          b.currentSentence = b.dialogue[randSen]; 
         }
        noStroke(); 
        fill(255);
        textSize(H/85);
        texSiz = H/85;
        rect(W/1.7297, H/4.737, W/5.818, H/6, 10, 10, 10, 10);  
        triangle(W/1.768, H/3.396, W/1.7297, H/3.529, W/1.7297, H/3.273); 
        fill(0);  
        addText(b.currentSentence, W/160, H/4.737, W/1.7297, W/1.333);
      }
      
      else if (!SPEECH_SCREEN) {
        if (attack == 0) {
          attack = (int)(Math.random() * 2) + 1;
        }
        if (attack == 1) {
          b.attack1();
          if (b.countdown < 400) {
            for (int i = 0; i < b.pellets.size(); i++) {
              Pellet p = b.pellets.get(i); 
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
          b.countdown--; 
          if (b.countdown <= 0) {
            ENEMY_SCREEN = false;
            b.currentSentence = " ";
            b.countdown = 400;
            attack = 0;  
            b.pellets = new ArrayList<Pellet>(); 
            enPress = false; 
          }
        }
     
        else if (attack == 2) {
          if(!b.attack2(p0,p1,p2,p3,p4)){
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
            b.currentSentence = " ";
            attack = 0; 
            count = 0;
            enPress = false; 
            b.at2 = false;
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
      if (rounds < b.update.length) {
        String temp = b.update[rounds];
        tex = "* " + temp; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063); 
      }
      else {
        tex = "* " + b.update[b.update.length - 1]; 
        addText(tex, W/53.333, H/2.4, W/16, W/1.063);  
      }  
    }
    
    h.xSpeed = W/160; 
    h.ySpeed = H/90; 
    b.display(); 
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
            image(TeddyJr, W/32, H/2.25); 
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
    keyHeld = false; 
    arrowPress = true; 
    color tempF = cFirst; 
    color tempS = cSec; 
    cFirst = tempS; 
    cSec = tempF;
  }
  if (keyCode == LEFT && arrowPress && !enPress && COMBAT) {
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
    }
    else if (TEXT_SCREEN) {
      if (n > 1) {
        n = tex.length(); 
        loop();
        n = 1; 
      }
      if ((which == 2 && t.dead) || (which == 1 && b.dead)) {
        background(0); 
        which = 0; 
        COMBAT = false;
        TEXT_SCREEN = false; 
        SPEECH_SCREEN = false; 
        ITEM_SCREEN = false; 
        ENEMY_SCREEN = false; 
        FIGHT_SCREEN = false;
        rounds = 0; 
        p.xSpeed = displayWidth / 160; 
        p.ySpeed = displayHeight / 90;
        p.noDisplay = false; 
        } 
      else { 
        TEXT_SCREEN = false;
        SPEECH_SCREEN = true; 
        ENEMY_SCREEN = true; 
        if (which == 2) {
          t.countdown = 400; 
        }
        else if (which == 1) {
          b.countdown = 400;
        }
        loop();
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
      }
    }
    else{
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
