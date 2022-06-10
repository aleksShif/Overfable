class Snake extends Monster{
  int countdown; 
  boolean at2 = false;
  boolean released = false;
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
    int W = displayWidth; 
    int H = displayHeight;
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
    if (phase < 15) {
      if (phase < 5) {
        basket = loadImage("basket.png"); 
      }
      else if (phase < 10) {
        basket = loadImage("basket2.png");
      }
      else {
        basket = loadImage("basket3.png");
      }
      basket.resize(basket.width/4, basket.height/4); 
      image(basket, 470, 370);
    }
    else {
      if (phase < 25) {
        basket = loadImage("basket3.png");
        basket.resize(basket.width/4, basket.height/4); 
        image(basket, 470, 370);
      }
      for (int i = 0; i < 15; i++){
        if (countdown % 20 == 0) {
          if (!released) {
            Pellet snak = new Pellet("miniSnake.png", 20, 20, 540, 390, 2);
            pellets.add(snak);     
            snak.displaySnake(phase); 
            released = true; 
          }
        }
        else {
          if (i < pellets.size()) {
            Pellet snak = pellets.get(i); 
            snak.displaySnake(phase); 
            if (snak.xSpeed == 0 || snak.ySpeed == 0) {
              snak.ySpeed = -20; 
              snak.xSpeed = 20; 
              int temp = (int)(Math.random() * 2); 
              if (temp == 0) {
                snak.xSpeed = -20;
              }
              else {
                snak.xSpeed = 20;
              }
            }
            snak.move(snak.xSpeed, snak.ySpeed);  
            snak.inside(2); 
            released = false; 
          }
        }
      }
      countdown -= 1; 
    }
    phase += 1; 
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
