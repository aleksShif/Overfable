public class Player{
  int GOLD = 0;
  int AT = 5;
  int HP = 20;
  int DF = 1;
  int LV = 0;
  int EXP = 0;
  boolean MODE;
  float x = displayWidth/3.5;
  float y = displayHeight/1.5;
  int xSpeed = displayWidth / 160;
  int ySpeed = displayHeight / 90; 
  
  Player(boolean mode){
    MODE = mode;
  }
  
  void display() {
    PImage protagonist = loadImage("Tommy.png"); 
    protagonist.resize(protagonist.width * displayWidth/2850, protagonist.height * displayWidth/2850); 
    image(protagonist, x, y); 
  }
  
  void move() {
    if (Up) {y -= ySpeed;}
    if (Down) {y += ySpeed;}
    if (Right) {x -= xSpeed;}
    if (Left) {x += xSpeed;}
  }
  
  int getHP(){
    return HP;
  }
 
  int getLV(){
    return LV;
  }
  
  int getAT(){
    return AT;
  }
  
  int getEXP(){
    return EXP;
  }
  
  int getDF(){
    return DF;
  }
  
  int getGOLD(){
    return GOLD;
  }
  
  void setGOLD(int g){
    GOLD = g;
  }
   void setEXP(int E){
     EXP = E;
   }
  
}
