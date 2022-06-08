class BirdLock extends Monster{
  int countdown;
  boolean at2 = false; 
  int displayCount = 0;
  int phase; 
  public BirdLock(){
    super("BirdLock Holmes", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>()); 
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"The game is afoot", "Intriguing", "Aha! It was you!"};
    setDialogue(d); 
    String[] u = {"Birdlock Holmes studies you", "Birdlock pulls out a magnifying glass", "Birdlock has cracked the case"};
    setUpdate(u); 
    setHawk(new Pellet("Hawkson1.png", ourDisplayX/30.476, ourDisplayY/15.652, ourDisplayX/2.7, ourDisplayY/2.7, 6)); 
    setSmokeGlass(new Pellet("smoke1.png", false)); 
    setPhase(0);
    countdown = 400;
  }
  
  void display(){
    int W = ourDisplayX; 
    int H = ourDisplayY;
    PImage bird;
    if(dead){
       bird = loadImage("BirdLock7.png");
       bird.resize(bird.width*W/900, bird.height*W/900);
       image(bird,W/2.55,H/20); 
    }
    else if(hurt){
      bird = loadImage("BirdLock6.png");
      hurtTime++;
      bird.resize(bird.width*W/900, bird.height*W/900);
      if(hurtTime >= 60){
        hurt = false;
        hurtTime = 0;
      }
      else if(hurtTime <= 10){
        image(bird,W/2.5,H/20); 
      }else if(hurtTime <= 20){
        image(bird,W/2.55,H/20); 
      }else if(hurtTime <= 30){
        image(bird,W/2.6,H/20);
      }
      else if(hurtTime <= 40){
        image(bird,W/2.55,H/20); 
      }else if(hurtTime <= 50){
        image(bird,W/2.5,H/20); 
      }else if(hurtTime <= 60){
        image(bird,W/2.55,H/20);
      }
    }
    else{
      if (displayCount <= 10){
        bird = loadImage("BirdLock1.png");
      }
      else if(displayCount <= 20){
        bird = loadImage("BirdLock2.png");
      }
      else if(displayCount <= 30){
        bird = loadImage("BirdLock3.png");
      }
      else if(displayCount <= 40){
        bird = loadImage("BirdLock4.png");
      }
      else{
        displayCount = 0;
        bird = loadImage("BirdLock5.png");
      }
      bird.resize(bird.width*W/900, bird.height*W/900);
      image(bird,W/2.55,H/20); 
    }
    displayCount++;
  }
  
  void attack1(){
    int W = ourDisplayX;
    int H = ourDisplayY; 
    hawk.display(phase);
    if(phase < 30){
      moveHawk(W/165,W/200);
      }
    else if(phase < 38){
      moveHawk(W/150,W/275);
    }
    else if (phase < 40){
      moveHawk(W/130, 0);
    }
    else if (phase < 48) {
      moveHawk(W/150, -W/200);
    }
    else {
      moveHawk(W/165, -W/275);
    }
    phase++;
  }
  
  void moveHawk(float X, float Y){
    hawk.moveHawk(X,Y);
  }
  
  void attack2(){
    int W = ourDisplayX;
    int H = ourDisplayY; 
    displayCount = 9; 
    smokeGlass.displaySmoke(phase);
    if (phase >= 54 && phase < 84) {
      moveSmoke(-W/200, H/200); 
    }
    else if (phase >= 84 && phase < 90) {
      moveSmoke(0, H/200); 
    }
    else if (phase >= 90 && phase < 125) {
      moveSmoke(W/250, H/120); 
    }
    phase++; 
  }
  
  void moveSmoke(float X, float Y) {
    smokeGlass.move(X, Y); 
  }
  
  Damageable getHawkson(){
    return hawk;
  }
  
  Damageable getSmoke(){
    return smokeGlass;
  }
  
  boolean getTurn() {
    return hawk.turn; 
  }
  boolean getHeartIM() {
    return smokeGlass.heartIm;
  }
  String getFile() {
    return smokeGlass.filename; 
  }
  void resetHawk(){
    hawk.reset();
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
  void setHawk(Pellet p) {
    hawk = p;
  }
  void setFile(String f) {
    smokeGlass.filename = f; 
  }
  void setSmokeGlass(Pellet p) {
    smokeGlass = p;
  }
  void setTurn(boolean t) {
    hawk.turn = t; 
  }
  void setPhase(int p) {
    phase = p;
  }
  void setHawkY(float y_) {
    hawk.y = y_;
  }
}
