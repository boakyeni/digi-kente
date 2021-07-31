class Element {
  /*
   * Elements are patterns found on patches. They can have multiple
   * colors. 
   */
  PVector position;
  ArrayList<Integer> colors;
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
  
  void display(){
    
  }
  

}
class PixelArrow extends Element {
  ArrayList<Rectangle> rectArray;
  float arrowWidth = width/8;
  float rectWidth = width/56;
  float rectHeight = height/32;
  float changeY = rectHeight/2;
  PixelArrow(PVector loc){
    super(loc);
    rectArray = new ArrayList<Rectangle>();
    float newX = 0, newY = 0;
    //Rectangles are in preorder
    for(int i = 0; i < 7; i++){
      color c = color(255,0,0);
      rectArray.add(new Rectangle(loc.x, loc.y, rectWidth, rectHeight));
      rectArray.get(i).setColor(c);
      rectArray.get(i).shape.setStroke(c);
      if(i==4){
        newX = 0;
        newY = 0;
      }
    
      if ( i < 4 && i!=0){
        newX += -rectArray.get(i).rectWidth;
        newY += rectArray.get(i).rectHeight/2;
        rectArray.get(i).setPosition(newX, newY);
      } else if (i >=4) {
        newX += rectArray.get(i).rectWidth;
        newY += rectArray.get(i).rectHeight/2;
        rectArray.get(i).setPosition(newX, newY);
      }
    }
    
  }

  
  void display(){
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
