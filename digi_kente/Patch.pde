class Patch {
  /*
   * A Patch is a set of elements. The patch determines
   * whether the elements are static or if they move. And 
   * where the elements are placed in the patch.
   */
  float xCord, yCord, patchWidth, patchHeight;
  float lineYCord = 0;
  ArrayList<Element> elements = new ArrayList<Element>();
  Patch(float x, float y) {
    xCord = x;
    yCord = y;
    patchWidth = width/8;
    patchHeight = height/4;
    
  }
  
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
  
  float getPatchWidth() {return patchWidth;}
  float getPatchHeight() {return patchHeight;}
  
  void display() {
    noFill();
    stroke(0);
    smooth();
    strokeWeight(3);
    rect(xCord, yCord, patchWidth, patchHeight);
    
  }
  
  void update(){
    
  }
}


/*
 * This patch has rolling pixel arrow bows
 */
class ArrowPatch extends Patch {
  ArrayList<PixelArrow> bows;
  PVector loc;
  float clearance; 
  ArrowPatch(float x,float y){
   super(x,y); 
   bows = new ArrayList<PixelArrow>();
   loc = new PVector(this.patchWidth/2,0);
   for(int i =0; i < 5; i++){
     //location input relative to top left of top pixel square
     bows.add(new PixelArrow(loc,this));
     PixelArrow current = bows.get(i);
     float spacing = 2*i*current.getRectHeight();
     current.offSet(0, spacing);
   }
   bows.get(0).chooseColor(color(0,64,0));
   bows.get(3).chooseColor(color(0,64,0));
  }
  /*
   * Sets the colors of the elements of the patch to 
   * random choice from the passed in array
   */
  
  void setColors(ArrayList<Integer> c){
    for(PixelArrow pa: bows){
      pa.setColor(c); 
    }
  }
  
  
    /*
     * If i want to fill in the bottom arrow i'd need a 
     * clearance variable of some sort so it knows when to
     * turn back into an arrow from a pixel triangle
     * printing the arrows in patch
     */
  void display(){
    super.display();
    pushMatrix();
    translate(xCord,yCord);
    //changing by individual rectangles instead of entire element
    for(int i = 0; i < bows.size(); i++){
       PixelArrow current = bows.get(i);
       for(int j = 0; j < current.rectArray.size(); j++){
         Rectangle r = current.rectArray.get(j);
         //only portion of arrow in patch is visible at bottom
          if((r.getY()+r.getHeight())>=(this.patchHeight-1)){
             r.setHeight(this.patchHeight - r.getY());}
          if (r.getHeight() > current.getRectHeight()) {
             r.setHeight(current.getRectHeight());}
          //once at the top make go transparent, print new rect to give effect
          if(r.getY() < 0){
            r.setHeight(0);
            float newHeight = r.getY() + current.getRectHeight();
            //draw partial rectangles at top of patch
            if(newHeight>0){
              stroke(r.getStrokeColor());
              fill(r.getColor());
              rect(r.getX(), 0, r.getWidth(), newHeight );
              //change rectangles heights individually to avoid jumps
            } else {
              //wrap around to bottome of the patch
                if(i!=0){
                  r.setPosition(r.getX(), bows.get(i-1).rectArray.get(j).getY() 
                                                  + 2*current.getRectHeight());
                }else{
                  r.setPosition(r.getX(), bows.get(4).rectArray.get(j).getY() 
                                                  + 2*current.getRectHeight());
                }
            }
          }  
        }
        current.display();
     }
     popMatrix();
  }
  
 
  // moves arrows up to wrap around
  void update(){
    //give the arrows some velocity
    for(Element arrow: bows){
      //offset for x,y/ speedUp for vectors
      arrow.offSet(0,-0.2);
    }
  }
}
  
  
  
