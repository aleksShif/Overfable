class Jaws extends Monster{
  int countdown; 
  boolean at2 = false;
  String[] dialogue = {"Nom nom nom", "*eating noises*", "Throw me the idol!"};
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
  float rectX = displayWidth/3.36;
  float rectY = displayHeight/2.46;
  float rectInc = displayWidth/180;
  boolean right = true;
  boolean whipFinished = false;
  
  public Jaws(){
    super("Indiana Jaws", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>());
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"Nom nom nom", "*eating noises*", "Throw me the idol!"};
    setDialogue(d); 
    String[] u = {"Indiana Jaws dances to Jaws music", "Indiana Jaws dances to Indiana Jones music", "Indiana Jaws licks his lips"}; 
    setUpdate(u); 
    countdown = 400; 
    setSharkFin(new Pellet("sharkFin.png", ourDisplayX/25.859, ourDisplayY/16.162, ourDisplayX/3.36, ourDisplayY/1.5, 6)); //file, hbx, hby, x, y
  }
  
  void display(){
    int W = ourDisplayX; 
    int H = ourDisplayY;
    PImage jaws;
    if(dead){
      jaws = loadImage("JawsDead.png");
      jaws.resize(jaws.width*W/1750, jaws.height*W/1750);
      image(jaws,W/2.45,H/8.5);
    }
    else if(hurt){
      jaws = loadImage("JawsHurt.png");
      jaws.resize(jaws.width*W/1750, jaws.height*W/1750);
      hurtTime++;
      if(hurtTime >= 60){
        hurt = false;
        hurtTime = 0;
      }
      else if(hurtTime <= 10){
        image(jaws,W/2.4,H/8.5); 
      }else if(hurtTime <= 20){
        image(jaws,W/2.45,H/8.5);
      }else if(hurtTime <= 30){
        image(jaws,W/2.5,H/8.5);
      }
      else if(hurtTime <= 40){
        image(jaws,W/2.45,H/8.5); 
      }else if(hurtTime <= 50){
        image(jaws,W/2.4,H/8.5);
      }else if(hurtTime <= 60){
        image(jaws,W/2.45,H/8.5);
      }
    }
    else{
      if(at2){
        if(displayCount <= 10){
          jaws = loadImage("JawsWhip1.png");
        }
        else if(displayCount <= 20){
          jaws = loadImage("JawsWhip2.png");
        }
        else{
          jaws = loadImage("JawsWhip1.png");
          displayCount = 0;
        }
      }
      else{
        if (displayCount <= 10){
          jaws = loadImage("Jaws1.png");
        }
        else if(displayCount <= 20){
          jaws = loadImage("Jaws2.png");
        }
        else if(displayCount <= 30){
          jaws = loadImage("Jaws3.png");
        }
        else if(displayCount <= 40){
          jaws = loadImage("Jaws4.png");
        }
        else{
          displayCount = 0;
          jaws = loadImage("Jaws4.png");
        }
      }
      jaws.resize(jaws.width*W/1750, jaws.height*W/1750);
      image(jaws,W/2.45,H/8.5);
    }
    displayCount++;
  }
  
  void setSharkFin(Pellet p){
    sharkFin = p;
  }
  
  Pellet getSharkFin(){
    return sharkFin;
  }
 
  void attack1(){
    at2 = false;
    sharkFin.displayFin();
    fill(255);
    rect(ourDisplayX/3.36, sharkFin.y+ 2*sharkFin.hitboxY + ourDisplayY/200, ourDisplayX/2.46, ourDisplayY/2.4 + ourDisplayY/2.57 - sharkFin.y - 2*sharkFin.hitboxY );
  }
  
  void attack2(){
    at2 = true;
    fill(255);
    rect(rectX, rectY, displayWidth/80, displayHeight/3.5);
    rectX += rectInc;
    if(rectX >= displayWidth/3.36 + displayWidth/2.5 && right){
      rectInc *= -1;
      right = false;
    }
    if(rectX <= displayWidth/3.36 && !right){
      rectX = displayWidth/3.36;
      whipFinished = true;
    }
  }
  
  boolean getWhipFinished(){
    return whipFinished;
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
  boolean getFinFinished(){
    return sharkFin.getFinFinished();
  }
}
