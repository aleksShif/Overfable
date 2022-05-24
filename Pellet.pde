public class Pellet extends Damageable{
  float size;
  
  Pellet(int at, float X, float Y, float Size){
    size = Size;
    setX(X);
    setY(Y);
    setAT(at);
  }
  
  Pellet(int at, float X, float Y){
    size = 1;
    setX(X);
    setY(Y);
    setAT(at);
  }
  
  void display(){
    fill(255);
    ellipseMode(RADIUS);
    ellipse(getX(),getY(), size * displayWidth/150, size * displayWidth/90);
  }
  
  //void move(float X, float Y){
  //  setX(x+X);
  //  setY(y+Y);
  //  rotate(PI/12);
  //}

}
