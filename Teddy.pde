class Teddy extends Monster{
  int countdown; 
  boolean at2 = false;
  String[] actionOrder; 
  int displayCount = 0;
  public Teddy(){
    super("Teddy", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>()); 
    setExp((int)(Math.random() * 4) + 2); 
    setGold((int)(Math.random() * 6) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"Oh dear, that seems to have hurt me", "You'll regret that sir", "Is that supposed to hurt me?"};
    setDialogue(d); 
    String[] u = {"Teddy Grizzlevelt bows to you cordially", "Mr. Grizzlevelt anxiously awaits your next move", "Teddy doesn't want to fight anymore"};
    setUpdate(u); 
    countdown = 400; 
    String[] temp = {"Teddy Grizzlevelt bows to you cordially", "Mr. Grizzlevelt anxiously awaits your next move", "Teddy doesn't want to fight anymore"}; 
    update = temp;
  }
  void display(){
    int W = displayWidth; 
    int H = displayHeight;
    PImage bear;
    if(dead){
       bear = loadImage("FancyBear5.png");
       bear.resize(bear.width*W/700, bear.height*W/700);
       image(bear,W/2.35,H/8.5); 
    }
    else if(at2){
      hurtTime++;
      if(hurtTime <= 15){
        bear = loadImage("FancyBear4.png"); 
      }else if(hurtTime <= 30){
        bear = loadImage("FancyBear6.png"); 
      }else if(hurtTime <= 45){
        bear = loadImage("FancyBear7.png");
      }
      else if(hurtTime <= 60){
        bear = loadImage("FancyBear8.png"); 
      }else if(hurtTime <= 75){
        bear = loadImage("FancyBear4.png");
      }else if(hurtTime <= 90){
        bear = loadImage("FancyBear6.png");
      }else if(hurtTime <= 105){
        bear = loadImage("FancyBear7.png");
      }else if(hurtTime <= 120){
        bear = loadImage("FancyBear8.png");
      }
      else if(hurtTime <= 135){
        bear = loadImage("FancyBear4.png"); 
      }else if(hurtTime <= 150){
        bear = loadImage("FancyBear6.png"); 
      }else if(hurtTime <= 165){
        bear = loadImage("FancyBear7.png");
      }
      else if(hurtTime <= 180){
        bear = loadImage("FancyBear8.png"); 
      }else if(hurtTime <= 195){
        bear = loadImage("FancyBear4.png");
      }else if(hurtTime <= 210){
        bear = loadImage("FancyBear6.png");
      }else if(hurtTime <= 235){
        bear = loadImage("FancyBear7.png");
      }else{
        bear = loadImage("FancyBear8.png"); 
      }
      bear.resize(bear.width*W/700, bear.height*W/700);
      image(bear,W/2.35,H/8.5); 
    }
    else if(hurt && !at2){
      bear = loadImage("FancyBear4.png");
      hurtTime++;
      bear.resize(bear.width*W/700, bear.height*W/700);
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
      bear.resize(bear.width*W/700, bear.height*W/700);
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
        Pellet Np = new Pellet(true, 3, X, Y); 
        Np.setSide("North"); 
        Np.immobileTime = 5; 
        pellets.add(Np);
        
        X = (float)(Math.random() * W/2.56 + W/3.282); 
        Y = (float)(Math.random() * H/30 + H/1.364); 
        Pellet Sp = new Pellet(true, 3, X, Y); 
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
     //if (countdown < 400) {      
     //  for (int i = 0; i < pellets.size(); i++) {         
     //    Pellet p = pellets.get(i); 
     //    p.display(); 
     //    h.damaged(p);
     //    if (h.getCurrentHP() <= 0) {
     //      h.dead = true;
     //      break; 
     //    }
     //    if(millis() - h.getHitTime() > 1500){
     //      h.setInv(false);
     //    }
     //   }
     // }
     //if (countdown <= 0) {
     //  ENEMY_SCREEN = false;
     //  currentSentence = " ";
     //  countdown = 400;
     //  attack = 0;  
     //  pellets = new ArrayList<Pellet>(); 
     //  enPress = false; 
     //}
   }
  
  boolean attack2(Pellet p0, Pellet p1, Pellet p2, Pellet p3, Pellet p4, Pellet p5, Pellet p6, Pellet p7){
    at2 = true;
    int W = displayWidth; 
    int H = displayHeight;    
    if(p0.inside() || p1.inside() || p2.inside() || p3.inside() || p4.inside()|| p5.inside() || p6.inside() || p7.inside()){
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
      if(p5.inside()){
        for(int i = 0; i < 8; i++){
          p5.move(0,1);
        }
      }
      if(p6.inside()){
        for(int i = 0; i < 8; i++){
          p6.move(0,1);
        }
      }
      if(p7.inside()){
        for(int i = 0; i < 8; i++){
          p7.move(0,1);
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
      if(p5.inside()){
        p5.display();
      }
      if(p6.inside()){
        p6.display();
      }
      if(p7.inside()){
        p7.display();
      }
      return true;
    }else{
      return false;
    }
  }
  void setExp(int e) {
    exp = e; 
  }
  void setGold(int g) {
    gold = g;
  }
  void setAO(String[] aO) {
    actionOrder = aO;
  }
  void setDialogue(String[] d) {
    dialogue = d;
  }
  void setUpdate(String[] u) {
    update = u;
  }
}
