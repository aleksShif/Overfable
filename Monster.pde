public class Monster{
  int HP;
  int AT;
  int gold;
  int exp;
  String name;
  boolean hurt = false;
  int hurtTime = 0;
  boolean dead = false; 
  String[] actionOrder;
  String[] dialogue; 
  String[] update; 
  String currentSentence = " "; 
  
  public Monster(){
    name = "Dummy";
    HP = 20;
    AT = 3;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10; 
 
  }
  public Monster(String Name, int hp, int at){
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
