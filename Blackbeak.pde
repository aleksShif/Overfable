class Blackbeak extends Monster{
  int countdown; 
  boolean at2 = false;
  String[] dialogue;
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
  float rectX = displayWidth/3.36;
  float rectY = displayHeight/2.46;
  float rectInc = displayWidth/180;
  float canX = 420;
  float canY = 540;
  
  public Blackbeak(){
    super("Blackbeak and Blackbill", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>());
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"Nom nom nom", "*eating noises*", "Throw me the idol!"};
    setDialogue(d); 
    String[] u = {"Indiana pengs dances to pengs music", "Indiana pengs dances to Indiana Jones music", "Indiana pengs licks his lips"}; 
    setUpdate(u); 
    countdown = 400; 
    setCannon(new Pellet("Cannon.png", 50, 50, canX, canY, 2)); //file, hbx, hby, x, y
  }
  
  void display(){
    int W = displayWidth; 
    int H = displayHeight;
    PImage pengs;
    if(dead){
      pengs = loadImage("PenguinsDead.png");
      pengs.resize(pengs.width*W/1550, pengs.height*W/1550);
      image(pengs,W/2.48,H/20.2);
    }
    else if(hurt){
      pengs = loadImage("PenguinsHurt.png");
      pengs.resize(pengs.width*W/1550, pengs.height*W/1550);
      hurtTime++;
      if(hurtTime >= 60){
        hurt = false;
        hurtTime = 0;
      }
      else if(hurtTime <= 10){
        image(pengs,W/2.43,H/20.2); 
      }else if(hurtTime <= 20){
        image(pengs,W/2.48,H/20.2);
      }else if(hurtTime <= 30){
        image(pengs,W/2.52,H/20.2);
      }
      else if(hurtTime <= 40){
        image(pengs,W/2.48,H/20.2); 
      }else if(hurtTime <= 50){
        image(pengs,W/2.43,H/20.2);
      }else if(hurtTime <= 60){
        image(pengs,W/2.48,H/20.2);
      }
    }
    else{
      if (displayCount <= 15){
        pengs = loadImage("Penguins1.png");
      }
      else if(displayCount <= 30){
        pengs = loadImage("Penguins2.png");
      }
      else{
        displayCount = 0;
        pengs = loadImage("Penguins1.png");
      }
      pengs.resize(pengs.width*W/1550, pengs.height*W/1550);
      image(pengs,W/2.48,H/20.2);
    }
    displayCount++;
  }
 

  void attack1(){
    cannon.displayCannon();
  }
  
  void attack2(){

  }
 
  void setCannon(Pellet p){
    cannon = p;
  }
  
  Pellet getCannon(){
    return cannon;
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
}
