class Jaws extends Monster{
  int countdown; 
  boolean at2 = false;
  String[] dialogue = {"Nom nom nom", "*eating noises*", "Throw me the idol!"};
  String currentSentence = " "; 
  ArrayList<Pellet> pellets; 
  int displayCount = 0;
  
  public Jaws(){
    name = "Indiana Jaws";
    HP = 20;
    AT = 3;
    exp = (int)(Math.random() * 4) + 2; 
    gold = (int)(Math.random() * 6) + 10; 
    pellets = new ArrayList<Pellet>(); 
    countdown = 400; 
    String[] temp = {"Indiana Jaws dances to Jaws music", "Indiana Jaws dances to Indiana Jones music", "Indiana Jaws licks his lips"}; 
    update = temp;
  }
  
  void display(){
    int W = displayWidth; 
    int H = displayHeight;
    PImage jaws;
    if (displayCount <= 10){
      jaws = loadImage("Jaws1.png");
    }
    else if(displayCount <= 20){
      jaws = loadImage("Jaws2.png");
    }
    else if(displayCount <= 30){
      jaws = loadImage("Jaws3.png");
    }
    else if(displayCount <= 40){
      jaws = loadImage("Jaws4.png");
    }
    else{
      displayCount = 0;
      jaws = loadImage("Jaws4.png");
    }
    jaws.resize(jaws.width*W/450, jaws.height*W/450);
    image(jaws,W/2.45,H/8.5);
    displayCount++;
  }
 
  void attack1(){
    
  }
}
