class BirdLock extends Monster{
  int countdown;
  boolean at2 = false;
  String[] dialogue = {"Oh dear, that seems to have hurt me", "You'll regret that sir", "Is that supposed to hurt me?"};
  String[] update = {"Teddy Grizzlevelt bows to you cordially", "Mr. Grizzlevelt anxiously awaits your next move", "Teddy doesn't want to fight anymore"};  
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
  public BirdLock(){
    name = "Dummy";
    HP = 20;
    AT = 3;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10; 
  }
  public BirdLock(int count, String Name, int hp, int at){
    name = Name;
    HP = hp;
    AT = at;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10;
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
}
