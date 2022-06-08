class Snake extends Monster{
  int countdown; 
  boolean at2 = false;
  String[] dialogue = {"Nom nom nom", "*eating noises*", "Throw me the idol!"};
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
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

  }
  
  void attack2(){

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
