class JFK extends Monster {
  int countdown;
  boolean at2 = false; 
  int displayCount = 0;
  int phase = 0; 
  public JFK(){
    super("John Fox Kennedy", 20, 5, 5, 15, false, new String[5], new String[3], new String[3], new ArrayList<Pellet>()); 
    setExp((int)(Math.random() * 6) + 2); 
    setGold((int)(Math.random() * 8) + 10); 
    String[] aO = {"placeholder"}; 
    setAO(aO); 
    String[] d = {"The game is afoot", "Intriguing", "Aha! It was you!"};
    setDialogue(d); 
    String[] u = {"Birdlock Holmes studies you", "Birdlock pulls out a magnifying glass", "Birdlock has cracked the case"};
    setUpdate(u); 
    setKatana(new Pellet("katana.png", displayWidth/30.476, displayHeight/15.652, displayWidth/2.7, displayHeight/2.7, 6)); 
    setPhase(0);    
    countdown = 400;
  }
  
  void display() {
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
    smokeGlass.filename = f; 
  }
  void setSmokeGlass(Pellet p) {
    smokeGlass = p;
  }
  void setTurn(boolean t) {
    hawk.turn = t; 
  }
  void setPhase(int p) {
    phase = p;
  }
  void setKatana(Pellet p) {
    katana = p;
  }
}
