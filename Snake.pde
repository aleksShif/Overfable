class Snake extends Monster{
  PImage bask, bask2, bask3;
  int countdown; 
  boolean at2 = false;
  String currentSentence = " "; 
  int displayCount = 0;
  int phase = 0; 
  float rectX = displayWidth/3.36;
  float rectY = displayHeight/2.46;
  float rectInc = displayWidth/180; 
  
  public Snake(){
    super("Snake", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>());
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"Nom nom nom", "*eating noises*", "Throw me the idol!"};
    setDialogue(d); 
    String[] u = {"Indiana snake dances to snake music", "Indiana snake dances to Indiana Jones music", "Indiana snake licks his lips"}; 
    setUpdate(u);
    //setSnake(new Pellet("miniSnake.png", ourDisplayX/30.476, ourDisplayY/15.652, ourDisplayX/2.7, ourDisplayY/2.7, 6)); 
    countdown = 400; 
  }
  
  void display(){
    int W = ourDisplayX; 
    int H = ourDisplayY;
    PImage snake;
    if(dead){
      snake = loadImage("SnakeDead.png");
      snake.resize(snake.width*W/1850, snake.height*W/1850);
      image(snake,W/2.55,H/22.2);
    }
    else if(hurt){
      snake = loadImage("SnakeHurt.png");
      snake.resize(snake.width*W/1850, snake.height*W/1850);
      hurtTime++;
      if(hurtTime >= 60){
        hurt = false;
        hurtTime = 0;
      }
      else if(hurtTime <= 10){
        image(snake,W/2.5,H/22.2); 
      }else if(hurtTime <= 20){
        image(snake,W/2.55,H/22.2);
      }else if(hurtTime <= 30){
        image(snake,W/2.6,H/22.2);
      }
      else if(hurtTime <= 40){
        image(snake,W/2.55,H/22.2); 
      }else if(hurtTime <= 50){
        image(snake,W/2.5,H/22.2);
      }else if(hurtTime <= 60){
        image(snake,W/2.55,H/22.2);
      }
    }
    else{
      if (displayCount <= 10){
        snake = loadImage("Snake1.png");
      }
      else if(displayCount <= 20){
        snake = loadImage("Snake2.png");
      }
      else{
        displayCount = 0;
        snake = loadImage("Snake1.png");
      }
      snake.resize(snake.width*W/1850, snake.height*W/1850);
      image(snake,W/2.55,H/22.2);
    }
    displayCount++;
  }
 

  void attack1(){
    PImage basket; 
    if (phase == 0) {
        bask = loadImage("basket.png");
        bask.resize(bask.width/5, bask.height/5); 
        bask2 = loadImage("basket2.png");
        bask2.resize(bask2.width/5, bask2.height/5); 
        bask3 = loadImage("basket3.png");
        bask3.resize(bask3.width/5, bask3.height/5); 
    }
    if (phase > 0 && phase < 15) {
      if (phase < 5) {
        basket = bask; 
      }
      else if (phase < 10) {
        basket = bask2; 
      }
      else {
        basket = bask3; 
      }
      image(basket, 500, 420); 
    }
    else if (phase >= 15) {
      print(" " + countdown + " "); 
      if (phase < 25) {
        image(bask3, 500, 420);
      }
      for (int i = 0; i < 10; i++){
        if (countdown == 400) {
          Pellet snak = new Pellet("miniSnake.png", 20, 20, 450 + (50*i), 420, 2);
          snak.setXSpeed(0);
          snak.setYSpeed(0);
          pellets.add(snak);      
          print(" " + pellets.size() + " "); 
        }
        else if (countdown < 400 && countdown % 5 == 0) {
            Pellet snak = pellets.get(i);  
            if (snak.xSpeed == 0 || snak.ySpeed == 0) {
              snak.ySpeed = -5;
              snak.xSpeed = 5; 
              int temp = (int)(Math.random() * 2); 
              if (temp == 0) {
                snak.xSpeed = -5;
              }
              else {
                snak.xSpeed = 5;
              }
            }
            if (i == 1) {
              print("  |" + snak.xSpeed + " "+ snak.ySpeed + "|  "); 
            }
            snak.inside(2); 
            snak.move(snak.xSpeed, snak.ySpeed);              
            if (snak.ySpeed < 0) {
              if (snak.xSpeed < 0) {
                if (snak.finalSnake == snak.snake5) {
                  snak.finalSnake = snak.snake2;
                }
                else {
                  snak.finalSnake = snak.snake5;
                }
              }
              else{
                if (snak.finalSnake == snak.snake6) {
                  snak.finalSnake = snak.snake;
                }
                else {
                  snak.finalSnake = snak.snake6; 
                }
              }
            }
            else if (snak.ySpeed > 0) {
              if (snak.xSpeed < 0) {
                if (snak.finalSnake == snak.snake8) {
                  snak.finalSnake = snak.snake3;  
                }
                else {
                  snak.finalSnake = snak.snake8;
                }
              }
              else{
                if (snak.finalSnake == snak.snake7) {
                  snak.finalSnake = snak.snake4;
                }
                else {
                  snak.finalSnake = snak.snake7; 
                }
              }
            }  
          }
        }
      }
    }
  
  void attack2(){

  }
 
  void setSnake(Pellet p) {
    snake = p;
  }
  void setPhase(int p) {
    phase = p;
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
}
