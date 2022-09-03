public class Screen {
  int loadTime = 0; 
  int nextScreenTime; 
  int prevScreenTime; 
  float upBorder, downBorder, leftBorder, rightBorder; 
  String scene; 
  boolean rBDisable = true;
  boolean lBDisable = false; 
  
  Screen(String sce, int lT, float uB, float dB, float lB, float rB) {
    scene = sce; 
    if (sce.equals("forest") || sce.equals("snowy")) {
      nextScreenTime = 320;
      prevScreenTime = 1; 
      rBDisable = false; 
      lBDisable = true; 
    }
    loadTime = lT;
    upBorder = uB;
    downBorder = dB;
    leftBorder = lB; 
    rightBorder = rB; 
  }
  
  void loading() {
    loadTime -= 1; 
  }
  
  String getScene() {
    return scene; 
  }
  
  float[] getLocation(Player pl) {
    float[] res = new float[2]; 
    res[0] = pl.x;
    res[1] = pl.y;
    return res;
  }
  
  char inBorder(Player pl) {
    float[] temp = getLocation(pl);
    if ((lBDisable || temp[0] > leftBorder) && (rBDisable || temp[0] < rightBorder)) {
      if (temp[1] > upBorder && temp[1] < downBorder) {
        return 'a';  
      }
      if (temp[1] <= upBorder) {
        return 'u';
      }
      if (temp[1] >= downBorder) {
        return 'd';
      }
    }
    if (!lBDisable && temp[0] >= leftBorder) {
      return 'l';
    }
    //if (!rBDisable && temp[0] >= rightBorder) {
    else {  
      return 'r';
    }
  }
  
  void setScene(String sce) {
    scene = sce; 
  }
}
