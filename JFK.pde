class JFK extends Monster {
  int countdown;  
  int displayCount = 0;
  int phase;
  int count = 0;
  public JFK(){
    super("John Fox Kennedy", 20, 5, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>()); 
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"VOTE JFK 1964", "What a fine day to write in a topless car", "For honor"};
    setDialogue(d); 
    String[] u = {"John Fox Kennedy tries to win your vote unsuccessfully", "Fox Kennedy adjusts his samurai hat nervously", "John Fox Kennedy sharpens his katana"};
    setUpdate(u); 
    setHat(new Pellet("hat.png", 50, 50, 200, 250, 6));
    setPhase(0);    
    countdown = 400;
  }
  
  void display() {
    int W = ourDisplayX; 
    int H = ourDisplayY;
    PImage jfk;
    if(dead){
       jfk = loadImage("JFKDead.png");
       jfk.resize((int)(jfk.width *0.85), (int)(jfk.height *0.85));
       image(jfk,W/2.45,H/9.99);
    }
    else if(hurt){
      jfk = loadImage("JFKHurt.png");
      hurtTime++;
      jfk.resize((int)(jfk.width *0.85), (int)(jfk.height *0.85));
      if(hurtTime >= 60){
        hurt = false;
        hurtTime = 0;
      }
      else if(hurtTime <= 10){
        image(jfk,W/2.4,H/9.99);
      }else if(hurtTime <= 20){
        image(jfk,W/2.45,H/9.99);
      }else if(hurtTime <= 30){
        image(jfk,W/2.5,H/9.99);
      }
      else if(hurtTime <= 40){
        image(jfk,W/2.45,H/9.99);
      }else if(hurtTime <= 50){
        image(jfk,W/2.4,H/9.99);
      }else if(hurtTime <= 60){
        image(jfk,W/2.45,H/9.99);
      }
    }
    else{
      if (displayCount <= 10){
        jfk = loadImage("JFK1.png");
      }
      else if(displayCount <= 20){
        jfk = loadImage("JFK2.png");
      }
      else{
        displayCount = 0;
        jfk = loadImage("JFK1.png");
      }
      jfk.resize((int)(jfk.width *0.85), (int)(jfk.height *0.85));
      image(jfk,W/2.45,H/9.99);
      displayCount++;
    }
  }
  
  void attack1(){
    int W = ourDisplayX;
    int H = ourDisplayY; 
    for (int i = 0; i < 9; i++){
      if (countdown == 400) {
        Pellet kat = new Pellet("hiddenKatana.png", W/188.235, H/30, W/3.82 + (i*(W/21.333)), H/1.6, 5);
        pellets.add(kat);
      }
      else{
        Pellet kat = pellets.get(i);
        if (countdown > 0 && countdown%40 == 0) {
          kat.next = false; 
          count = 0; 
          kat.displayKatana();
        }
        else if (countdown > 0 && countdown%20 == 0) {
          int temp = (int)(Math.random() * 2) + 1;
          if (temp == 1) {
            if (count < 3) {
              int t = (int)(Math.random() * 2) + 1; 
              if (t == 1) {
                kat.next = true; 
                count++;
              }
              else {
                kat.next = false; 
              }
            }
          }
        }
        else if (countdown > 0 && countdown%20 != 0){
          kat.displayKatana();
          if ((countdown - 2) % 20 == 0 && (countdown - 2) % 40 != 0){
            kat.filename = "hiddenKatana.png"; 
            kat.setX(W/3.82 + (i*(W/21.333)));
            kat.setY(H/1.6); 
            kat.setHitboxX(W/188.235);
            kat.setHitboxY(H/30); 
          }
          else if ((countdown - 1) % 20 == 0 && kat.next) {
            kat.filename = "katana.png";
            kat.move(0, (H/3.9) * -1);
            kat.setHitboxX(W/188.235);
            kat.setHitboxY(H/3.396); 
          }
        }
      }
    }  
  }
  
  void attack2(){
    hat.displayHat(phase);
    phase++;
    if (phase >= 40 && count < 3) {
      setPhase(0);
      hat.turn = !hat.turn; 
      hat.setY(hat.y += 70); 
      count += 1;
    }
    if (phase >= 40 && count == 3) {
      hat.setX(200);
      hat.setY(250);
    }
  }
  Damageable getHat() {
    return hat;
  }
  PImage getImg() {
    return hat.hat;   
  }
  void setExp(int e) {
    exp = e; 
  }
  void setGold(int g) {
    gold = g;
  }
  void setPel(ArrayList<Pellet> p) {
    pellets = p;
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
  void setFile(String f) {
    katana.filename = f; 
  }
  void setSmokeGlass(Pellet p) {
    smokeGlass = p;
  }
  void setTurn(boolean t) {
    hat.turn = t; 
  }
  void setPhase(int p) {
    phase = p;
  }
  void setKatana(Pellet p) {
    katana = p;
  }
  void setHat(Pellet p) {
    hat = p;
  }
}
