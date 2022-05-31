class BirdPellet extends Damageable{
  
  BirdPellet(float X, float Y){
    setX(X);
    setY(Y);
    setAT(2);
    
  }
  
  void display(){
    int W = displayWidth; 
    int H = displayHeight; 
    fill(255);
    noStroke();
    float x_ = getX();
    float y_ = getY(); 
    triangle(x_, y_, x_, y_+H/90, x_+W/160, y_+H/180); 
    triangle(x_+W/160, y_+H/180, x_+W/320, y_+H/60, x_+W/106.667, y_+H/60); 
  }
}
