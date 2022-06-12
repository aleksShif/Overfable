class MonKing extends Boss{
  int HP;
  int AT;
  int gold;
  int exp;
  int phase;
  int displayCount = 0; 
  boolean dead = false;
  boolean hurt = false; 
  String name;
  String currentSentence = " "; 
  String[] dialogue = {"The game is afoot", "Intriguing", "Aha! It was you!"};
  
  public MonKing(){
    name = "MonKing";
    HP = 40;
    AT = 4;
    exp = (int)(Math.random() * 10) + 2; 
    gold = (int)(Math.random() * 12) + 10; 
    String[] temp = {"Birdlock Holmes studies you", "Birdlock pulls out a magnifying glass", "Birdlock has cracked the case"};  
    update = temp;
  }
  void display(){
    int W = ourDisplayX; 
    int H = ourDisplayY;
    PImage monkey;
    if (displayCount <= 15){
        monkey = loadImage("MonKing1.png");
      }
      else if(displayCount <= 30){
        monkey = loadImage("MonKing2.png");
      }
      else if(displayCount <= 45){
        monkey = loadImage("MonKing3.png");
      }
      else if (displayCount <= 60){
        monkey = loadImage("MonKing4.png");
      }
      else{
        displayCount = 0; 
        monkey = loadImage("MonKing1.png"); 
      }
      monkey.resize(monkey.width * W/600, monkey.height * W/600);
      image(monkey,W/2.35,H/8.5);
      displayCount += 1; 
    }
    
    //branch updown
    //banana be thrown
    //monkey falling
    //sword + cannon
    //crying + fin
    
  void attack1(){
      
  }
  
  void setBranch1(Pellet p){
    branch1 = p;
  }
  
  Damageable getBranch1(){
    return branch1;
  }
  
  void setBranch2(Pellet p){
    branch2 = p;
  }
  
  Damageable getBranch2(){
    return branch2;
  }
  
  void setBranch3(Pellet p){
    branch3 = p;
  }
  
  Damageable getBranch3(){
    return branch3;
  }
  
  void setBranch4(Pellet p){
    branch4 = p;
  }
  
  Damageable getBranch4(){
    return branch4;
  }
  
  void setBranch5(Pellet p){
    branch5 = p;
  }
  
  Damageable getBranch5(){
    return branch5;
  }
  
  void setBranch6(Pellet p){
    branch6 = p;
  }
  
  Damageable getBranch6(){
    return branch6;
  }
  //Pellet branchL1, branchR1, branchL2, branchR2, branchL3, branchR3;
 }
