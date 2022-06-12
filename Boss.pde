public class Boss extends Monster{
  Pellet branch1, branch2, branch3, branch4, branch5, branch6;
  int HP;
  int AT;
  int DEF; 
  int gold;
  int exp;
  int cycle; 
  int phase;
  boolean dead = false;
  boolean hurt = false;
  String name;
  String currentSentence = " ";
  String[] dialogue;
  
  public Boss(){
    name = "Advanced Dummy";
    HP = 25;
    AT = 4;
    exp = (int)(Math.random() * 10) + 2; 
    gold = (int)(Math.random() * 12) + 10; 
 
  }
  public Boss(String Name, int hp, int at, int def, int g, int e, boolean a, String[] aO, String[] d, String[] u, ArrayList<Pellet> pel){
    name = Name;
    HP = hp;
    AT = at;
    DEF = def; 
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
  int getDEF() {
    return DEF;
  }
  
}
