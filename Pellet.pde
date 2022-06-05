public class Pellet extends Damageable{
  PImage hawk; 
  PImage smokeGlass; 
  String filename; 
  String side; 
  float size;
  boolean isAt1 = false; 
  boolean heartIm = false; 
  boolean turn = false; 
  int immobileTime = 0; 
  int xSpeed, ySpeed; 
  
  Pellet(String file){
    setAT(6);
    setHitboxX(displayWidth/30.476);
    setHitboxY(displayHeight/15.652);
    setX(displayWidth/2.7);
    setY(displayHeight/2.7); 
    filename = file; 
  }
  Pellet(String file, boolean hM) {
    setAT(5); 
    setX(displayWidth/2.336);
    setY(displayHeight/12);  
    heartIm = hM; 
    filename = file;
  }
  Pellet(int at, float X, float Y, float Size){
    size = Size;
    setX(X);
    setY(Y);
    setAT(at);
    setHitboxX(displayWidth/150);
    setHitboxY(displayWidth/90);
  }
  
  Pellet(boolean _isAt1, int at, float X, float Y){
    isAt1 = _isAt1; 
    if (isAt1) {
      setHitboxX(40); 
      setHitboxY(30); 
    }
    size = 1;
    setX(X);
    setY(Y);
    setAT(at); 
    xSpeed = 0; 
    ySpeed = 0; 
  }
  
  void display(){
    int W = displayWidth; 
    int H = displayHeight; 
    if (isAt1) {
      fill(255);
      noStroke();
      float x_ = getX();
      float y_ = getY(); 
      triangle(x_, y_, x_, y_+H/90, x_+W/160, y_+H/180); 
      triangle(x_+W/160, y_+H/180, x_+W/320, y_+H/60, x_+W/106.667, y_+H/60); 
      triangle(x_+W/160, y_+H/180, x_+W/80, y_+H/90, x_+W/80, y_); 
    }
    else {
      fill(255);
      ellipseMode(RADIUS);
      ellipse(getX(),getY(), size * displayWidth/150, size * displayWidth/90);
    }
  }
  
  void display(int phase){
    if(phase < 30){
      if (turn) {
        filename = "Hawkson1rev.png"; 
      }
      else {
        filename = "Hawkson1.png";
      }
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else if(phase < 35){
      if (turn) {
        filename = "Hawkson2rev.png"; 
      }
      else {
        filename = "Hawkson2.png";
      }      
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else if(phase < 40){
      if (turn) {
        filename = "Hawkson3rev.png"; 
      }
      else {
        filename = "Hawkson3.png";
      }      
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else if(phase < 45){
      if (turn) {
        filename = "Hawkson4rev.png"; 
      }
      else {
        filename = "Hawkson4.png";
      }      
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
    else{
      if (turn) {
        filename = "Hawkson5rev.png"; 
      }
      else {
        filename = "Hawkson5.png";
      }     
      hawk = loadImage(filename);
      hawk.resize(hawk.width * 2, hawk.height * 2);
      image(hawk,x,y);
    }
  }
  
  void displaySmoke(int phase) {
    int W = displayWidth;
    int H = displayHeight;
    if (phase < 30) {
      heartIm = true; 
      filename = "smoke1.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/2, smokeGlass.height/2);
      image(smokeGlass, x, y+H/36); 
    }
    else if (phase < 36) {
      heartIm = true;      
      filename = "smoke2.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/2, smokeGlass.height/2); 
      image(smokeGlass, x-30, y+40);
    }
    else if (phase < 42) {
      heartIm = true;      
      filename = "smoke3.png"; 
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/2, smokeGlass.height/2);  
      image(smokeGlass, x-33, y-50);
    }
    else if (phase < 48) {
      heartIm = true;      
      filename = "smoke4.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/2, smokeGlass.height/2); 
      image(smokeGlass, x-37, y-60);
    }
    else if (phase < 54) {
      heartIm = true;      
      filename = "smoke5.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/2, smokeGlass.height/2);  
      image(smokeGlass, x-55, y-78);
    }
    else if (phase < 125) {
      heartIm = true;      
      filename = "smoke6.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/2, smokeGlass.height/2);   
      image(smokeGlass, x-37, y-58);
    }
    else if (phase < 135) {
      heartIm = true;      
      filename = "smallGlass.png";
      smokeGlass = loadImage(filename); 
      if (phase >= 125 && phase < 130) {
        smokeGlass.resize((int)(smokeGlass.width*1.1), (int)(smokeGlass.height*1.1));
      }
      else if (phase >= 130 && phase < 135) {
        smokeGlass.resize((int)(smokeGlass.width*1.1+20), (int)(smokeGlass.height*1.1+20));
      }
      image(smokeGlass, x+70, y-65);
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
    }
    else if (phase < 260) {
      heartIm = false; 
      filename = "bigGlass.png";
      smokeGlass = loadImage(filename); 
      if (phase >= 160 && phase < 170) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 20), (int)(smokeGlass.height * 1.8 - 20));        
      }
      else if (phase >= 170 && phase < 180) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 40), (int)(smokeGlass.height * 1.8 - 40));       
      }
      else if (phase >= 180 && phase < 190) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 60), (int)(smokeGlass.height * 1.8 - 60));        
      }
      else if (phase >= 190 && phase < 200) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 80), (int)(smokeGlass.height * 1.8 - 80));
        setHitboxX(smokeGlass.width);
        setHitboxY(smokeGlass.height);        
      }
      else if (phase >= 200 && phase < 210) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 100), (int)(smokeGlass.height * 1.8 - 100));        
      }
      else if (phase >= 210 && phase < 220) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 130), (int)(smokeGlass.height * 1.8 - 130));        
      } 
      else if (phase >= 220 && phase < 230) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 160), (int)(smokeGlass.height * 1.8 - 160));        
      }
      else if (phase >= 230 && phase < 240) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 180), (int)(smokeGlass.height * 1.8 - 180));       
      } 
      else if (phase >= 240 && phase < 250) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 200), (int)(smokeGlass.height * 1.8 - 200));        
      }
      else if (phase >= 250 && phase < 260) {
        smokeGlass.resize((int)(smokeGlass.width * 1.8 - 230), (int)(smokeGlass.height * 1.8 - 230));        
      }       
      else {
        smokeGlass.resize((int)(smokeGlass.width * 1.8), (int)(smokeGlass.height * 1.8));
      }
      image(smokeGlass, x+20, y-100);
      setHitboxX(smokeGlass.width - 250); 
      setHitboxY(smokeGlass.height - 350); 
      h.display(h.x, h.y, displayWidth/38.4, displayHeight/21.6,heartMode); 
    }
    else if (phase < 280) {
      setX(displayWidth/2.336);
      setY(displayHeight/12);
      filename = " "; 
    }
  }
  
  void setSide(String s) {
    side = s; 
  }
  
  String getSide() {
    return side; 
  }
  
  void moveHawk(float X, float Y){
    if (turn) {
      x-=X;
      y+=Y;
    }
    else {
      x+=X;
      y+=Y;
    }
  }
  
  void moveSmoke(float X, float Y){
    x += X; 
    y += Y; 
  }
  
  void reset(){
    x = displayWidth/2.7;
    y = displayHeight/2.7;
  }
  
  boolean getHeartIM(){
    return heartIm;
  }
  //void move(float X, float Y){
  //  setX(x+X);
  //  setY(y+Y);
  //  rotate(PI/12);
  //}

}
