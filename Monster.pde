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
    rect(W/2 - W/20, H/5, W/10, W/10);
  }

  void attack1(){
    int W = displayWidth; 
    int H = displayHeight; 
    for(int i = 0; i < 10; i++){
      float Y = (float)(Math.random() * H/2.57 + H/2.4);
      Damageable d = new Damageable(2, W/3.36, Y);
      while(d.getX() < W/2.46){
        d.move(1,0);
        //d.display();
      }
      //rect(W/3.36, H/2.4, W/2.46, H/2.57);
    }
    
  }
}
