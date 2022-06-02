class TrapHeart extends Heart{
  int level = 2;
  
  TrapHeart() {
    super();
  }
  void display(float x, float y, float varW, float varH) {
    if(inv && (millis() - hitTime) % 2 == 0){
      fill(237, 245, 7);
    }
    else if(p.preCombat && h.combatFlash > 0) {
      fill(237, 245, 7); 
      combatFlash -= 1; 
    }else{
      fill(237, 245, 7);
    }
    noStroke();
    if (dead && !inv) {
      beginShape (POLYGON);
      vertex (x+8*varW/16, y+4*varH/16);
      vertex (x+8*varW/16, y+3*varH/16);
      vertex (x+4*varW/16, y+3*varH/16);
      vertex (x+4*varW/16, y+4*varH/16);
      vertex (x+3*varW/16, y+4*varH/16);
      vertex (x+3*varW/16, y+5*varH/16); 
      vertex (x+2*varW/16, y+5*varH/16); 
      vertex (x+2*varW/16, y+9*varH/16); 
      vertex (x+3*varW/16, y+9*varH/16); 
      vertex (x+3*varW/16, y+10*varH/16); 
      vertex (x+4*varW/16, y+10*varH/16); 
      vertex (x+4*varW/16, y+11*varH/16); 
      vertex (x+5*varW/16, y+11*varH/16); 
      vertex (x+5*varW/16, y+12*varH/16); 
      vertex (x+6*varW/16, y+12*varH/16); 
      vertex (x+6*varW/16, y+13*varH/16); 
      vertex (x+7*varW/16, y+13*varH/16); 
      vertex (x+7*varW/16, y+14*varH/16); 
      vertex (x+8*varW/16, y+14*varH/16); 
      vertex (x+8*varW/16, y+15*varH/16); 
      vertex (x+9*varW/16, y+13*varH/16);  
      vertex (x+8*varW/16, y+11*varH/16);  
      vertex (x+10*varW/16, y+9*varH/16);  
      vertex (x+8*varW/16, y+7*varH/16);  
      vertex (x+9*varW/16, y+5*varH/16);  
      endShape (CLOSE); 
      
      beginShape (POLYGON); 
      vertex (x+12*varW/16, y+5*varH/16); 
      vertex (x+11*varW/16, y+7*varH/16); 
      vertex (x+12*varW/16, y+9*varH/16); 
      vertex (x+10*varW/16, y+11*varH/16); 
      vertex (x+12*varW/16, y+13*varH/16); 
      vertex (x+11*varW/16, y+15*varH/16); 
      vertex (x+15*varW/16, y+12*varH/16); 
      vertex (x+15*varW/16, y+11*varH/16); 
      vertex (x+16*varW/16, y+11*varH/16); 
      vertex (x+16*varW/16, y+10*varH/16); 
      vertex (x+17*varW/16, y+10*varH/16); 
      vertex (x+17*varW/16, y+9*varH/16); 
      vertex (x+18*varW/16, y+9*varH/16); 
      vertex (x+18*varW/16, y+5*varH/16); 
      vertex (x+17*varW/16, y+5*varH/16); 
      vertex (x+17*varW/16, y+4*varH/16); 
      vertex (x+16*varW/16, y+4*varH/16); 
      vertex (x+16*varW/16, y+3*varH/16); 
      vertex (x+12*varW/16, y+3*varH/16); 
      vertex (x+12*varW/16, y+4*varH/16); 
      vertex (x+10*varW/16, y+4*varH/16); 
      endShape (CLOSE); 
    }
    else {
      beginShape (POLYGON);
      vertex (x+8*varW/16, y+4*varH/16);
      vertex (x+8*varW/16, y+3*varH/16);
      vertex (x+4*varW/16, y+3*varH/16);
      vertex (x+4*varW/16, y+4*varH/16);
      vertex (x+3*varW/16, y+4*varH/16);
      vertex (x+3*varW/16, y+5*varH/16);
      vertex (x+2*varW/16, y+5*varH/16);
      vertex (x+2*varW/16, y+9*varH/16);
      vertex (x+3*varW/16, y+9*varH/16);
      vertex (x+3*varW/16, y+10*varH/16);
      vertex (x+4*varW/16, y+10*varH/16);
      vertex (x+4*varW/16, y+11*varH/16);
      vertex (x+5*varW/16, y+11*varH/16);
      vertex (x+5*varW/16, y+12*varH/16);
      vertex (x+6*varW/16, y+12*varH/16);
      vertex (x+6*varW/16, y+13*varH/16);
      vertex (x+7*varW/16, y+13*varH/16);
      vertex (x+7*varW/16, y+14*varH/16);
      vertex (x+8*varW/16, y+14*varH/16);
      vertex (x+8*varW/16, y+15*varH/16);
      vertex (x+10*varW/16, y+15*varH/16);
      vertex (x+10*varW/16, y+14*varH/16);
      vertex (x+11*varW/16, y+14*varH/16);
      vertex (x+11*varW/16, y+13*varH/16);
      vertex (x+12*varW/16, y+13*varH/16);
      vertex (x+12*varW/16, y+12*varH/16);
      vertex (x+13*varW/16, y+12*varH/16);
      vertex (x+13*varW/16, y+11*varH/16);
      vertex (x+14*varW/16, y+11*varH/16);
      vertex (x+14*varW/16, y+10*varH/16);
      vertex (x+15*varW/16, y+10*varH/16);
      vertex (x+15*varW/16, y+9*varH/16);
      vertex (x+16*varW/16, y+9*varH/16);
      vertex (x+16*varW/16, y+5*varH/16);
      vertex (x+15*varW/16, y+5*varH/16);
      vertex (x+15*varW/16, y+4*varH/16);
      vertex (x+14*varW/16, y+4*varH/16);
      vertex (x+14*varW/16, y+3*varH/16);
      vertex (x+10*varW/16, y+3*varH/16);
      vertex (x+10*varW/16, y+4*varH/16);
      vertex (x+8*varW/16, y+4*varH/16);
      endShape (CLOSE); 
    }
  }
}
