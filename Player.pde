public class Player{
  int GOLD = 0;
  int AT = 5;
  int HP = 20;
  int DF = 1;
  int LV = 0;
  int EXP = 0;
  boolean MODE;
  float x = displayWidth/3.5;
  float y = displayHeight/1.5;
  int xSpeed = displayWidth / 160;
  int ySpeed = displayHeight / 90; 
  int walkingCount = 0;
  String walkFrame = "TommyWalkDown1.png";
  int walkStagger = 80;
  int walkStart = 0;
  boolean walking = true;
  
  Player(boolean mode){
    MODE = mode;
  }
  
  void display() {
    PImage protagonist;
    if(millis() - walkStart >= walkStagger){
      walkStart = millis();
      if(Down){
        if(walkingCount % 4 == 0){
          walkFrame = "TommyWalkDown1.png";
        }else if(walkingCount % 4 == 1){
          walkFrame = "TommyWalkDown2.png";
        }else if(walkingCount % 4 == 2){
          walkFrame = "TommyWalkDown1.png";
        }else{
          walkFrame = "TommyWalkDown3.png";
        }
      }
      else if(Up){
        if(walkingCount % 4 == 0){
          walkFrame = "TommyWalkUp1.png";
        }else if(walkingCount % 4 == 1){
          walkFrame = "TommyWalkUp2.png";
        }else if(walkingCount % 4 == 2){
          walkFrame = "TommyWalkUp1.png";
        }else{
          walkFrame = "TommyWalkUp3.png";
        }
      }
      else if(Left){
        if(walkingCount % 2 == 0){
           walkFrame = "TommyWalkRight1.png";
        }else{
          walkFrame = "TommyWalkRight2.png";
        }
      }
      else if(Right){
        if(walkingCount % 2 == 0){
           walkFrame = "TommyWalkLeft1.png";
        }else{
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
    walkingCount++;
    protagonist.resize(protagonist.width * displayWidth/2800, protagonist.height * displayWidth/2800); 
    image(protagonist, x, y); 
  }
  
  void move() {
    if (Up) {
      y -= ySpeed;
      walking = true;
    }
    if (Down) {
      y += ySpeed;
      walking = true;
    }
    if (Right) {
      x -= xSpeed;
      walking = true;
    }
    if (Left) {
      x += xSpeed;
      walking = true;  
    }
    else{walking = false;}
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
