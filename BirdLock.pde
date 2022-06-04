class BirdLock extends Monster{
  int countdown;
  boolean at2 = false;
  String[] actionOrder; 
  String[] dialogue; 
  String[] update; 
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
  public BirdLock(){
    super("BirdLock", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>()); 
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"The game is afoot", "Intriguing", "Aha! It was you!"};
    setDialogue(d); 
    String[] u = {"Birdlock Holmes studies you", "Birdlock pulls out a magnifying glass", "Birdlock has cracked the case"};
    setUpdate(u); 
    setHawk(new Pellet("Hawkson1.png")); 
    countdown = 400;
  }
  void display(){
    int W = displayWidth; 
    int H = displayHeight;
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
  
  void attack1(int phase){
    hawk.display(phase);
  }
  
  void moveHawk(float X, float Y){
    hawk.moveHawk(X,Y);
  }
  
  boolean attack2(BirdPellet bp0, BirdPellet bp1, BirdPellet bp2, BirdPellet bp3, BirdPellet bp4, BirdPellet b5){
                  //rect(W/3.36, H/2.4, W/2.46, H/2.57);
    if(bp0.inside() || bp1.inside() || bp2.inside() || bp3.inside() || bp4.inside() || bp5.inside()){
      if(bp0.inside()){
        for(int i = 0; i < 8; i++){
          bp0.move(1,0);
        }
      }
      if(bp1.inside()){
        for(int i = 0; i < 8; i++){
          bp1.move(1,0);
        }
      }
      if(bp2.inside()){
        for(int i = 0; i < 8; i++){
          bp2.move(1,0);
        }
      }
      if(bp3.inside()){
        for(int i = 0; i < 8; i++){
          bp3.move(1,0);
        }
      }
      if(bp4.inside()){
        for(int i = 0; i < 8; i++){
          bp4.move(1,0);
        }
      }
      if(bp5.inside()){
        for(int i = 0; i < 8; i++){
          bp5.move(1,0);
        }
      }
      if(bp0.inside()){
        bp0.display();
      }
      if(bp1.inside()){
        bp1.display();
      }
      if(bp2.inside()){
        bp2.display();
      }
      if(bp3.inside()){
        bp3.display();
      }
      if(bp4.inside()){
        bp4.display();
      }
      if(bp5.inside()){
        bp5.display();
      }
      return true;
    }else{
      return false;
    }
  }
  
  Damageable getHawkson(){
    return hawk;
  }
  
  boolean getTurn() {
    return hawk.turn; 
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
  void setTurn(boolean t) {
    hawk.turn = t; 
  }
  void setHawkY(float y_) {
    hawk.y = y_;
  }
}
