public class Player{
  int GOLD = 0;
  int AT = 5;
  int HP = 20;
  int DF;
  int LV = 0;
  int EXP = 0;
  boolean MODE;
  
  Player(boolean mode){
    MODE = mode;
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
  
  
}
