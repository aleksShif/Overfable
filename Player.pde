public class Player{
  int GOLD = 0;
  int AT = 5;
  int HP = 20;
  int DF = 1;
  int LV = 0;
  int EXP = 0;
  boolean MODE;
  
  Player(boolean mode){
    MODE = mode;
  }
  
  void display() {
    PImage protagonist = loadImage("Protag.png"); 
    protagonist.resize(200, 200); 
    image(protagonist, 300, 900); 
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
