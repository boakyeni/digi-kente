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
  PVector position(){
    PVector p = new PVector(xCord,yCord);
    return p;
  }
  float getPatchWidth() {
    return patchWidth;
  }
  float getPatchHeight() {
    return patchHeight;
  }
  
  void display() {
    noFill();
    stroke(0);
    rect(xCord, yCord, patchWidth, patchHeight);
    
  }
  /*
  void update() {
   for(Element e: elements) e.update();
  }*/
}
/*
 * This patch has rolling pixel arrow bows
 */
class ArrowPatch extends Patch {
  ArrayList<PixelArrow> bows;
  PVector loc;
  ArrowPatch(float x,float y){
   super(x,y); 
   bows = new ArrayList<PixelArrow>(5);
   loc = new PVector(this.patchWidth/2,0);
   for(int i =0; i < 5; i++){
     //location input relative to top left of top pixel square
     bows.add(new PixelArrow(loc,this));
     PixelArrow current = bows.get(i);
     float spacing = 2*i*current.getRectHeight();
     current.offSet(0, spacing);
   }
  }
  float clearance;
  void display(){
    super.display();
    //setting colors
    bows.get(0).chooseColor(color(0,255,0));
    bows.get(3).chooseColor(color(0,255,0));
    //printing only the arrows fully in patch
    for(int i = 0; i < 5; i++){
     PixelArrow current = bows.get(i);
     clearance = this.patchHeight - current.getArrowHeight();
     if(current.rectArray.get(0).getY() < clearance) current.display();
    }
    //printing the arrows partially in patch
    for(PixelArrow e: bows){
       PixelArrow current = e;
        if(current.rectArray.get(0).getY() < clearance){
          current.display();
        } else {
          for(Rectangle r: current.rectArray){
            if((r.getY()+r.getHeight())>(this.patchHeight)){
              r.setHeight(this.patchHeight - r.getY());
            }
        }
        current.display();
      }
        
    }
  } 
}
  
  
  
