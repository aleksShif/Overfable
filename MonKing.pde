class MonKing extends Boss{
  PImage monkey; 
  PImage monk1, monk2, monk3, monk4, monkHurt, monkDead;
  int countdown; 
  int displayCount = 0; 
  int setCount = 0;   
  float L1y = ourDisplayY/2.4 - 50;
  float L2y = L1y + 90;
  float L3y = L1y + 180;
  float L1Y = ourDisplayY/2.4 - 50;
  float L2Y = L1Y + 90;
  float L3Y = L1Y + 180;  
  float R1y = L1Y;
  float R2y = L2Y;
  float R3y = L3Y;
  float R1Y = L1Y;
  float R2Y = L2Y;
  float R3Y = L3Y;
  float Lx = ourDisplayX/3.36;
  float Rx = ourDisplayX/3.36 + ourDisplayX/2.46 - 225;
  float LX = ourDisplayX/3.36;
  float RX = ourDisplayX/3.36 + ourDisplayX/2.46 - 225;
  boolean falling = false;
  float X = ourDisplayX/2.35;
  float Y = 0;
  int numFalls = 0;
  //rect(W/3.36, H/2.4, W/2.46, H/2.57);
  public MonKing(){
    super("Monking", 18, 3, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>()); 
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"The game is afoot", "Intriguing", "Aha! It was you!"};
    setDialogue(d); 
    String[] u = {"Birdlock Holmes studies you", "Birdlock pulls out a magnifying glass", "Birdlock has cracked the case"};
    setUpdate(u); 
    //setHawk(new Pellet("Hawkson1.png", ourDisplayX/30.476, ourDisplayY/15.652, ourDisplayX/2.7, ourDisplayY/2.7, 6)); 
    //setSmokeGlass(new Pellet("smoke1.png", false)); 
    setPhase(0);
    setCycle(1);
    countdown = 400;  
    setBranch1(new Pellet("BranchL1.png", 20, 60, X, Y, 3)); //file, hbx, hby, x, y
    setBranch2(new Pellet("BranchL2.png", 20, 60, X, Y, 3)); //file, hbx, hby, x, y
    setBranch3(new Pellet("BranchL3.png", 60, 20, X, Y, 3)); //file, hbx, hby, x, y
    setBranch4(new Pellet("BranchR1.png", 60, 20, X, Y, 3)); //file, hbx, hby, x, y
    setBranch5(new Pellet("BranchR2.png", 45, 45, X, Y, 3)); //file, hbx, hby, x, y
    setBranch6(new Pellet("BranchR3.png", 45, 45, X, Y, 3)); //file, hbx, hby, x, y
    monk1 = loadImage("MonKing1.png"); 
    monk1.resize((int)(monk1.width * 0.66), (int)(monk1.height * 0.66)); 
    monk2 = loadImage("MonKing2.png");
    monk2.resize((int)(monk2.width * 0.66), (int)(monk2.height * 0.66));         
    monk3 = loadImage("MonKing3.png");
    monk3.resize((int)(monk3.width * 0.66), (int)(monk3.height * 0.66));         
    monk4 = loadImage("MonKing4.png"); 
    monk4.resize((int)(monk4.width * 0.66), (int)(monk4.height * 0.66));         
    monkHurt = loadImage("MonKing5.png"); 
    monkHurt.resize((int)(monkHurt.width * 0.66), (int)(monkHurt.height * 0.66));     
    monkDead = loadImage("MonKing6.png"); 
    monkDead.resize((int)(monkDead.width * 0.66), (int)(monkDead.height * 0.66));     
    monkey = monk1; 
  }
  
  void display(){
    int W = ourDisplayX; 
    int H = ourDisplayY;
    if(dead){
       monkey = monkDead;
       image(monkey,W/2.45,H/9.99);
    }
    else if(hurt){
      monkey = monkHurt;
      if (cycle == 2) {
        monkey = monkHurt;
      }
      hurtTime++;
      if(hurtTime >= 60){
        hurt = false;
        hurtTime = 0;
      }
      else if(hurtTime <= 10){
        image(monkey,W/2.4,H/9.99);
      }else if(hurtTime <= 20){
        image(monkey,W/2.45,H/9.99);
      }else if(hurtTime <= 30){
        image(monkey,W/2.5,H/9.99);
      }
      else if(hurtTime <= 40){
        image(monkey,W/2.45,H/9.99);
      }else if(hurtTime <= 50){
        image(monkey,W/2.4,H/9.99);
      }else if(hurtTime <= 60){
        image(monkey,W/2.45,H/9.99);
      }
    }
    else {
      if (!falling) {
        if (cycle == 1) {
          if (displayCount <= 15){
              monkey = monk1;
            }
            else if(displayCount <= 30){
              monkey = monk2;
            }
            else if(displayCount <= 45){
              monkey = monk3;
            }
            else if (displayCount <= 60){
              monkey = monk4;
            }
            else{
              displayCount = 0; 
              monkey = monk1; 
            }
            image(monkey,W/2.45,H/9.99);
            displayCount += 1;
        }
        else if (cycle == 2) {
          if (setCount == 0) {
            monk1 = loadImage("(2)MonKing1.png"); 
            monk1.resize((int)(monk1.width*0.66), (int)(monk1.height*0.66));                       
            monk2 = loadImage("(2)MonKing2.png");
            monk2.resize((int)(monk2.width * 0.66), (int)(monk2.height * 0.66));                       
            monk3 = loadImage("(2)MonKing3.png");
            monk3.resize((int)(monk3.width * 0.66), (int)(monk3.height * 0.66));           
            monk4 = loadImage("(2)MonKing4.png"); 
            monk4.resize((int)(monk4.width * 0.66), (int)(monk4.height * 0.66));           
            monkHurt = loadImage("(2)MonKing5.png"); 
            monkHurt.resize((int)(monkHurt.width * 0.66), (int)(monkHurt.height * 0.66));           
            monkey = monk1;           
            setCount += 1; 
          }
          if (displayCount <= 15){
              monkey = monk1;            
            }
            else if(displayCount <= 30){
              monkey = monk2;
            }
            else if(displayCount <= 45){
              monkey = monk3;
            }
            else if (displayCount <= 60){
              monkey = monk4;
            }
            else{
              displayCount = 0; 
              monkey = monk1; 
            }
            image(monkey, W/2.45,H/9.99);
            displayCount += 1;          
          }
          else if (cycle == 3) {
            if (setCount == 0) {
              monk1 = loadImage("(3)MonKing1.png"); 
              monk1.resize((int)(monk1.width * 0.66), (int)(monk1.height * 0.66));                       
              monk2 = loadImage("(3)MonKing2.png");
              monk2.resize((int)(monk2.width * 0.66), (int)(monk2.height * 0.66));                       
              monk3 = loadImage("(3)MonKing3.png");
              monk3.resize((int)(monk3.width * 0.66), (int)(monk3.height * 0.66));           
              monk4 = loadImage("(3)MonKing4.png"); 
              monk4.resize((int)(monk4.width * 0.66), (int)(monk4.height * 0.66));           
              monkHurt = loadImage("(3)MonKing5.png"); 
              monkHurt.resize((int)(monkHurt.width * 0.66), (int)(monkHurt.height * 0.66));           
              monkey = monk1;           
              setCount += 1; 
            }
            if (displayCount <= 15){
                monkey = monk1;            
            }
            else if(displayCount <= 30){
              monkey = monk2;
            }
            else if(displayCount <= 45){
              monkey = monk3;
            }
            else if (displayCount <= 60){
              monkey = monk4;
            }
            else{
              displayCount = 0; 
              monkey = monk1; 
            }
            image(monkey, W/2.45,H/9.99);
            displayCount += 1;          
          }
        }
      else{
        if(displayCount > 20 && displayCount <= 30){
          monkey = loadImage("MonFalling1.png");
          monkey.resize(monkey.width * 1, monkey.height * 1);
          image(monkey,X,Y);
          Y += 10;
        }
        else if(displayCount > 30 && displayCount <= 40){
          monkey = loadImage("MonFalling2.png");
          monkey.resize(monkey.width * 1, monkey.height * 1);
          image(monkey,X,Y);
          Y += 10;
        }
        else if(displayCount > 40){
          displayCount = 21;
          monkey = loadImage("MonFalling1.png");
          monkey.resize(monkey.width * 1, monkey.height * 1);
          image(monkey,X,Y);
          Y += 10;
        }
        displayCount++;
        if(Y > ourDisplayY){
          Y = 0;
          X = (float)(Math.random() * (ourDisplayX/2.46-85)) + ourDisplayX/3.36;
          numFalls++;
        }
      }
    }
  }

    
    //branch updown
    //banana be thrown
    //monkey falling
    //sword + cannon
    //crying + fin

  void setBranch1(Pellet p){
    branch1 = p;
  }
  
  Damageable getBranch1(){
    return branch1;
  }
  
  void setBranch2(Pellet p){
    branch2 = p;
  }
  
  Damageable getBranch2(){
    return branch2;
  }
  
  void setBranch3(Pellet p){
    branch3 = p;
  }
  
  Damageable getBranch3(){
    return branch3;
  }
  
  void setBranch4(Pellet p){
    branch4 = p;
  }
  
  Damageable getBranch4(){
    return branch4;
  }
  
  void setBranch5(Pellet p){
    branch5 = p;
  }
  
  Damageable getBranch5(){
    return branch5;
  }
  
  void setBranch6(Pellet p){
    branch6 = p;
  }
  
  Damageable getBranch6(){
    return branch6;
  }
  //Pellet branchL1, branchR1, branchL2, branchR2, branchL3, branchR3;
 
 
    void attack1() {
      
    }
    
    void attack2() {
      int W = ourDisplayX;
      int H = ourDisplayY;
      //415, 985 (LEFT, RIGHT) 330, 640 (UP, DOWN)
      if (countdown % 100 == 0) {
        for (int i = 0; i < 2; i++) {
          float X = (float)(Math.random() * W/2.56 + W/3.282); 
          float Y = (float)(Math.random() * H/30 + H/2.308);
          Pellet Np = new Pellet("Banana1.png", 30, 30, X, Y, 2); 
          Np.setSide("North"); 
          Np.immobileTime = 5; 
          pellets.add(Np);
          
          X = (float)(Math.random() * W/2.56 + W/3.282); 
          Y = (float)(Math.random() * H/30 + H/1.364); 
          Pellet Sp = new Pellet("Banana1.png", 30, 30, X, Y, 2); 
          pellets.add(Sp); 
          Sp.setSide("South");
          Sp.immobileTime = 5; 
          pellets.add(Sp); 
          
          X = (float)(Math.random() * 51 + 935); 
          Y = (float)(Math.random() * 311 + 330); 
          Pellet Ep = new Pellet("Banana1.png", 30, 30, X, Y, 2); 
          pellets.add(Ep); 
          Ep.setSide("East");
          Ep.immobileTime = 5; 
          pellets.add(Ep);  
          
          X = (float)(Math.random() * 51 + 415); 
          Y = (float)(Math.random() * 311 + 330); 
          Pellet Wp = new Pellet("Banana1.png", 30, 30, X, Y, 2); 
          pellets.add(Wp); 
          Wp.setSide("South");
          Wp.immobileTime = 5; 
          pellets.add(Wp);              
        }
      }
     if (countdown < 400 && countdown % 15 == 0) {
       for (int p = 0; p < pellets.size(); p++) {    
         Pellet current = pellets.get(p);
         if (current.immobileTime > 0) {
           current.immobileTime -= 1; 
           continue;
         }
         if (current.xSpeed == 0 || current.ySpeed == 0) {
           if (current.getSide().equals("North") || current.getSide().equals("South")) {
             int det = (int)(Math.random() * 2); 
             if (det == 0) {
               current.xSpeed = 9;
                }
             else {
               current.xSpeed = -9; 
                }
             current.ySpeed = -9; 
             if (current.getSide().equals("North")) {
               current.ySpeed = 9; 
              }
           }
           else if (current.getSide().equals("East") || current.getSide().equals("West")) {
             int det = (int)(Math.random() * 2);
             if (det == 0) {
               current.ySpeed = 9;
             }
             else {
               current.ySpeed = -9;
             }
             current.xSpeed = -9; 
             if (current.getSide().equals("West")) {
               current.xSpeed = 9; 
             }
           }            
         }
         current.move(current.xSpeed, current.ySpeed);
         if (!current.inside()) {
           pellets.remove(p); 
           p--; 
        }
      }
    }      
  }
  void attack3() {
    f.attack2();
    j.attack2(); 
    if (j.whipFinished && f.phase < 40) {
      j.whipFinished = false;
      j.setSharkFin(new Pellet("sharkFin.png", ourDisplayX/25.859, ourDisplayY/16.162, ourDisplayX/3.36, ourDisplayY/1.5, 6)); //file, hbx, hby, x, y
      j.setSharkWhip(new Pellet("JawsWhipL.png", 7.5, 130, j.rectX, j.rectY, 6)); //file, hbx, hby, x, y       
      j.rectX = j.rectx;
      j.rectY = j.recty;
      j.right = true;
      j.whipFinished = false;     
      j.rectInc = 10;
      j.whipFinished = false; 
      j.phase = 0; 
      j.sharkWhip.count = 0; 
    }
  }
  void attack4() {
    if(!b.attack2(p0,p1,p2,p3,p4,p5,p6,p7)){
      if (count < 5 || count > 350) {
        p0.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p0.setY(ourDisplayY/2.3);
        p1.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p1.setY(ourDisplayY/2.3);
        p2.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p2.setY(ourDisplayY/2.3);
        p3.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p3.setY(ourDisplayY/2.3);
        p4.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p4.setY(ourDisplayY/2.3);
        p5.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p5.setY(ourDisplayY/2.3);
        p6.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p6.setY(ourDisplayY/2.3);
        p7.setX((float)(Math.random() * ourDisplayX/2.46 + ourDisplayX/3.36));
        p7.setY(ourDisplayY/2.3);
      }
      count++;
      }
    j.attack1(); 
  }
  void attack5(){
    falling = true;
  }
  void setExp(int e) {
    exp = e; 
  }
  void setGold(int g) {
    gold = g;
  }
  void setPel(ArrayList<Pellet> p) {
    pellets = p;
  }
  void setAO(String[] aO) {
    actionOrder = aO;
  }
  void setDialogue(String[] d) {
    dialogue = d;
  }
  void setUpdate(String[] u) {
    update = u;
  }
  void setFile(String f) {
    smokeGlass.filename = f; 
  }
  void setTurn(boolean t) {
    hawk.turn = t; 
  }
  void setPhase(int p) {
    phase = p;
  }
  void setCycle(int c) {
    cycle = c; 
  }
}
