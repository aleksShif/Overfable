public class Screen {
  int loadTime = 0; 
  int nextScreenTime; 
  int prevScreenTime; 
  float upBorder, downBorder, leftBorder, rightBorder; 
  String scene; 
  
  Screen(String sce, int lT) {
    scene = sce; 
    if (sce.equals("forest") || sce.equals("snowy")) {
      nextScreenTime = 320;
      prevScreenTime = 1; 
    }
    loadTime = lT;
  }
  
  void loading() {
    loadTime -= 1; 
  }
  
  String getScene() {
    return scene; 
  }
  
  void setScene(String sce) {
    scene = sce; 
  }
}
