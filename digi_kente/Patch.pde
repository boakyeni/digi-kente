class Patch {
  /*
   * A Patch is a set of elements. The patch determines
   * whether the elements are static or if they move. And 
   * where the elements are placed in the patch.
   */
  float xCord, yCord, patchWidth, patchHeight;
  ArrayList<Element> elements = new ArrayList<Element>();
  Patch(float x, float y) {
    xCord = x;
    yCord = y;
    patchWidth = width/8;
    patchHeight = height/4;
    
  }
  float lineYCord = 0;
  //draw faint slighly spaced lines over patch 
  void linesOverlay(color c){
    pushMatrix();
    translate(xCord, yCord);
    while( lineYCord < patchHeight){
      smooth();
      stroke(c, 70);
      line(0, lineYCord, patchWidth, lineYCord);
      lineYCord += random(0,10);
    }
    popMatrix();
  }
  
  void display() {
    noFill();
    rect(xCord, yCord, patchWidth, patchHeight);
    
  }
  /*
  void update() {
   for(Element e: elements) e.update();
  }*/
}
