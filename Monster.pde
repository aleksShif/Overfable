public class Monster{
  String name;
  int HP;
  int AT;
  String[] dialogue;
  int gold;
  int exp;
  String[] actionOrder;
  
  public Monster(){
    name = "Dummy";
    HP = 50;
    AT = 3;
  }
  public Monster(String Name, int hp, int at){
    AT = at;
    HP = hp;
    name = Name;
  }
  void display(){
    fill(255);
    int W = displayWidth; 
    int H = displayHeight; 
    rect(W/2.1, H/2.6, W/100, W/100);
  }
}
