class Hawkson extends Damageable{
  String filename = "Hawkson1.png";
  float x, y;
  float size;
  PImage hawk;
  
  Hawkson(){
    setAT(6);
    setHitboxX(displayWidth/150);
    setHitboxY(displayWidth/90);
  }
  
  void display(int phase){
    int W = displayWidth; 
    int H = displayHeight;
    if(phase < 5){
      filename = "Hawkson1.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,W/2.7,H/2.7);
    }
    else if(phase < 10){
      filename = "Hawkson2.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,W/2.7,H/2.7);
    }
    else if(phase < 15){
      filename = "Hawkson3.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,W/2.7,H/2.7);
    }
    else if(phase < 20){
      filename = "Hawkson4.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,W/2.7,H/2.7);
    }
    else{
      filename = "Hawkson5.png";
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,W/2.7,H/2.7);
    }
  }
}
