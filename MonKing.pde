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
  String[] dialogue; 
  String[] update; 
  
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
        monkey = loadImage("MonKing0.png");
      }
      else if(displayCount <= 20 || (displayCount > 30 && displayCount <= 40)){
        monkey = loadImage("MonKing1.png");
      }
      else if(displayCount <= 30){
        monkey = loadImage("MonKing2png.png");
      }
      else if (displayCount <= 40){
        monkey = loadImage("MonKIng3.png");
      }
      else{
        displayCount = 0; 
        monkey = loadImage("MonKing4.png"); 
      }
      monkey.resize(monkey.width*W/700, monkey.height*W/700);
      image(monkey,W/2.35,H/8.5);
      displayCount += 1; 
    }
 }
