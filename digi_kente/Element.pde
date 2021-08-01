class Element {
  /*
   * Elements are patterns found on patches. They can have multiple
   * colors. 
   */
  PVector position;
  ArrayList<Integer> colors;
  ArrayList<Shape> shapeArray;
  Element(PVector loc){
    position = new PVector(loc.x,loc.y);
    colors  = new ArrayList<Integer>();
  }
  //teleport
  void place(float x,float y) {
    position.x = x;
    position.y = y;
    
  }
  //drag
  void move(){
  }
  
  
  float getX (){ return position.x; }
  float getY (){ return position.y; }
  
  
  void display(){
    
  }
  void setColor(ArrayList<Integer> c) { colors = c; }
  void chooseColor(color c){
    colors.add(c);
    for(Shape r: shapeArray){
      r.setColor(c);
      r.setStrokeColor(c);
    }
  }
    
  void offSet(float x, float y) {
    for(Shape s: shapeArray){s.offSet(x,y);}
  }
  
  void speedUp(PVector velocity, PVector acceleration){
    }
  

}
class PixelArrow extends Element {
  ArrayList<Rectangle> rectArray;
  float arrowWidth = width/8;
  float rectWidth = width/56;
  float rectHeight = height/32;
  float arrowHeight = (5/2)*rectHeight;
  float changeY = rectHeight/2;
  Patch boundary;
  PixelArrow(PVector loc, Patch bounds){
    super(loc);
    boundary = bounds;
    rectArray = new ArrayList<Rectangle>();
    
    //Rectangles are in preorder
    for(int i = 0; i < 7; i++){
      color c = color(120,0,0);
      rectArray.add(new Rectangle(loc.x, loc.y, rectWidth, rectHeight));
      rectArray.get(i).setColor(c);
      rectArray.get(i).setStrokeColor(c);
      //centers first shape
      if(i==0){
       Rectangle current = rectArray.get(i);
       this.position = new PVector(bounds.getPatchWidth()/2 - current.getWidth()/2,0);
       current.setPosition(position.x,position.y);
      
      }//builds rest offset to first
      if(i==4){
        Rectangle previous = rectArray.get(0);
        Rectangle current = rectArray.get(i);
        float previousX = previous.position.x;
        float previousY = previous.position.y;
        
        current.setPosition(previousX+current.getWidth(), 
                              previousY+current.getHeight()/2);
      }
    
      if ( i < 4 && i!=0){
        Rectangle previous = rectArray.get(i-1);
        Rectangle current = rectArray.get(i);
        float previousX = previous.position.x;
        float previousY = previous.position.y;
        
        current.setPosition(previousX-current.getWidth(), 
                              previousY+current.getHeight()/2);
      } else if (i > 4) {
        Rectangle previous = rectArray.get(i-1);
        Rectangle current = rectArray.get(i);
        float previousX = previous.position.x;
        float previousY = previous.position.y;
        
        current.setPosition(previousX+current.getWidth(), 
                              previousY+current.getHeight()/2);
      }
    }
    
  }
  //choose amount to shift element by
  void offSet(float x, float y) {
    for(Shape s: rectArray){
      s.offSet(x,y);
    }
  }
  
  
  void chooseColor(color c){
    colors.add(c);
    for(Rectangle r: rectArray){
      r.setColor(c);
      r.setStrokeColor(c);
    }
  }
  
  /*
   * Pass in an array of colors, go through all shapes that make the
   * array and changes them to the same color, picks a random color from array
   */
  
  
  void setColor(ArrayList<Integer> c){
    super.setColor(c);
    int pickColor = (int)random(0,colors.size()-1);
    for(Rectangle r: rectArray){
      r.setColor(colors.get(pickColor));
      r.setStrokeColor(colors.get(pickColor));
    }
  }
  
  
  float getRectHeight() {
    return rectHeight;
  }
  
  float getRectY() {
   return rectArray.get(0).getY(); 
  }
  
  
  float getArrowHeight(){
   float aHeight=0;
   double mid = Math.floor(rectArray.size()/2);
   for(int i = 0; i <= mid; i++){
     aHeight += rectArray.get(i).getHeight();
   }
   return aHeight; 
  }
  

  /*
   *  Elements position is in reference to the top left corner of 
   *  the patch they are located on.
   */
  void display(){
    
   // translate(boundary.xCord,boundary.yCord);
    for(Rectangle r: rectArray){
      r.display();
    }
    
  }
  
}
  
  

//class Stairs extends Element {
  /*
   * Stairs have a number of steps that can vary
   * 
   */
 // Stairs(float w, float h, int steps){
//  }
//}
