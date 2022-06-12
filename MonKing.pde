class MonKing extends Boss{
  int countdown; 
  int displayCount = 0; 

  public MonKing(){
    super("Monking", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>()); 
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
    countdown = 400;
  }
  void display(){
    int W = ourDisplayX; 
    int H = ourDisplayY;
    PImage monkey;
    if (displayCount <= 15){
        monkey = loadImage("MonKing1.png");
      }
      else if(displayCount <= 30){
        monkey = loadImage("MonKing2.png");
      }
      else if(displayCount <= 45){
        monkey = loadImage("MonKing3.png");
      }
      else if (displayCount <= 60){
        monkey = loadImage("MonKing4.png");
      }
      else{
        displayCount = 0; 
        monkey = loadImage("MonKing1.png"); 
      }
      monkey.resize(monkey.width * W/600, monkey.height * W/600);
      image(monkey,W/2.35,H/8.5);
      displayCount += 1; 
    }
    
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
 }
