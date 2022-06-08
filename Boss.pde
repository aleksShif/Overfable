public class Boss extends Monster{
  int HP;
  int AT;
  int gold;
  int exp;
  int phase;
  boolean dead = false;
  boolean hurt = false; 
  String name;
  String currentSentence = " "; 
  String[] dialogue; 
  
  public Boss(){
    name = "Advanced Dummy";
    HP = 40;
    AT = 4;
    exp = (int)(Math.random() * 10) + 2; 
    gold = (int)(Math.random() * 12) + 10; 
 
  }
  public Boss(String Name, int hp, int at){
    name = Name;
    HP = hp;
    AT = at;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10;
 
  }
  void damaged(int a){
    HP -= a;
    hurt = true;
  }
  int getHP(){
    return HP;
  }
  
}
