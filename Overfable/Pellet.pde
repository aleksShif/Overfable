public class Pellet extends Damageable{ 
  PImage hawk; 
  PImage smokeGlass; 
  PImage fin;
  PImage whip;  
  PImage katana;
  PImage finalHat; 
  PImage hat, hat2, hat3, hat4, hat5, hat6, hat7, hat8, hat9, hat10; 
  PImage finalSnake; 
  PImage snake, snake2, snake3, snake4, snake5, snake6, snake7, snake8; 
  PImage finalBanana;   
  PImage banana, banana2, banana3, banana4; 
  PImage cannon;
  PImage cball;
  PImage cutlass;
  PImage branchL1 = loadImage("BranchL1.png"); 
  PImage branchR1 = loadImage("BranchR2.png");
  PImage branchL2 = loadImage("BranchL2.png");
  PImage branchR2 = loadImage("BranchR2.png");
  PImage branchL3 = loadImage("BranchL3.png");
  PImage branchR3 = loadImage("BranchR3.png");
  PImage finalBranch = branchL1; 
  //String filename;
  String side; 
  float size;
  boolean isAt1 = false; 
  boolean heartIm = false; 
  boolean turn = false;
  boolean next = false; 
  int immobileTime = 0; 
  int count = 0;
  float X = ourDisplayX/3.36;
  boolean right = true;
  boolean up = true;
  boolean finFinished = false;
  boolean upCan = true;
  String name;
  int ranum = 3;
  float bx, by;

  
  Pellet(String file, float hX, float hY, float X, float Y, int at){
    setAT(at);
    setHitboxX(hX);
    setHitboxY(hY);
    setX(X);
    setY(Y); 
    filename = file; 
    if (filename.equals("hiddenKatana.png")) {
      katana = loadImage(filename);     
    }
    if (filename.equals("Hawkson1.png")) {
      hawk = loadImage(filename);
    }
    if (filename.equals("Cannon1.png")) {
      cannon = loadImage(filename);     
    }    
    if (filename.equals("miniSnake.png")) {
      snake = loadImage(filename);
      snake.resize(snake.width/6, snake.height/6); 
      snake2 = loadImage("miniSnake2.png");
      snake2.resize(snake2.width/6, snake2.height/6); 
      snake3 = loadImage("miniSnake3.png");
      snake3.resize(snake3.width/6, snake3.height/6);       
      snake4 = loadImage("miniSnake4.png");
      snake4.resize(snake4.width/6, snake4.height/6);
      snake5 = loadImage("miniSnake5.png");
      snake5.resize(snake5.width/6, snake5.height/6);
      snake6 = loadImage("miniSnake6.png");
      snake6.resize(snake6.width/6, snake6.height/6);
      snake7 = loadImage("miniSnake7.png");
      snake7.resize(snake7.width/6, snake7.height/6);
      snake8 = loadImage("miniSnake8.png");
      snake8.resize(snake8.width/6, snake8.height/6);
      finalSnake = snake; 
    }
    if (filename.equals("Banana1.png")) {
      banana = loadImage(filename);
      //banana.resize((int)(banana.width/1.4), (int)(banana.width/1.4)); 
      banana2 = loadImage("Banana2.png"); 
      //banana2.resize((int)(banana2.width/1.4), (int)(banana2.width/1.4));
      banana3 = loadImage("Banana3.png");
      //banana3.resize((int)(banana3.width/1.4), (int)(banana3.width/1.4));
      banana4 = loadImage("Banana4.png");
      //banana4.resize((int)(banana3.width/1.4), (int)(banana3.width/1.4)); 
      finalBanana = banana; 
    }
    if (filename.equals("hat.png")) {
      hat = loadImage("hat.png");
      hat.resize((int)(hat.width/4.5), (int)(hat.height/4.5));    
      hat2 = loadImage("hat2.png");
      hat2.resize((int)(hat2.width/4.5), (int)(hat2.height/4.5));          
      hat3 = loadImage("hat3.png");
      hat3.resize((int)(hat3.width/4.5), (int)(hat3.height/4.5));          
      hat4 = loadImage("hat4.png");
      hat4.resize((int)(hat4.width/4.5), (int)(hat4.height/4.5));          
      hat5 = loadImage("hat5.png");
      hat5.resize((int)(hat5.width/4.5), (int)(hat5.height/4.5));          
      hat6 = loadImage("hat6.png");
      hat6.resize((int)(hat6.width/4.5), (int)(hat6.height/4.5));          
      hat7 = loadImage("hat7.png");
      hat7.resize((int)(hat7.width/4.5), (int)(hat7.height/4.5));          
      hat8 = loadImage("hat8.png");
      hat8.resize((int)(hat8.width/4.5), (int)(hat8.height/4.5));          
      hat9 = loadImage("hat9.png");
      hat9.resize((int)(hat9.width/4.5), (int)(hat9.height/4.5));    
      hat10 = loadImage("hat10.png");
      hat10.resize((int)(hat10.width/4.5), (int)(hat10.height/4.5));    
      finalHat = hat;       
    }
    if (filename.equals("BranchL1.png")) {
      finalBranch = branchL1;  
    }
    if (filename.equals("BranchL2.png")) {
      branchL2.resize(branchL2.width + 70, branchL2.height); 
      finalBranch = branchL2;  
    }
    if (filename.equals("BranchL3.png")) {
      finalBranch = branchL3;  
    }
    if (filename.equals("BranchR1.png")) {
      branchR1.resize(branchR1.width + 70, branchR1.height);
      finalBranch = branchR1;  
    }
    if (filename.equals("BranchR2.png")) {
      finalBranch = branchR2;  
    }
    if (filename.equals("BranchR3.png")) {
      finalBranch = branchR3;   
    }
    fill(255);
  }
  
  Pellet(String file, boolean hM) {
    setAT(5); 
    setX(ourDisplayX/2.336);
    setY(ourDisplayY/12);  
    heartIm = hM; 
    filename = file;
  }
  Pellet(int at, float X, float Y, float Size){
    size = Size;
    setX(X);
    setY(Y);
    setAT(at);
    setHitboxX(ourDisplayX/150);
    setHitboxY(ourDisplayX/90);
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
    int W = ourDisplayX; 
    int H = ourDisplayY; 
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
      ellipse(getX(),getY(), size * ourDisplayX/150, size * ourDisplayX/90);
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
      hawk.resize((int)(hawk.width*1.5), (int)(hawk.height*1.5));
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
      hawk.resize((int)(hawk.width*1.5), (int)(hawk.height*1.5));
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
      hawk.resize((int)(hawk.width*1.5), (int)(hawk.height*1.5));
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
      hawk.resize((int)(hawk.width*1.5), (int)(hawk.height*1.5));
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
      hawk.resize((int)(hawk.width*1.5), (int)(hawk.height*1.5));
      image(hawk,x,y);
    }
  }
  
  void displaySmoke(int phase) {
    int W = ourDisplayX;
    int H = ourDisplayY;
    if (phase < 30) {
      heartIm = true; 
      filename = "smoke1.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/4, smokeGlass.height/4);
      image(smokeGlass, x, y+60); 
    }
    else if (phase < 36) {
      heartIm = true;      
      filename = "smoke2.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/4, smokeGlass.height/4); 
      image(smokeGlass, x-W/106.667, y+H/45);
    }
    else if (phase < 42) {
      heartIm = true;      
      filename = "smoke3.png"; 
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/4, smokeGlass.height/4);  
      image(smokeGlass, x-W/96.9697, y-H/36);
    }
    else if (phase < 48) {
      heartIm = true;      
      filename = "smoke4.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/4, smokeGlass.height/4); 
      image(smokeGlass, x-W/86.486, y-H/30);
    }
    else if (phase < 54) {
      heartIm = true;      
      filename = "smoke5.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/4, smokeGlass.height/4);  
      image(smokeGlass, x-W/58.182, y-H/23.077);
    }
    else if (phase < 125) {
      heartIm = true;      
      filename = "smoke6.png";
      smokeGlass = loadImage(filename); 
      smokeGlass.resize(smokeGlass.width/4, smokeGlass.height/4);   
      image(smokeGlass, x-W/86.486, y-H/31.034);
    }
    else if (phase < 135) {
      heartIm = true;      
      filename = "smallGlass.png";
      smokeGlass = loadImage(filename); 
      if (phase >= 125 && phase < 130) {
        smokeGlass.resize((int)(smokeGlass.width/2), (int)(smokeGlass.height/2));
      }
      else if (phase >= 130 && phase < 135) {
        smokeGlass.resize((int)(smokeGlass.width/2+W/160), (int)(smokeGlass.height/2+H/90));
      }
      image(smokeGlass, x+W/45.714, y-H/27.692);
      h.display(h.x, h.y, ourDisplayX/38.4, ourDisplayY/21.6,heartMode); 
    }
    else if (phase < 260) {
      heartIm = false; 
      filename = "bigGlass.png";
      smokeGlass = loadImage(filename); 
      if (phase >= 160 && phase < 170) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/160), (int)(smokeGlass.height / 1.1 - H/90));        
      }
      else if (phase >= 170 && phase < 180) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/80), (int)(smokeGlass.height / 1.1 - H/45));       
      }
      else if (phase >= 180 && phase < 190) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/53.333), (int)(smokeGlass.height / 1.1 - H/30));        
      }
      else if (phase >= 190 && phase < 200) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/40), (int)(smokeGlass.height / 1.1 - H/22.5));        
      }
      else if (phase >= 200 && phase < 210) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/32), (int)(smokeGlass.height / 1.1 - H/18));        
      }
      else if (phase >= 210 && phase < 220) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/24.615), (int)(smokeGlass.height / 1.1 - H/13.846));        
      } 
      else if (phase >= 220 && phase < 230) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/20), (int)(smokeGlass.height / 1.1 - H/11.25));        
      }
      else if (phase >= 230 && phase < 240) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/17.778), (int)(smokeGlass.height / 1.1 - H/10));       
      } 
      else if (phase >= 240 && phase < 250) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/16), (int)(smokeGlass.height / 1.1 - H/9));        
      }
      else if (phase >= 250 && phase < 260) {
        smokeGlass.resize((int)(smokeGlass.width / 1.1 - W/13.913), (int)(smokeGlass.height / 1.1 - H/7.826));        
      }       
      else {
        smokeGlass.resize((int)(smokeGlass.width / 1.1), (int)(smokeGlass.height / 1.1));
      }
      image(smokeGlass, x+W/160, y-H/18);
      setHitboxX(smokeGlass.width - W/12.8); 
      setHitboxY(smokeGlass.height - H/5.143); 
      h.display(h.x, h.y, ourDisplayX/38.4, ourDisplayY/21.6,heartMode); 
    }
    else if (phase < 280) {
      setX(ourDisplayX/2.336);
      setY(ourDisplayY/12);
      filename = " "; 
    }
  }
  
  void displayKatana() {
    int W = ourDisplayX;
    int H = ourDisplayY;
    katana = loadImage(filename);
    if (filename.equals("katana.png")) {
      katana.resize(katana.width/2, katana.height - 200);
    }
    else {
      katana.resize(katana.width/2, katana.height - 50);   
    }
    if (next == true && f.countdown % 10 != 0 && f.countdown % 10 > 5) { 
      image(katana, x, y - H/180); 
    }
    else {
      image(katana, x, y); 
    }
  }

  void displayFin(){
    if(right){
      fin = loadImage("JawsFin1.png");
      x += ourDisplayX/270;
    }
    else{
      fin = loadImage("JawsFin2.png");
      x -= ourDisplayX/270;
    }   
    fin.resize(fin.width, fin.height);
    if(count % 20 == 0){
      if(up){
        y -= ourDisplayY/90;
      }
      else{
        y += ourDisplayY/90;
      }
    }
    if(x > ourDisplayX/1.6 && right){
      right = false;
    }
    if(x < ourDisplayX/3.36 && !right){
      right = true;
    }
    if(y < ourDisplayY/2.4){
      up = false;
    }
    if(y > ourDisplayY/1.5 && !up){
      finFinished = true;
    }
    count++;
    image(fin,x,y);
  }
  
  void displayWhip(){
    if(count < 10){
      whip = loadImage("JawsWhipR.png");
    }
    else if(count < 20){
      whip = loadImage("JawsWhipC.png");
    }
    else if(count < 30){
      whip = loadImage("JawsWhipL.png");
    }
    else if(count < 40){
      whip = loadImage("JawsWhipC.png");
    }
    else{
      whip = loadImage("JawsWhipR.png");
      count = 0;
    }
    j.rectX += j.rectInc;
    if(j.rectX >= ourDisplayX/3.36 + ourDisplayX/2.5 - 540 && j.right){
      j.rectInc *= -1;
      j.right = false;
    }
    if(j.rectX <= ourDisplayX/3.36 - 460 && !j.right){
      j.rectX = ourDisplayX/3.36-460;
      j.whipFinished = true;
    }
    count++;
    whip.resize(whip.width*5, whip.height*2);
    image(whip, j.rectX, j.rectY);    
  }
  
  void displayHat(int phase) {
    if (count > 1) {
      if (finalHat == hat) {
        finalHat = hat2; 
      }
      else if (finalHat == hat2) {
        finalHat = hat3;
      }
      else if (finalHat == hat3) {
        finalHat = hat4;
      }
      else if (finalHat == hat4) {
        finalHat = hat5;
      }
      else if (finalHat == hat5) {
        finalHat = hat6;
      }      
      else if (finalHat == hat6) {
        finalHat = hat7;
      }      
      else if (finalHat == hat7) {
        finalHat = hat8;
      }      
      else if (finalHat == hat8) {
        finalHat = hat9;
      }      
      else if (finalHat == hat9) {
        finalHat = hat10;
      }                      
    }
    else {
      finalHat = hat;  
    }
    count += 1;
    if (count > 10) {
      count = 1;
    }
    if (phase < 40) {
      if (turn) {
        move(-15, 0);
      }
      else {
        move(15, 0);
      }
      image(finalHat, x, y);        
    }
  }
  
  void displaySnake() {
    image(finalSnake, x, y); 
  }
  
  void displayCannon(){
    if(count < 15){
      cannon = loadImage("Cannon1.png");
    }
    else if (count < 30){
      cannon = loadImage("Cannon2.png");
    }
    else if (count < 45){
      cannon = loadImage("Cannon3.png");
    }
    else if (count < 60){
      cannon = loadImage("Cannon4.png");
    }
    else if (count < 75){
      cannon = loadImage("Cannon5.png");
    }
    else if (count < 90){
      cannon = loadImage("Cannon6.png");
    }
    else{
      cannon = loadImage("Cannon1.png");
      count = 0;
    }
    cannon.resize((int)(cannon.width * 2.1),(int)(cannon.height * 2.1));
    image(cannon, bb.canX, bb.canY);
    count++;
    if(bb.canY <= ourDisplayY/2.4 && upCan){
      upCan = false;
    }
    else if(bb.canY >= ourDisplayY/2.4 + 240 && !upCan){
      upCan = true;
    }
    if(upCan){
      bb.canY -= 5;
    }
    else{
      bb.canY += 5;
    }
    X = bb.canX;
    y = bb.canY;
  }
  
  void displayCBall(){
    cball = loadImage("Cannonball.png");
    cball.resize((int)(cball.width*0.1), (int)(cball.height*0.1));
    x=bb.cbx;
    y=bb.cby;
    image(cball,x,y);
    bb.cbx += 15;
    bb.cby -= bb.cbyv;
    bb.cbyv -= 0.4;
    if(!inside()){
       bb.cbx = 500;
       bb.cby = bb.canY;
       bb.cbyv = 5;
    }
  }
  
  void displayCutlass(int d){//1 = up, 2 = down, 3 = right, 4 = left, 5 = upright, 6 = upleft, 7 = downright, 8 = downleft
    if(d == 1){
      cutlass = loadImage("CutlassUp.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.midx, bb.upy);
      x = bb.midx;
      y = bb.upy;
      bb.upy-=10;
      if(!(bb.cutlassUp.inside()) && y < ourDisplayY/2){
        bb.diagonal = true;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
    else if(d == 2){
      cutlass = loadImage("CutlassDown.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.midx, bb.downy);
      x = bb.midx;
      y = bb.downy;
      bb.downy+=10;
      if(!(bb.cutlassDown.inside()) && y > ourDisplayY/2){
        bb.diagonal = true;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
    else if(d == 3){
      cutlass = loadImage("CutlassRight.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.rightx, bb.midy);
      x = bb.rightx;
      y = bb.midy;
      bb.rightx+=10;
      if(!(bb.cutlassRight.inside()) && x > ourDisplayX/2){
        bb.diagonal = true;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
    else if(d == 4){
      cutlass = loadImage("CutlassLeft.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.leftx, bb.midy);
      x = bb.leftx;
      y = bb.midy;
      bb.leftx-=10;
      if(!(bb.cutlassLeft.inside()) && x < ourDisplayX/2){
        bb.diagonal = true;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
    else if(d == 5){
      cutlass = loadImage("CutlassUpright.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.rightx, bb.upy);
      x = bb.rightx;
      y = bb.upy;
      bb.rightx+=3;
      bb.upy-=3;
      if(!(bb.cutlassUpright.inside()) && y < ourDisplayY/2){
        bb.diagonal = false;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
    else if(d == 6){
      cutlass = loadImage("CutlassUpleft.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.leftx, bb.upy);
      x = bb.leftx;
      y = bb.upy;
      bb.leftx-=3;
      bb.upy-=3;
      if(!(bb.cutlassUpleft.inside()) && y < ourDisplayY/2){
        bb.diagonal = false;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
    else if(d == 7){
      cutlass = loadImage("CutlassDownright.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.rightx, bb.downy);
      x = bb.rightx;
      y = bb.downy;
      bb.rightx+=3;
      bb.downy+=3;
      if(!(bb.cutlassDownright.inside()) && y > ourDisplayY/2){
        bb.diagonal = false;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
    else if(d == 8){
      cutlass = loadImage("CutlassDownleft.png");
      cutlass.resize((int)(cutlass.width*0.4), (int)(cutlass.height*0.4));
      image(cutlass, bb.leftx, bb.downy);
      x = bb.leftx;
      y = bb.downy;
      bb.leftx-=3;
      bb.downy+=3;
      if(!(bb.cutlassDownleft.inside()) && y > ourDisplayY/2){
        bb.diagonal = false;
        bb.upy = bb.upY;
        bb.downy = bb.downY;
        bb.rightx = bb.rightX;
        bb.leftx = bb.leftX;
      }
    }
  }
  
  void displayBranch(){
    if(finalBranch == branchL1){
      image(branchL1, mk.Lx, mk.L1y);
      mk.L1y += 1;
      if(mk.L1y > 550){
        mk.L1y = mk.L1Y;
      }
    }
    else if(finalBranch == branchL2){
      image(branchL2, mk.Lx-10, mk.L2y);
      mk.L2y += 1;
      if(mk.L2y > 550){
        mk.L2y = mk.L1Y;
      }
    }
    else if(finalBranch == branchL3){
      image(branchL3, mk.Lx, mk.L3y);
      mk.L3y += 1;
      if(mk.L3y > 550){
        mk.L3y = mk.L1Y;
      }
    }
    else if(finalBranch == branchR1){
      image(branchR1, mk.Rx-40, mk.R1y);
      mk.R1y -= 1;
      if(mk.R1y < 200){
        mk.R1y = mk.R3Y;
      }
    }
    else if(finalBranch == branchR2){
      image(branchR2, mk.Rx, mk.R2y);
      mk.R2y -= 1;
      if(mk.R2y < 200){
        mk.R2y = mk.R3Y;
      }
    }
    else if(finalBranch == branchR3){
      image(branchR3, mk.Rx, mk.R3y);
      mk.R3y -= 1;
      if(mk.R3y < 200){
        mk.R3y = mk.R3Y;
      }
    }
  }
  //rect(W/3.36, H/2.4, W/2.46, H/2.57);

  void displayBanana(int c) {
    image(finalBanana, x, y); 
    if (finalBanana == banana && c % 15 == 0) {
      finalBanana = banana2;  
    }
    else if (finalBanana == banana2 && c % 15 == 0) {
      finalBanana = banana3;
    }
    else if (finalBanana == banana3 && c % 15 == 0) {
      finalBanana = banana4;
    }
    else if (finalBanana == banana4 && c % 15 == 0) {
      finalBanana = banana; 
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
  
  
  void move(float X, float Y){
    x += X; 
    y += Y; 
  }
  
  boolean getFinFinished(){
    return finFinished;
  }
  
  void reset(){
    x = ourDisplayX/2.7;
    y = ourDisplayY/2.7;
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
