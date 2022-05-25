public class Monster{
  String name;
  int HP;
  int AT;
  String[] dialogue;
  int gold;
  int exp;
  String[] actionOrder;
  ArrayList<Pellet> pellets; 
  
  public Monster(){
    name = "Dummy";
    HP = 50;
    AT = 3;
    pellets = new ArrayList<Pellet>(); 
  }
  public Monster(String Name, int hp, int at){
    AT = at;
    HP = hp;
    name = Name;
    pellets = new ArrayList<Pellet>(); 
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
    if (countdown % 25 == 0) {
      for (int i = 0; i < 2; i++) {
        float X = (float)(Math.random() * W/2.56 + W/3.282); 
        float Y = (float)(Math.random() * H/30 + H/2.308);
        Pellet Np = new Pellet(true, 1, X, Y); 
        Np.setSide("North"); 
        Np.immobileTime = 5; 
        pellets.add(Np);
        
        X = (float)(Math.random() * W/2.56 + W/3.282); 
        Y = (float)(Math.random() * H/30 + H/1.364); 
        Pellet Sp = new Pellet(true, 1, X, Y); 
        pellets.add(Sp); 
        Sp.setSide("South");
        Sp.immobileTime = 5; 
        pellets.add(Sp); 
        
        if (countdown == 200) {
          Np.display(); 
          Sp.display();
        }
      }
    }
   if (countdown < 200 && countdown % 5 == 0) {
     for (int p = 0; p < pellets.size(); p++) {    
       Pellet current = pellets.get(p);
       if (current.immobileTime > 0) {
         current.immobileTime -= 1; 
         continue;
       }
       if (current.xSpeed == 0 || current.ySpeed == 0) {
         int det = (int)(Math.random() * 2); 
           if (det == 0) {
             current.xSpeed = 5;
            }
           else {
             current.xSpeed = -5; 
            }
         current.ySpeed = -5; 
         if (current.getSide().equals("North")) {
           current.ySpeed = 5; 
          }
       }
       current.move(current.xSpeed, current.ySpeed);
       if (!current.inside()) {
         pellets.remove(p); 
         p--; 
       }
      }
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
