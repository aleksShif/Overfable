public class Monster{
  int HP;
  int AT;
  int gold;
  int exp;
  int countdown;
  int hurtTime = 0;
  boolean hurt = false;
  boolean at2; 
  boolean dead = false; 
  String name;
  String currentSentence = " "; 
  String[] actionOrder;
  String[] dialogue; 
  String[] update; 
  ArrayList<Damageable> pellets; 
    //int countdown; 
  //boolean at2 = false;
  //String[] dialogue = {"Oh dear, that seems to have hurt me", "You'll regret that sir", "Is that supposed to hurt me?"};
  //String[] update = {"Teddy Grizzlevelt bows to you cordially", "Mr. Grizzlevelt anxiously awaits your next move", "Teddy doesn't want to fight anymore"};  
  //String currentSentence = " "; 
  //ArrayList<Pellet> pellets; 
  //int displayCount = 0;
  
  
  public Monster(){
    name = "Dummy";
    HP = 20;
    AT = 3;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10; 
 
  }
  public Monster(String Name, int hp, int at, boolean a, String[] aO, String[] d, String[] u, ArrayList<Damageable> pel){
    name = Name;
    HP = hp;
    AT = at;
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
  
}
