public class Player{
  int GOLD = 0;
  int AT;
  int HP = 20;
  int DF;
  int LV = 1;
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
  
}
