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
  String[] update = {"Birdlock Holmes studies you", "Birdlock pulls out a magnifying glass", "Birdlock has cracked the case"};  
  
  public MonKing(){
    name = "MonKing";
    HP = 40;
    AT = 4;
    exp = (int)(Math.random() * 10) + 2; 
    gold = (int)(Math.random() * 12) + 10; 
 
  }
  void display(){
    int W = displayWidth; 
    int H = displayHeight;
    PImage monkey;
    if (displayCount <= 10){
        monkey = loadImage("MonKing1.png");
      }
      else if(displayCount <= 20){
        monkey = loadImage("MonKing2.png");
      }
      else if(displayCount <= 30){
        monkey = loadImage("MonKing3.png");
      }
      else if (displayCount <= 40){
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
 }
