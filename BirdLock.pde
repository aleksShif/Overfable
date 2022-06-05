class BirdLock extends Monster{
  int countdown;
  boolean at2 = false;
  String[] dialogue = {"The game is afoot", "Intriguing", "Aha! It was you!"};
  String currentSentence = " "; 
  ArrayList<BirdPellet> pellets; 
  Hawkson hawk = new Hawkson();
  int displayCount = 0;
  public BirdLock(){
    name = "BirdLock";
    HP = 20;
    AT = 3;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10;
    String[] temp = {"The game is afoot", "Intriguing", "Aha! It was you!"};
    update = temp;
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
    hawk.move(X,Y);
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
  
  void resetHawk(){
    hawk.reset();
  }
}
