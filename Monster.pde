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
    for (int i = 0; i < 20; i++) {
      float X = (float)(Math.random() * W/2.56 + W/3.282); 
      float Y = (float)(Math.random() * H/30 + H/2.308);
      Pellet Np = new Pellet(true, 1, X, Y); 
      Np.setSide("North"); 
      pellets.add(Np);
      
      X = (float)(Math.random() * W/2.56 + W/3.282); 
      Y = (float)(Math.random() * H/30 + H/1.364); 
      Pellet Sp = new Pellet(true, 1, X, Y); 
      pellets.add(Sp); 
      Sp.setSide("South"); 
      pellets.add(Sp); 
      
      Np.display();
      Sp.display();
    }
    int m = millis(); 
     while (millis() - m < 1000) {     
       for (int p = 0; p < pellets.size(); p++) {    
         Pellet current = pellets.get(p); 
         int xSp = 0; 
         int ySp = 0; 
         if (current.getSide().equals("North")) {
           int det = (int)(Math.random() * 2); 
           if (det == 0) {
             xSp = 20; 
            }
           else {
             xSp = -20; 
            }
           ySp = 20; 
          }
         else {
           ySp *= -1; 
          }
         current.move(xSp, ySp); 
        }
      }
  }
             
    //  for (int p = 0; p < pellets.size(); p++) {
    //    Pellet current = pellets.get(p); 
    //    int xSp = 0; 
    //    int ySp = 0; 
    //    if (current.getSide().equals("North")) {
    //      int det = (int)(Math.random() * 2); 
    //      if (det == 0) {
    //        xSp = 20; 
    //      }
    //      else {
    //        xSp = -20; 
    //      }
    //      ySp = 20; 
    //    }
    //    else {
    //      ySp *= -1; 
    //    }
    //    current.move(xSp, ySp); 
    //  }
    //}
        
    //    Y = (float)(Math.random() * H/30 + H/1.364); 
    //    Pellet Sp = new Pellet(true, 1, X, Y); 
    //    pellets.add(Sp); 
    //    Sp.setSide("South"); 
        
    //    while (millis() - 500 < m) {
    //    }
    //    Np.display();
    //    Sp.display();
    //  }
    //  else {
    //    float X = (float)(Math.random() * W/2.56 + W/3.282); 
    //    float Y = (float)(Math.random() * H/30 + H/2.308);
    //    Pellet Np = new Pellet(true, 1, X, Y);
        
    //    Y = (float)(Math.random() * H/30 + H/1.364); 
    //    Pellet Sp = new Pellet(true, 1, X, Y);  
        
    //    Np.display();
    //    Sp.display();
        
    //    for (int p = 0; p < pellets.size(); p++) {
    //      Pellet current = pellets.get(p); 
    //      int xSp = 0; 
    //      int ySp = 0; 
    //      if (current.getSide().equals("North")) {
    //        int det = (int)(Math.random() * 2); 
    //        if (det == 0) {
    //          xSp = 20; 
    //        }
    //        else {
    //          xSp = -20; 
    //        }
    //        ySp = 20; 
    //      }
    //      else {
    //        ySp *= -1; 
    //      }
    //      current.move(xSp, ySp); 
    //    }
        
    //    pellets.add(Np); 
    //    pellets.add(Sp); 
    //    //rect(W/3.36, H/2.4, W/2.46, H/2.57);
    //  }
    //}
  
  
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
