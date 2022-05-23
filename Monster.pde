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
  
  void attack2(){
    int W = displayWidth; 
    int H = displayHeight; 
    for(int i = 0; i < 5; i++){
      Pellet p0 = new Pellet(2, W/2.46 + W/14.76,H/2.4);
      Pellet p1 = new Pellet(2, W/2.46 + 2*W/14.76,H/2.4);
      Pellet p2 = new Pellet(2, W/2.46 + 3*W/14.76,H/2.4);
      Pellet p3 = new Pellet(2, W/2.46 + 4*W/14.76,H/2.4);
      Pellet p4 = new Pellet(2, W/2.46 + 5*W/14.76,H/2.4);
      int rand = (int)(Math.random()*5);
      while(p0.inside() || p1.inside() || p2.inside() || p3.inside() || p4.inside()){
        switch(rand){
          case 0:
            p0.move(0,1);
            if(p0.inside()){
              p0.display();
            }
          case 1:
            p1.move(0,1);
            if(p1.inside()){
              p1.display();
            }
          case 2:
            p2.move(0,1);
            if(p2.inside()){
              p2.display();
            }
          case 3:
            p3.move(0,1);
            if(p3.inside()){
              p3.display();
            }
          case 4:
            p4.move(0,1);
            if(p4.inside()){
              p4.display();
            }
        }
      }
    }
  }
}
