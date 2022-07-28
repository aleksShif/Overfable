public class Player{
  int GOLD = 0;
  int AT = 6;
  int HP = 20;
  int DF = 1;
  int LV = 0;
  int EXP = 0;
  boolean MODE;
  float x = ourDisplayX/3.5;
  float y = ourDisplayY/1.5;
  int xSpeed = 4;
  int ySpeed = 4; 
  String walkFrame = "TommyWalkDown1.png";
  int walkStagger = 120;
  int walkStart = 0;
  int steps; 
  boolean walking = true;
  boolean preCombat = false; 
  boolean noDisplay = false; 
  boolean frame3UpNext = false;
  boolean frame3DownNext = false;
  
  Player(boolean mode){
    MODE = mode;
  }
  
  void enterCombat() {
    if (h.combatFlash > 0) {
      preCombat = true; 
    }
    else {
      preCombat = false;
    }
    background(0); 
    xSpeed = 0; 
    ySpeed = 0;
    if (preCombat) {
      h.display(x, y, ourDisplayX/38.4, ourDisplayY/21.6,heartMode); 
    }
    else {
      COMBAT = true; 
      h.combatFlash = 10; 
    }
  }
  
  void display() {
    if (p.noDisplay) {
      enterCombat(); 
    }
    else {
      PImage protagonist;
      if(millis() - walkStart >= walkStagger){
        if (Up || Down || Left || Right) {
          if (!s.getScene().equals("entrance")) {
            steps += 1; 
          }
          if (steps % 100 == 0 && p.x < ourDisplayX - ourDisplayX/160 && p.x > ourDisplayX/160 && !s.getScene().equals("entrance")) {
            p.noDisplay = true; 
            enterCombat(); 
          }
        }
        walkStart = millis();
        if(Down){
          if(!sameDirection("DOWN")){
            walkFrame = "TommyWalkDown1.png";
          }
          if(walkFrame == "TommyWalkDown1.png" && !frame3DownNext){
            walkFrame = "TommyWalkDown2.png";
          }
          else if(walkFrame == "TommyWalkDown2.png"){
            walkFrame = "TommyWalkDown1.png";
            frame3DownNext = true;
          }
          else if(walkFrame == "TommyWalkDown1.png" && frame3DownNext){
            walkFrame = "TommyWalkDown3.png";
          }
          else if(walkFrame == "TommyWalkDown3.png"){
            walkFrame = "TommyWalkDown1.png";
            frame3DownNext = false;
          }
        }
        else if(Up){
          if(!sameDirection("UP")){
            walkFrame = "TommyWalkUp1.png";
          }
          if(walkFrame == "TommyWalkUp1.png" && !frame3UpNext){
            walkFrame = "TommyWalkUp2.png";
          }
          else if(walkFrame == "TommyWalkUp2.png"){
            walkFrame = "TommyWalkUp1.png";
            frame3UpNext = true;
          }
          else if(walkFrame == "TommyWalkUp1.png" && frame3UpNext){
            walkFrame = "TommyWalkUp3.png";
          }
          else if(walkFrame == "TommyWalkUp3.png"){
            walkFrame = "TommyWalkUp1.png";
            frame3UpNext = false;
          }
        }
        else if(Left){
          if(!sameDirection("LEFT")){
            walkFrame = "TommyWalkRight1.png";
          }
          if(walkFrame == "TommyWalkRight2.png"){
            walkFrame = "TommyWalkRight1.png";
          }
          else if(walkFrame == "TommyWalkRight1.png"){
            walkFrame = "TommyWalkRight2.png";
          }
        }
        else if(Right){
          if(!sameDirection("RIGHT")){
            walkFrame = "TommyWalkLeft1.png";
          }
          if(walkFrame == "TommyWalkLeft2.png"){
            walkFrame = "TommyWalkLeft1.png";
          }
          else if(walkFrame == "TommyWalkLeft1.png"){
            walkFrame = "TommyWalkLeft2.png";
          }
        }
      }
      //else if(!walking){
      //  if(walkFrame == "TommyWalkUp2.png" || walkFrame == "TommyWalkUp3.png"){
      //    walkFrame = "TommyWalkUp1.png";
      //  }
      //  if(walkFrame == "TommyWalkDown2.png" || walkFrame == "TommyWalkDown3.png"){
      //    walkFrame = "TommyWalkDown1.png";
      //  }
      //  if(walkFrame == "TommyWalkRight2.png"){
      //    walkFrame = "TommyWalkRight1.png";
      //  }
      //  if(walkFrame == "TommyWalkLeft2.png"){
      //    walkFrame = "TommyWalkLeft1.png";
      //  }
      //}
      protagonist = loadImage(walkFrame);
      protagonist.resize(protagonist.width * ourDisplayX/2800, protagonist.height * ourDisplayX/2800); 
      image(protagonist, x, y); 
      
      //textSize(20);
      //text("walking?: " + walking, x,y);  DEBUGGING CODE

      //text("START: " + (millis() - walkStart),x,y-20);  DEBUGGING CODE
      //text("FRAME: " + walkFrame,x,y-40);
     }
  }
  
  boolean sameDirection(String direction){// accepts UP, DOWN, LEFT, RIGHT
    if(walkFrame == "TommyWalkDown2.png" || walkFrame == "TommyWalkDown1.png" || walkFrame == "TommyWalkDown3.png"){
      return (direction == "DOWN");
    }
    else if(walkFrame == "TommyWalkUp2.png" || walkFrame == "TommyWalkUp1.png" || walkFrame == "TommyWalkUp3.png"){
      return (direction == "UP");
    }
    else if(walkFrame == "TommyWalkRight2.png" || walkFrame == "TommyWalkRight1.png"){
      return (direction == "LEFT");
    }
    else if(walkFrame == "TommyWalkLeft2.png" || walkFrame == "TommyWalkLeft1.png"){
      return (direction == "RIGHT");
    }
    return false;
  }
  
  void move() {
    char temp = 'a'; 
    temp = s.inBorder(this); 
    if (Up) {
      if (temp == 'u') {
        ySpeed = 0;
      }
      y -= ySpeed;
      walking = true;
    }
    if (Down) {
      if (temp == 'd') {
        ySpeed = 0;
      }      
      y += ySpeed;
      walking = true;
    }
    if (Right) {
      if (temp == 'r') {
        xSpeed = 0;
      }      
      x -= xSpeed;
      walking = true;
    }
    if (Left) {
      if (temp == 'l') {
        xSpeed = 0;
      }      
      x += xSpeed;
      walking = true;  
    }
    if(!(Up || Down || Left || Right)){
      walking = false;
    }
    xSpeed = 4;
    ySpeed = 4; 
  }
  
  int getHP(){
    return HP;
  }
 
  int getLV(){
    return LV;
  }
  
  int getAT(){
    return AT;
  }
  
  int getEXP(){
    return EXP;
  }
  
  int getDF(){
    return DF;
  }
  
  int getGOLD(){
    return GOLD;
  }
  
  void setGOLD(int g){
    GOLD = g;
  }
   void setEXP(int E){
     EXP = E;
   }
  
}
