public class Monster{
  String name;
  int HP;
  int AT;
  String[] dialogue;
  int gold;
  int exp;
  String[] actionOrder;
  ArrayList pellets; 
  
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
      if (i == 0 || i % 3 != 0) {
        float X = (float)(Math.random() * W/2.56 + W/3.282); 
        float Y = (float)(Math.random() * H/30 + H/2.308);
        Pellet Np = new Pellet(true, 1, X, Y);
        pellets.add(Np);
        
        Y = (float)(Math.random() * H/30 + H/1.364); 
        Pellet Sp = new Pellet(true, 1, X, Y); 
        pellets.add(Sp); 
        
        Np.display();
        Sp.display(); 
        //rect(W/3.36, H/2.4, W/2.46, H/2.57);
      }
      else {
        for (int p = 0; p < pellets.size(); p++) {
          int xSp = (int)(Math.random() * 3)-1; 
    }
    
  }
  
  boolean attack2(Pellet p0, Pellet p1, Pellet p2, Pellet p3, Pellet p4){
    int W = displayWidth; 
    int H = displayHeight;


    //for(int i = 0; i < 3; i++){
      //Pellet p0 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
      //Pellet p1 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
      //Pellet p2 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
      //Pellet p3 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
      //Pellet p4 = new Pellet(2, (float)Math.random() * W/2.46 + W/3.36,H/2.3,0.5);
      if(p0.inside() || p1.inside() || p2.inside() || p3.inside() || p4.inside()){
        int rand = (int)(Math.random()*5);
        switch(rand){
          case 0:
            if(p0.inside()){
              for(int i = 0; i < 3; i++){
                p0.move(0,1);
              }
            }
          case 1:
            if(p1.inside()){
              for(int i = 0; i < 3; i++){
                p1.move(0,1);
              }
            }
          case 2:
            if(p2.inside()){
              for(int i = 0; i < 3; i++){
                p2.move(0,1);
              }
            }
          case 3:
            if(p3.inside()){
              for(int i = 0; i < 3; i++){
                p3.move(0,1);
              }
            }
          case 4:
            if(p4.inside()){
              for(int i = 0; i < 3; i++){
                p4.move(0,1);
              }
            }
        }
        if(p0.inside()){
          p0.display();
        }
        if(p1.inside()){
          p1.display();
        }
        if(p2.inside()){
          p2.display();
        }
        if(p3.inside()){
          p3.display();
        }
        if(p4.inside()){
          p4.display();
        }
        return true;
      }else{return false;}
    //}
  }
}
