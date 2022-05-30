public class Screen {
  int loadTime = 0; 
  int screenTime; 
  float upBorder, downBorder, leftBorder, rightBorder; 
  String scene; 
  
  Screen(String sce, int lT) {
    scene = sce; 
    if (sce.equals("forest") || sce.equals("snowy")) {
      screenTime = 320;
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
