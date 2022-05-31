class Hawkson extends Damageable{
  String filename = "Hawkson1.png";
  float x = displayWidth/2.7;
  float y = displayHeight/2.7;
  float size;
  PImage hawk;
  
  Hawkson(){
    setAT(6);
    setHitboxX(displayWidth/10);
    setHitboxY(displayWidth/10);
  }
  
  void display(int phase){
    if(phase < 15){
      filename = "Hawkson1.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else if(phase < 30){
      filename = "Hawkson2.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else if(phase < 45){
      filename = "Hawkson3.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else if(phase < 60){
      filename = "Hawkson4.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else{
      filename = "Hawkson5.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
  }
  
  void move(float X, float Y){
    x+=X;
    y+=Y;
  }
  
  void reset(){
    x = displayWidth/2.7;
    y = displayHeight/2.7;
  }
}
