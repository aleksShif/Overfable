class Jaws extends Monster{
  int countdown; 
  boolean at2 = false;
  String[] dialogue = {"Nom nom nom", "*eating noises*", "Throw me the idol!"};
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
  
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
    setSharkFin(new Pellet("sharkFin.png", displayWidth/30.476, displayHeight/15.652, displayWidth/2.7, displayHeight/2.7, 6));
  }
  
  void display(){
    int W = displayWidth; 
    int H = displayHeight;
    PImage jaws;
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
    jaws.resize(jaws.width*W/450, jaws.height*W/450);
    image(jaws,W/2.45,H/8.5);
    displayCount++;
  }
  
  void setSharkFin(Pellet p){
    sharkFin = p;
  }
 
  void attack1(){
    
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