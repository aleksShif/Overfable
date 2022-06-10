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
  float cbx = 500;
  float cby = 550;
  float cbyv = 5;
  final float downY = ourDisplayY/2.4;
  final float rightX = ourDisplayX/3.36;
  final float upY = ourDisplayY/2.4 + ourDisplayY/2.57;
  final float leftX = ourDisplayX/3.36 + ourDisplayX/2.46;
  final float midX = ourDisplayX/3.36 + ourDisplayX/2.46/2;
  final float midY = ourDisplayY/2.4 + ourDisplayY/2.57/2;
  float downy = ourDisplayY/2.4;
  float rightx = ourDisplayX/3.36;
  float upy = ourDisplayY/2.4 + ourDisplayY/2.57;
  float leftx = ourDisplayX/3.36 + ourDisplayX/2.46;
  float midx = ourDisplayX/3.36 + ourDisplayX/2.46/2;
  float midy = ourDisplayY/2.4 + ourDisplayY/2.57/2;
  boolean diagonal = false;
   //rect(W/3.36, H/2.4, W/2.46, H/2.57);
  
  public Blackbeak(){
    super("Blackbeak and Blackbill", 20, 3, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>());
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"Ahoy scurvy dog!", "Arrgh, you'll never find me booty!", "Shiver me timbers!"};
    setDialogue(d); 
    String[] u = {"Blackbeak and Blackbill ambush you.", "Blackbill battens down the hatches.", "Blackbill gets the plank ready for you to walk."}; 
    setUpdate(u); 
    countdown = 400; 
    setCannon(new Pellet("Cannon.png", 50, 50, canX, canY, 2)); //file, hbx, hby, x, y
    setCBall(new Pellet("Cannonball.png", 30, 30, canX, canY, 4)); //file, hbx, hby, x, y
    setCutlassUp(new Pellet("CutlassUp.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
    setCutlassDown(new Pellet("CutlassDown.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
    setCutlassLeft(new Pellet("CutlassLeft.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
    setCutlassRight(new Pellet("CutlassRight.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
    setCutlassUpleft(new Pellet("CutlassUpleft.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
    setCutlassUpright(new Pellet("CutlassUpright.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
    setCutlassDownright(new Pellet("CutlassDownright.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
    setCutlassDownleft(new Pellet("CutlassDownleft.png", 30, 30, canX, canY, 3)); //file, hbx, hby, x, y
  }
  
  void display(){
    int W = ourDisplayX; 
    int H = ourDisplayY;
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
    cball.displayCBall();
  }
  
  void attack2(){
    if(!diagonal){
      cutlassUp.displayCutlass(1);
      cutlassDown.displayCutlass(2);
      cutlassRight.displayCutlass(3);
      cutlassLeft.displayCutlass(4);
    }
    else{
      cutlassUpright.displayCutlass(5);
      cutlassUpleft.displayCutlass(6);
      cutlassDownleft.displayCutlass(8);
      cutlassDownright.displayCutlass(7);
    }
  }
 
  void setCannon(Pellet p){
    cannon = p;
  }
  
  Damageable getCannon(){
    return cannon;
  }
 
  void setCBall(Pellet p){
    cball = p;
  }
  
  Damageable getCBall(){
    return cball;
  }
  
  void setCutlassUp(Pellet p){
    cutlassUp = p;
  }
  
  Damageable getCutlassUp(){
    return cutlassUp;
  }
  
  void setCutlassDown(Pellet p){
    cutlassDown = p;
  }
  
  Damageable getCutlassDown(){
    return cutlassDown;
  }
  
  void setCutlassLeft(Pellet p){
    cutlassLeft = p;
  }
  
  Damageable getCutlassLeft(){
    return cutlassRight;
  }
  
  void setCutlassRight(Pellet p){
    cutlassUpright = p;
  }
  
  Damageable getCutlassRight(){
    return cutlassUpright;
  }
  
  void setCutlassUpright(Pellet p){
    cutlassUpleft = p;
  }
  
  Damageable getCutlassUpright(){
    return cutlassDownleft;
  }
  
  void setCutlassUpleft(Pellet p){
    cutlassDownright= p;
  }
  
  Damageable getCutlassUpleft(){
    return cutlassDownleft;
  }
  
  void setCutlassDownleft(Pellet p){
    cutlassDownleft = p;
  }
  
  Damageable getCutlassDownleft(){
    return cutlassDownright;
  }
  
  void setCutlassDownright(Pellet p){
    cutlassDownright = p;
  }
  
  Damageable getCutlassDownright(){
    return cutlassDownright;
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
