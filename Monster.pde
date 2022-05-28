public class Monster{
  int HP;
  int AT;
  int gold;
  int exp;
  int countdown; 
  String name;
  boolean hurt = false;
  int hurtTime = 0;
  boolean dead = false; 
  String[] actionOrder;
  String[] dialogue = {"Oh dear, that seems to have hurt me", "You'll regret that sir", "Is that supposed to hurt me?"};
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
  
  public Monster(){
    name = "Dummy";
    HP = 20;
    AT = 3;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10; 
    pellets = new ArrayList<Pellet>(); 
    countdown = 400; 
  }
  public Monster(int count, String Name, int hp, int at){
    name = Name;
    HP = hp;
    AT = at;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10;
    pellets = new ArrayList<Pellet>();
    countdown = count;  
  }
  void damaged(int a){
    HP -= a;
    hurt = true;
  }
  int getHP(){
    return HP;
  }
  void display(){
    int W = displayWidth; 
    int H = displayHeight;
    PImage bear;
    if(dead){
       bear = loadImage("FancyBear5.png");
       bear.resize(bear.width*2, bear.height*2);
       image(bear,W/2.35,H/8.5); 
    }
    else if(hurt){
      bear = loadImage("FancyBear4.png");
      hurtTime++;
      bear.resize(bear.width*2, bear.height*2);
      if(hurtTime >= 60){
        hurt = false;
        hurtTime = 0;
      }
      else if(hurtTime <= 10){
        image(bear,W/2.3,H/8.5); 
      }else if(hurtTime <= 20){
        image(bear,W/2.35,H/8.5); 
      }else if(hurtTime <= 30){
        image(bear,W/2.4,H/8.5);
      }
      else if(hurtTime <= 40){
        image(bear,W/2.35,H/8.5); 
      }else if(hurtTime <= 50){
        image(bear,W/2.3,H/8.5); 
      }else if(hurtTime <= 60){
        image(bear,W/2.35,H/8.5);
      }
    }
    else{
      if (displayCount <= 10){
        bear = loadImage("FancyBear0.png");
      }
      else if(displayCount <= 20 || (displayCount > 30 && displayCount <= 40)){
        bear = loadImage("FancyBear1.png");
      }
      else if(displayCount <= 30){
        bear = loadImage("FancyBear2.png");
      }
      else{
        displayCount = 0;
        bear = loadImage("FancyBear0.png");
      }
      bear.resize(bear.width*2, bear.height*2);
      image(bear,W/2.35,H/8.5); 
    }
    displayCount++;
  }

  void attack1(){
    int W = displayWidth; 
    int H = displayHeight; 
    if (countdown % 50 == 0) {
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
        
        if (countdown == 400) {
          Np.display(); 
          Sp.display();
        }
      }
    }
   if (countdown < 400 && countdown % 5 == 0) {
     for (int p = 0; p < pellets.size(); p++) {    
       Pellet current = pellets.get(p);
       if (current.immobileTime > 0) {
         current.immobileTime -= 1; 
         continue;
       }
       if (current.xSpeed == 0 || current.ySpeed == 0) {
         int det = (int)(Math.random() * 2); 
           if (det == 0) {
             current.xSpeed = 9;
            }
           else {
             current.xSpeed = -9; 
            }
         current.ySpeed = -9; 
         if (current.getSide().equals("North")) {
           current.ySpeed = 9; 
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
    if(p0.inside() || p1.inside() || p2.inside() || p3.inside() || p4.inside()){
      if(p0.inside()){
        for(int i = 0; i < 8; i++){
          p0.move(0,1);
        }
      }
      if(p1.inside()){
        for(int i = 0; i < 8; i++){
          p1.move(0,1);
        }
      }
      if(p2.inside()){
        for(int i = 0; i < 8; i++){
          p2.move(0,1);
        }
      }
      if(p3.inside()){
        for(int i = 0; i < 8; i++){
          p3.move(0,1);
        }
      }
      if(p4.inside()){
        for(int i = 0; i < 8; i++){
          p4.move(0,1);
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
  }
}
