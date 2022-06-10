public class Monster{
  Pellet hawk, smokeGlass, sharkFin, sharkWhip, katana, hat, snake; 
  int HP;
  int AT;
  int gold;
  int exp;
  int countdown;
  int hurtTime = 0;
  int phase = 0; 
  boolean hurt = false;
  boolean at2; 
  boolean dead = false; 
  String name;
  String currentSentence = " "; 
  String[] actionOrder;
  String[] dialogue; 
  String[] update; 
  ArrayList<Pellet> pellets; 
  
  public Monster(){
    name = "Dummy";
    HP = 20;
    AT = 3;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10; 
 
  }
  public Monster(String Name, int hp, int at, int g, int e, boolean a, String[] aO, String[] d, String[] u, ArrayList<Pellet> pel){
    name = Name;
    HP = hp;
    AT = at;
    gold = g; 
    exp = e; 
    at2 = a; 
    actionOrder = aO; 
    dialogue = d; 
    update = u; 
    pellets = pel;
  }
  void damaged(int a){
    HP -= a;
    hurt = true;
  }
  int getHP(){
    return HP;
  }
  int getExp() {
    return exp;
  }
  int getGold() {
    return gold;
  }
  String getName(){
    return name;
  }
  void setExp(int e) {
    exp = e; 
  }
  void setGold(int g) {
    gold = g; 
  }
}
